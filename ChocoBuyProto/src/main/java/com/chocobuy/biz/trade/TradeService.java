package com.chocobuy.biz.trade;

import java.util.List;

public interface TradeService {

	void insertTrade(TradeVO vo);
	void updateTrade(TradeVO vo);
	void deleteTrade(TradeVO vo);
	void updateReporting(TradeVO vo);
	
	TradeVO getTrade(TradeVO vo);

	List<TradeVO> getTradeList(TradeVO vo);
	List<TradeVO> getMyTradeList(TradeVO vo);
	List<TradeVO> getSearchTradeList(TradeVO vo);
	
} 
