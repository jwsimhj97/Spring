//package com.springbook.view.board;
//
//import java.util.List;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.springbook.biz.board.BoardVO;
//import com.springbook.biz.board.impl.BoardDAO;
//
////p.371
//@Controller
//public class GetBoardListController{
//	@RequestMapping("/getBoardList.do")
//	public ModelAndView getBoardList(BoardVO vo, BoardDAO boardDAO, ModelAndView mav) {
//		mav.addObject("boardList", boardDAO.getBoardList(vo));
//		mav.setViewName("getBoardList.jsp");
//		return mav;
//	}
//
//}
//
//
//
////public class GetBoardListController implements Controller{
////	@Override
////	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) {
////		System.out.println("글 목록 검색 처리");
////		
////		// 1. 사용자 입력 정보 추출(검색 기능은 나중에 구현)
////		// 2. DB 연동 처리
////		BoardVO vo=new BoardVO();
////		BoardDAO boardDAO=new BoardDAO();
////		List<BoardVO> boardList=boardDAO.getBoardList(vo);
////		
//////		// 3. 검색 결과를 세션에 저장하고 목록 화면을 리턴한다.
//////		HttpSession session = request.getSession();
//////		session.setAttribute("boardList", boardList);
//////		return "getBoardList";
////		
////		// 3. 검색 결과와 화면 정보를 ModelAndView에 저장하여 리턴한다.
////		ModelAndView mav=new ModelAndView();
////		mav.addObject("boardList", boardList); 	// Model 정보 저장		//request.setAttribute("boardList", boardList);
////		mav.setViewName("getBoardList");	// View 정보 저장
////		return mav;
////	}
////
////}