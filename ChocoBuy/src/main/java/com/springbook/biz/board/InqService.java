package com.springbook.biz.board;

import java.util.List;

public interface InqService {
	// CRUD 기능의 메소드 구현
	// 글 등록
	void inqInsertBoard(InqVO inqVO);
	
	// 글 수정
	void inqUpdateBoard(InqVO inqVO);
	
	// 글 삭제
	void inqDeleteBoard(InqVO inqVO);
	
	// 글 상세 조회
	InqVO inqGetBoard(InqVO inqVO);
	
	// 글 목록 조회
	List<InqVO> inqGetBoardList(InqVO inqVO);
	
	int inqGetTotal();

	Object inqUpdateViewCnt(InqVO inqVO);
}
