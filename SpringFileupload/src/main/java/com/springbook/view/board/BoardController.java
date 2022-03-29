package com.springbook.view.board;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.springbook.biz.board.BoardService;
import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.impl.BoardDAO;

//p.377~379
@Controller
@SessionAttributes("board")	// p.396
public class BoardController {
	@Autowired	//p.404
	private BoardService boardService;
	
	// 글 등록
//	p.404
	@RequestMapping("/insertBoard.do")
	public String insertBoard(BoardVO vo) throws IOException{
//		파일 업로드 처리
		MultipartFile uploadFile = vo.getUploadFile();
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			vo.setFileName(fileName);
			uploadFile.transferTo(new File("D:\\springWork\\SpringFileupload" + fileName));
		}
		
		boardService.insertBoard(vo);
		return "getBoardList.do";
	}
	

//	-------------------------------------------------------------
	// 글 수정
//	p.404
	@RequestMapping("/updateBoard.do")
	public String updateBoard(@ModelAttribute("board") BoardVO vo) {
		boardService.updateBoard(vo);
		return "getBoardList.do";
	}
	
//	-------------------------------------------------------------
	// 글 삭제
//	p.404
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo) {
		boardService.deleteBoard(vo);
		return "getBoardList.do";
	}

//	-------------------------------------------------------------
//	// 글 상세 조회
//	p.404
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO vo, Model model) {
		model.addAttribute("board", boardService.getBoard(vo));	// Model 정보 저장
		return "getBoard.jsp";	// View 정보 저장
	}
	
	
//	-------------------------------------------------------------
//	// 글 목록 검색
//	p.404
	@RequestMapping("/getBoardList.do")
	public String getBoardList(BoardVO vo, Model model) {
//		p.419
		//Null Check
		if(vo.getSearchCondition() == null) vo.setSearchCondition("TITLE");
		if(vo.getSearchKeyword() == null) vo.setSearchKeyword("");
		// Model 정보 저장
		model.addAttribute("boardList", boardService.getBoardList(vo));	//p.391
		return "getBoardList.jsp";	// View 이름 리턴
	}
//	-------------------------------------------------------------

	
//	// 검색 조건 목록 설정
//	p.404
	@ModelAttribute("conditionMap")
	public Map<String, String> serachConditionMap(){
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		return conditionMap;
	}

}
