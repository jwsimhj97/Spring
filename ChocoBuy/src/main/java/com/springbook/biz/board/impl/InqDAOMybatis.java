package com.springbook.biz.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.board.InqVO;


@Repository
public class InqDAOMybatis {
	@Autowired
	private SqlSessionTemplate inqMybatis;
	
	public void inqInsertBoard(InqVO inqVo) {
		System.out.println("===> inqMybatis 로 inqInsertBoard() 기능 처리");
		inqMybatis.insert("InqDAO.inqInsertBoard", inqVo);
	}
	
	public void inqUpdateBoard(InqVO inqVo) {
		System.out.println("===> inqMybatis 로 inqUpdateBoard() 기능 처리");
		inqMybatis.update("InqDAO.inqUpdateBoard", inqVo);
	}
	
	public void inqDeleteBoard(InqVO inqVo) {
		System.out.println("===> inqMybatis 로 inqDeleteBoard() 기능 처리");
		inqMybatis.delete("InqDAO.inqDeleteBoard", inqVo);
	}
	
	public InqVO inqGetBoard(InqVO inqVo) {
		System.out.println("===> inqMybatis 로 inqGetBoard() 기능 처리");
		inqMybatis.update("InqDAO.inqGetBoard", inqVo);
		return inqMybatis.selectOne("InqDAO.inqGetBoard", inqVo);
	}
	
	public void inqUpdateViewCnt(InqVO inqVo) {
		System.out.println("===> inqMybatis 로 inqUpdateViewCnt() 기능 처리");
		inqMybatis.update("InqDAO.inqUpdateViewCnt", inqVo);
	}
	
	
	public List<InqVO> inqGetBoardList(InqVO inqVo) {
		System.out.println("===> inqMybatis 로 inqGetBoardList() 기능 처리");
		if(inqVo.getInq_searchCondition().equals("INQTITLE")) {
			return inqMybatis.selectList("InqDAO.inqGetBoardList_T", inqVo);
		}else if(inqVo.getInq_searchCondition().equals("INQCONTENT")) {
			return inqMybatis.selectList("InqDAO.inqGetBoardList_C", inqVo);
		}
		return null;
	}
}
	