package com.cga102g3.web.bid_activ.service.impl;

import com.cga102g3.core.util.JDBCUtil;
import com.cga102g3.core.util.JedisPoolUtil;
import com.cga102g3.web.bid_activ.dao.BidActivDao;
import com.cga102g3.web.bid_activ.dao.MemberDao;
import com.cga102g3.web.bid_activ.dao.WalletRecDao;
import com.cga102g3.web.bid_activ.dao.impl.BidActivDaoImpl;
import com.cga102g3.web.bid_activ.dao.impl.MemberDaoImpl;
import com.cga102g3.web.bid_activ.dao.impl.WalletRecDaoImpl;
import com.cga102g3.web.bid_activ.entity.*;
import com.cga102g3.web.bid_activ.service.BidGameService;
import com.cga102g3.web.bid_order.dao.BidOrderDao;
import com.cga102g3.web.bid_order.dao.impl.BidOrderDaoImpl;
import com.cga102g3.web.bid_order.entity.BidOrder;
import com.cga102g3.web.bid_prod.dao.BidProdDao;
import com.cga102g3.web.bid_prod.dao.impl.BidProdDaoImpl;
import com.cga102g3.web.book.dao.BookDao;
import com.cga102g3.web.book.dao.impl.BookDaoImpl;
import com.cga102g3.web.book.entity.Book;
import com.cga102g3.web.book.service.BookService;
import com.cga102g3.web.book.service.impl.BookServiceImpl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-25 下午 09:42
 */
public class BidGameServiceImpl implements BidGameService {
    private final BookDao bookDao = new BookDaoImpl();
    private final BidProdDao bidProdDao = new BidProdDaoImpl();
    private final BidActivDao bidActivDao = new BidActivDaoImpl();
    private final MemberDao memberDao = new MemberDaoImpl();
    private final WalletRecDao walletRecDao = new WalletRecDaoImpl();
    private final BidOrderDao bidOrderDao = new BidOrderDaoImpl();
    private final BookService bookService = new BookServiceImpl();

    @Override
    public Map<String, Object> getBidInfo(Integer bidID) {
        Map<String, Object> map = new HashMap<>();
        BidActiv bidActivity = bidActivDao.getBidActivity(bidID);
        if (bidActivity == null) {
            return null;
        }
        map.put("bidActivity", bidActivity);
        Integer bookID = bidActivity.getBookID();
        Book book = bookDao.selectByPrimaryKey(bookID);
        map.put("book", book);
        return map;
    }

    @Override
    public Bidder getCurWinner(Integer bidID) {
        Bidder curWinner = bidActivDao.getCurWinner(bidID);
        if (curWinner == null) {
            return new Bidder(-1, -1);
        }
        return curWinner;
    }

    @Override
    public boolean isBidderDirectGet(Integer mbrID, Integer bidID) {
        BidActiv bidActivity = bidActivDao.getBidActivity(bidID);
        if (bidActivity != null) {
            return bidActivity.getBidDirectPrice() <= memberDao.selectByIDWithTCoinBal(mbrID).gettCoinBal();
        }
        return false;
    }

    @Override
    public BidErrStat isEnableRaise(Bidder bidder, Integer bidID) {
        if (bidder == null) {
            return BidErrStat.NoBidder;
        }
        Bidder curWinner = bidActivDao.getCurWinner(bidID);
        BidActiv bidActivity = bidActivDao.getBidActivity(bidID);
        Member member = memberDao.selectByIDWithTCoinBal(bidder.getMbrID());
        // 錢包裡的錢 必須 大於或等於 自己的出價
        if (member == null || bidder.getPrice() > member.gettCoinBal()) {
            return BidErrStat.UnAffordable;
        }
        // 不可以超過直購價
        if (bidder.getPrice() > bidActivity.getBidDirectPrice()) {
            return BidErrStat.OverDirectPrice;
        }

        if (curWinner != null) {
            // 不可以自己壓過自己的出價
            if (bidder.getMbrID() != null && bidder.getMbrID().equals(curWinner.getMbrID())) {
                return BidErrStat.OverrideYourself;
            }
            return curWinner.getPrice() < bidder.getPrice() ? BidErrStat.Success : BidErrStat.NotWin;
        }
        // 低於底價
        if (bidActivity.getStartPrice() > bidder.getPrice()) {
            return BidErrStat.LowerStartPrice;
        }
        return BidErrStat.Success;
    }

    @Override
    public BidActivityStat raise(Bidder bidder, Integer bidID) {
        Bidder prevWinner = bidActivDao.getCurWinner(bidID);
        if (prevWinner != null && prevWinner.getMbrID().equals(bidder.getMbrID())) {
            return BidActivityStat.OVERRIDE;
        }
        // 先退款給前一個，再將本次投注金額加上
        try (Connection conn = JDBCUtil.getConnection();){
            // 開啟交易模式
            conn.setAutoCommit(false);
            try{
                // 退款
                if (prevWinner != null) {
                    memberDao.refund4bid(conn, prevWinner.getMbrID(), prevWinner.getPrice());
                    walletRecDao.refund4bid(conn, prevWinner.getMbrID(), prevWinner.getPrice());
                }

                // 扣款
                memberDao.prepaid4Bid(conn, bidder.getMbrID(), bidder.getPrice());
//                System.out.println(bidder);
                walletRecDao.prepaid4Bid(conn, bidder.getMbrID(), bidder.getPrice());

                // redis沒有rollback機制
                bidActivDao.updateRec(bidID, bidder);

                conn.commit();
                // 結束交易模式
                conn.setAutoCommit(true);

                if (bidder.getPrice().equals(bidActivDao.getBidActivity(bidID).getBidDirectPrice())) {
                    return BidActivityStat.ENDGAME;
                }


                return BidActivityStat.CONTINUED;
            } catch (SQLException se) {
                se.printStackTrace();
                try {
                    conn.rollback();
                } catch (SQLException excep) {
                    throw new RuntimeException("rollback error occurred. "
                            + excep.getMessage());
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return BidActivityStat.FAIL;
    }

    @Override
    public BidActivityStat participate(Bidder bidder, Integer bidID) {
        BidActivityStat stat = null;
        if (isEnableRaise(bidder, bidID) == BidErrStat.Success) {
            stat = raise(bidder, bidID);
        }
        if (stat == null) {
            return BidActivityStat.FAIL;
        }

        // 競標結束處理
        if (stat == BidActivityStat.ENDGAME) {
            BidActiv bidActivity = getBidActivity(bidID);
//            System.out.println("bidActivity: "+ bidActivity);
            persistActivRes(bidActivity);
            // 下架競標商品
            bidActivDao.delete(bidActivity.getBidActivID());
        }
        return stat;
     }

    @Override
    public BidActiv getBidActivity(Integer bidID) {
        return bidID != null ? bidActivDao.getBidActivity(bidID) : null;
    }

    @Override
    public void persistActivRes(BidActiv activity) {
        if (bidActivDao.getCurWinner(activity.getBidID()) != null) {
            // 若有人投標，則取出投標金額最高找並記錄，商品狀態邊更為結帳售出
            // 新增標訂單
            Bidder curWinner = bidActivDao.getCurWinner(activity.getBidID());
            Integer price = curWinner.getPrice();
            Integer mbrID = curWinner.getMbrID();
            try (Connection conn = JDBCUtil.getConnection();){
                // 開啟交易模式
                conn.setAutoCommit(false);
                try{
                    bidProdDao.updateStat2Sold(conn, activity.getBidID());
                    bidOrderDao.insert(conn, new BidOrder(activity.getBidID(), mbrID, price));
                    conn.commit();
                    // 結束交易模式
                    conn.setAutoCommit(true);
                } catch (SQLException se) {
                    se.printStackTrace();
                    try {
                        conn.rollback();
                    } catch (SQLException excep) {
                        throw new RuntimeException("rollback error occurred. "
                                + excep.getMessage());
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public Map<String, Object> getBooksByKeyword(String keyword, int page) {
        List<Map<String, Object>> bidInfoList = null;
        if (keyword == null || keyword.isEmpty()) {
            bidInfoList = bidActivDao.selectAllBidInfo(page);
            return getMapResult(bidInfoList, page);
        }

        String isbnOrTitle = bookService.isISBNOrTitle(keyword);
        if ("ISBN".equals(isbnOrTitle)) {
            bidInfoList = bidActivDao.selectBidInfoByISBN(keyword, page);
        } else {
            bidInfoList = bidActivDao.selectBidInfoByTitle(keyword, page);
        }
        return getMapResult(bidInfoList, page);
    }

    /**
     * 返回的形式為{
     *     nextPage: ?,
     *     data: list of bidInfo
     * }
     * @param bidInfoList
     * @param page
     * @return
     */
    private Map<String, Object> getMapResult(List<Map<String, Object>> bidInfoList, int page) {
        int nextPage = -1;
        Map<String, Object> res = new HashMap<>();
        if (bidInfoList.size() == 13) {
            nextPage = page + 1;
            bidInfoList.remove(bidInfoList.size()-1);
        }
        res.put("nextPage", nextPage);
        res.put("data", bidInfoList);
        return res;
    }


    public List<Bidder> getAllBidders(Integer bidID) {
        return bidActivDao.getAllBidders(bidID);
    }
    public static void main(String[] args) {
        BidGameService bidGameService = new BidGameServiceImpl();
        Bidder bidder1 = new Bidder(1, 210);
        Bidder bidder2 = new Bidder(2, 220);
        Bidder bidder3 = new Bidder(3, 230);
        if (bidGameService.isEnableRaise(bidder1, 1) == BidErrStat.Success) {
            bidGameService.raise(bidder1, 1);
        }
        if (bidGameService.isEnableRaise(bidder2, 1) == BidErrStat.Success) {
            bidGameService.raise(bidder2, 1);
        }
        if (bidGameService.isEnableRaise(bidder3, 1) == BidErrStat.Success) {
            bidGameService.raise(bidder3, 1);
        }


        // 關閉連接池
        JedisPoolUtil.shutdownJedisPool();
    }
}
