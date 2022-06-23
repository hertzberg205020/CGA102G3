package com.cga102g3.web.bid_record.dao;


import com.cga102g3.core.dao.CoreDao;
import com.cga102g3.web.bid_record.entity.BidRecord;

import java.util.List;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-10 下午 10:32
 */
public interface BidRecordDao extends CoreDao<BidRecord, Integer> {
    /**
     * 依出價會員編號查詢競標商品出價紀錄
     * @param mbrID
     * @param page
     * @return
     */
    List<BidRecord> selectByMbrID(Integer mbrID, Integer page);

    /**
     * 依競標商品編號查詢競標商品出價紀錄
     * @param bidID
     * @param page
     * @return
     */
    List<BidRecord> selectByBidID(Integer bidID, Integer page);
    List<BidRecord> selectAll(Integer page);
}
