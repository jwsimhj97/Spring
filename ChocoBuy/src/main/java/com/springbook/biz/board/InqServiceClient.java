package com.springbook.biz.board;

import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;


public class InqServiceClient {
	public static void main(String[] args){
		AbstractApplicationContext factory=new GenericXmlApplicationContext("applicationContext.xml");
		InqService inqService=(InqService) factory.getBean("inqService");
		
		InqVO inqVo = new InqVO();
		inqVo.setInq_title("myBaits 제목");
		inqVo.setInq_nickname("홍길동");
		inqVo.setInq_content("myBaits 내용입니다.....");
//		vo.setCnt(3);
		inqService.inqInsertBoard(inqVo);
		
		inqVo.setInq_searchCondition("TITLE");
		inqVo.setInq_searchKeyword("");
		List<InqVO> inqBoardList = inqService.inqGetBoardList(inqVo);
		for(InqVO inqBoard : inqBoardList) {
			System.out.println("--->" + inqBoard.toString());
		}
		
	}
}
