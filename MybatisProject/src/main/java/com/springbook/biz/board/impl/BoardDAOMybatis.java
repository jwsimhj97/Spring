package com.springbook.biz.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.board.BoardVO;

@Repository
public class BoardDAOMybatis {
//public class BoardDAOMybatis extends SqlSessionDaoSupport{
	@Autowired
	private SqlSessionTemplate mybatis;
//	public void setSessionFactory(SqlSessionFactory sqlSessionFactory) {
//		super.setSqlSessionFactory(sqlSessionFactory);
//	}
	
	public void insertBoard(BoardVO vo) {
		System.out.println("===> Mybatis 로 insertBoard() 기능 처리");
		mybatis.insert("BoardDAO.insertBoard", vo);
	}
	
	public void updateBoard(BoardVO vo) {
		System.out.println("===> Mybatis 로 updateBoard() 기능 처리");
		mybatis.update("BoardDAO.updateBoard", vo);
	}
	
	public void deleteBoard(BoardVO vo) {
		System.out.println("===> Mybatis 로 deleteBoard() 기능 처리");
		mybatis.delete("BoardDAO.deleteBoard", vo);
	}
	
	public BoardVO getBoard(BoardVO vo) {
		System.out.println("===> Mybatis 로 getBoard() 기능 처리");
		mybatis.update("BoardDAO.getBoard", vo);
//		mybatis.selectOne("UserDAO.getBoard", vo);
		return (BoardVO) mybatis.selectOne("BoardDAO.getBoard", vo);
	}
	
	public void updateViewCnt(BoardVO vo) {
		System.out.println("===> Mybatis 로 updateViewCnt() 기능 처리");
		mybatis.update("BoardDAO.updateViewCnt", vo);
	}
	
	
	public List<BoardVO> getBoardList(BoardVO vo) {
		System.out.println("===> Mybatis 로 getBoardList() 기능 처리");
		if(vo.getSearchCondition().equals("TITLE")) {
			return mybatis.selectList("BoardDAO.getBoardList_T", vo);
		}else if(vo.getSearchCondition().equals("CONTENT")) {
			return mybatis.selectList("BoardDAO.getBoardList_C", vo);
		}
		return null;
	}
	
//	@Autowired
//	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
//		super.setSqlSessionFactory(sqlSessionFactory);
//	}
}
