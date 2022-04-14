package com.springbook.biz.inquiry.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.inquiry.InqReplyVO;
import com.springbook.biz.inquiry.InqVO;

@Repository
public class InqReplyDAOMybatis{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	//댓글 조회
	public List<InqReplyVO> getInqReplyList(InqReplyVO inqReplyVo) {
		System.out.println("===>JDBC로 getInqReplyList() ");
		return mybatis.selectList("InqReplyDAO.getInqReplyList", inqReplyVo);
	}
	
	//댓글 작성
	public void insertInqReply(InqReplyVO inqReplyVo) {
		System.out.println("===>JDBC로 insertInqReply() 기능처리");
		mybatis.insert("InqReplyDAO.insertInqReply", inqReplyVo);
	}
	

	//댓글 수정
	public void updateInqReply(InqReplyVO inqReplyVo) {
		System.out.println("===>JDBC로 updateInqReply() 기능처리");
		mybatis.update("InqReplyDAO.updateInqReply", inqReplyVo);
	}
}
