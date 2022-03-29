//package com.springbook.view.board;
//
//import javax.servlet.http.HttpServletRequest;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import com.springbook.biz.board.BoardVO;
//import com.springbook.biz.board.impl.BoardDAO;
//
////p.360 RequestMapping 사용
////@Controller
////public class InsertBoardController {
////	@RequestMapping(value="/insertBoard.do")
////	public void insertBoard(HttpServletRequest request) {
////		System.out.println("글 등록 처리");
////		
////		// 1. 사용자 입력 정보 추출
//////		request.setCharacterEncoding("UTF-8");
////		String title=request.getParameter("title");
////	String writer = request.getParameter("writer");
////	String content = request.getParameter("content");
////
////	// 2. DB 연동 처리
////	BoardVO vo = new BoardVO();vo.setTitle(title);vo.setWriter(writer);vo.setContent(content);
////
////	BoardDAO boardDAO = new BoardDAO();boardDAO.insertBoard(vo);
////}}
//
////p.364
////@Controller
////public class InsertBoardController {
////	@RequestMapping(value = "/insertBoard.do")
////	public void insertBoard(BoardVO vo) {
////		System.out.println("글 등록 처리");
////
////		BoardDAO boardDAO = new BoardDAO();
////		boardDAO.insertBoard(vo);
////	}
////}
//
////p.369 리턴타입 String으로 수정하고 getBoardList.do를 리턴
//@Controller
//public class InsertBoardController {
//	@RequestMapping(value = "/insertBoard.do")
//	public String insertBoard(BoardVO vo, BoardDAO boardDAO) {
//		boardDAO.insertBoard(vo);
//		return "getBoardList.do";
//	}
//}
//
//
//
//
////public class InsertBoardController  implements Controller{
////	@Override
////	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) {
////		System.out.println("글 등록 처리");
////		
////		// 1. 사용자 입력 정보 추출
//////		request.setCharacterEncoding("UTF-8");
////		String title=request.getParameter("title");
////		String writer=request.getParameter("writer");
////		String content=request.getParameter("content");
////		
////		// 2. DB 연동 처리
////		BoardVO vo=new BoardVO();
////		vo.setTitle(title);
////		vo.setWriter(writer);
////		vo.setContent(content);
////		
////		BoardDAO boardDAO=new BoardDAO();
////		boardDAO.insertBoard(vo);
////		
////		// 3. 화면 네비게이션
////		ModelAndView mav=new ModelAndView();
////		mav.setViewName("redirect:getBoardList.do");
////		return mav;
////	}
////}
