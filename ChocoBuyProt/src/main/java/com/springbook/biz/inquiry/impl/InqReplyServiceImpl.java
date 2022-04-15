package com.springbook.biz.inquiry.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.inquiry.InqReplyService;
import com.springbook.biz.inquiry.InqReplyVO;
import com.springbook.biz.inquiry.InqVO;


@Service("inqReplyService")
public class InqReplyServiceImpl implements InqReplyService {
	
	@Autowired
	private InqReplyDAOMybatis inqReplyDAO;

	@Override
	public List<InqReplyVO> getInqReplyList(InqReplyVO inqReplyVo) {
		return inqReplyDAO.getInqReplyList(inqReplyVo);
	}
	
	@Override
	public void insertInqReply(InqReplyVO inqReplyVo) {
		inqReplyDAO.insertInqReply(inqReplyVo);
	}
	
//	@Override
//	public void updateInqReply(InqReplyVO inqReplyVo) {
//		inqReplyDAO.updateInqReply(inqReplyVo);
//	}

	@Override
	public void deleteInqReply(InqReplyVO inqReplyVo) {
		inqReplyDAO.deleteInqReply(inqReplyVo);
	}
}
