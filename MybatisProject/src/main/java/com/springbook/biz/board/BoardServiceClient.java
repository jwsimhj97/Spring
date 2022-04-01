package com.springbook.biz.board;

import java.sql.SQLException;
import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;


public class BoardServiceClient {
	public static void main(String[] args){
		AbstractApplicationContext factory=new GenericXmlApplicationContext("applicationContext.xml");
		BoardService boardService=(BoardService) factory.getBean("boardService");
		
		BoardVO vo = new BoardVO();
		vo.setTitle("myBaits 제목");
		vo.setWriter("홍길동");
		vo.setContent("myBaits 내용입니다.....");
//		vo.setCnt(3);
		boardService.insertBoard(vo);
		
		vo.setSearchCondition("TITLE");
		vo.setSearchKeyword("");
		List<BoardVO> boardList = boardService.getBoardList(vo);
		for(BoardVO board : boardList) {
			System.out.println("--->" + board.toString());
		}
		
	}
}
