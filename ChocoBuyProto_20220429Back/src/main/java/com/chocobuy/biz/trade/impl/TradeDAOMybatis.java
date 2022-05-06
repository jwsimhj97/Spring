package com.chocobuy.biz.trade.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chocobuy.biz.trade.TradeVO;

@Repository
public class TradeDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	//글 작성
	public void insertTrade(TradeVO vo) {
		System.out.println("===>JDBC로 insertTrade() 기능처리");
		mybatis.insert("TradeDAO.insertTrade", vo);
	}
	//신고
	public void updateReporting(TradeVO vo) {
		System.out.println("===>JDBC로 updateReporting() 기능처리");
		mybatis.update("TradeDAO.updateReporting",vo);
	}
	
	//글수정
	public void updateTrade(TradeVO vo) {
		System.out.println("===>JDBC로 updateTrade() 기능처리");
		mybatis.update("TradeDAO.updateTrade", vo);
	}
	
	//글삭제
	public void deleteTrade(TradeVO vo) {
		System.out.println("===>JDBC로 deleteTrade() 기능처리");
		mybatis.delete("TradeDAO.deleteTrade", vo);
	}
	
	//글상세 조회
	public TradeVO getTrade(TradeVO vo) {
		System.out.println("===>JDBC로 getTrade() 기능처리");
		return (TradeVO) mybatis.selectOne("TradeDAO.getTrade", vo);
	}
	
	//글목록 조회
	public List<TradeVO> getTradeList(TradeVO vo) {
		System.out.println("===>JDBC로 getTradeList() ");
		return mybatis.selectList("TradeDAO.getTradeList", vo);
	}
	public List<TradeVO> getSearchTradeList(TradeVO vo) {
		System.out.println("===>JDBC로 getSearchTradeList() ");
		return mybatis.selectList("TradeDAO.getSearchTradeList", vo);
	}
	//마이페이지 글목록 조회
	public List<TradeVO> getMyTradeList(TradeVO vo) {
		System.out.println("===>JDBC로 getMyTradeList() ");
		return mybatis.selectList("TradeDAO.getMyTradeList", vo);
	}
	
}
