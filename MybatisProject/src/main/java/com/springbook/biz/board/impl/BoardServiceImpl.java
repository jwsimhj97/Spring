package com.springbook.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.board.BoardService;
import com.springbook.biz.board.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDAOMybatis boardDAO;	// p.405
//	private BoardDAOSpring boardDAO;
//	private BoardDAO boardDAO;
	
	public void insertBoard(BoardVO vo) {
//		p.182~185	|	p.189~198
//		if(vo.getSeq()==0) {
//			throw new IllegalArgumentException("0번 글은 등록할 수 없습니다.");
//		}
//		boardDAO.insertBoard(vo);	// 100번 글 등록성공
		boardDAO.insertBoard(vo);	// Exception 발생 p.242
	}
	public void updateBoard(BoardVO vo) {
		boardDAO.updateBoard(vo);
	}
	public void deleteBoard(BoardVO vo) {
		boardDAO.deleteBoard(vo);
	}
	public BoardVO getBoard(BoardVO vo) {
		return boardDAO.getBoard(vo);
	}
	public List<BoardVO> getBoardList(BoardVO vo) {
		return boardDAO.getBoardList(vo);
	}	
	public int getTotal() {
		return ((BoardService) boardDAO).getTotal();
	}
	public BoardVO updateViewCnt(BoardVO vo) {
		boardDAO.updateViewCnt(vo);
		return boardDAO.getBoard(vo);
	}
	
}
