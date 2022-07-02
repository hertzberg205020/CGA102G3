package com.cga102g3.web.bid_order.service.impl;

import com.cga102g3.web.bid_order.dao.BidOrderDao;
import com.cga102g3.web.bid_order.dao.impl.BidOrderDaoImpl;
import com.cga102g3.web.bid_order.service.BidOrderInfoService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-07-02 上午 11:30
 */
public class BidOrderInfoServiceImpl implements BidOrderInfoService {
    private final BidOrderDao dao = new BidOrderDaoImpl();
    @Override
    public Map<String, Object> getBidOrderInfo(Integer mbrID) {
        List<Map<String, Object>> bidOrderInfo = dao.selectByMbrID(mbrID);
        Map<String, Object> res = new HashMap<>();
        if (bidOrderInfo == null) {
            res.put("stat", "fail");
            return res;
        }
        if (bidOrderInfo.isEmpty()) {
            res.put("stat", "empty");
            return res;
        }
        res.put("stat", "successful");
        res.put("data", bidOrderInfo);
        return res;
    }

    @Override
    public Map<String, Object> updateStat2Delivered(Integer bidOrderID) {
        int res = dao.updateStat2Delivered(bidOrderID);
        Map<String, Object> ret = new HashMap<>();
        if (res != 0) {
            ret.put("stat", "successful");
            return ret;
        } else {
            ret.put("stat", "fail");
            return ret;
        }
    }
}
