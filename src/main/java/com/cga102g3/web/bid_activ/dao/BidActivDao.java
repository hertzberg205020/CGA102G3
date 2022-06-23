package com.cga102g3.web.bid_activ.dao;

import com.cga102g3.web.bid_activ.entity.BidActiv;
import com.cga102g3.web.bid_activ.entity.Bidder;

import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-22 下午 04:53
 */
public interface BidActivDao {
//    Set<String> ACTIVITIES = Collections.synchronizedSet(new HashSet<>());
//    Set<String> ACTIVITIES = new HashSet<>();
    void insert(BidActiv bidActiv);
    void delete(Integer bidID);
    List<BidActiv> getAll();
    void updateRec(Integer bidID, Bidder bidder);

    /**
     * 依競標商品編號查詢目前最高出價者以及出資金額
     * 回傳null表示沒人出價
     * @param bidID 競標商品編號
     * @return
     */
    Bidder getCurWinner(Integer bidID);

    /**
     * 依競標商品編號查詢所有投標人者以及出資金額
     * 回傳空list表示沒人出價
     * @param bidID
     * @return
     */
    List<Bidder> getAllBidders(Integer bidID);

    Set<String> getAllActivitiesIDs();
}
