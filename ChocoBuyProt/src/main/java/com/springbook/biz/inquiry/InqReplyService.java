package com.springbook.biz.inquiry;

import java.util.List;

public interface InqReplyService {

	//댓글조회
	List<InqReplyVO> getInqReplyList(InqReplyVO inqReplyVo);
	
	//댓글작성
	void insertInqReply(InqReplyVO inqReplyVo);

}