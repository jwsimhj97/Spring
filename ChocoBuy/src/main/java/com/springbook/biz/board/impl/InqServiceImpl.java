package com.springbook.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.board.InqService;
import com.springbook.biz.board.InqVO;

@Service("InqService")
public class InqServiceImpl implements InqService{
	@Autowired
	private InqDAOMybatis inqDAO;	// p.405
	
	public void inqInsertBoard(InqVO inqVo) {
		inqDAO.inqInsertBoard(inqVo);	// Exception 발생 p.242
	}
	public void inqUpdateBoard(InqVO inqVo) {
		inqDAO.inqUpdateBoard(inqVo);
	}
	public void inqDeleteBoard(InqVO inqVo) {
		inqDAO.inqDeleteBoard(inqVo);
	}
	public InqVO inqGetBoard(InqVO inqVo) {
		return inqDAO.inqGetBoard(inqVo);
	}
	public List<InqVO> inqGetBoardList(InqVO inqVo) {
		return inqDAO.inqGetBoardList(inqVo);
	}	
	public int inqGetTotal() {
		return ((InqService) inqDAO).inqGetTotal();
	}
	public InqVO inqUpdateViewCnt(InqVO inqVo) {
		inqDAO.inqUpdateViewCnt(inqVo);
		return inqDAO.inqGetBoard(inqVo);
	}
	
}
