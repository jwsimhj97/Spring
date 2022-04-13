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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.springbook.biz.board.InqService;
import com.springbook.biz.board.InqVO;
//import com.springbook.biz.board.impl.BoardDAO;

//p.377~379
@Controller
@SessionAttributes("inqBoard")	// p.396
public class InqController {
	@Autowired	//p.404
	private InqService inqService;
	
	// 글 등록
//	p.404inqServiceClient
	@RequestMapping("/inqInsertBoard.do")
	public String inqInsertBoard(InqVO inqVo) throws IOException{
//		파일 업로드 처리
		MultipartFile inq_file = inqVo.getInq_file();
		if(!inq_file.isEmpty()) {
			String inq_fileName = inq_file.getOriginalFilename();
			inqVo.setInq_fileName(inq_fileName);
			inq_file.transferTo(new File("D:\\springWork\\ChocoBuy" + inq_fileName));
		}
		
		inqService.inqInsertBoard(inqVo);
		return "inqGetBoardList.do";
	}
	

//	-------------------------------------------------------------
	// 글 수정
//	p.404
	@RequestMapping("/inqUpdateBoard.do")
	public String inqUpdateBoard(@ModelAttribute("inqBoard") InqVO inqVo) {
		inqService.inqUpdateBoard(inqVo);
		return "inqGetBoardList.do";
	}
	
//	-------------------------------------------------------------
	// 글 삭제
//	p.404
	@RequestMapping("/inqDeleteBoard.do")
	public String inqDeleteBoard(InqVO inqVo) {
		inqService.inqDeleteBoard(inqVo);
		return "inqGetBoardList.do";
	}

//	-------------------------------------------------------------
//	// 글 상세 조회
//	p.404
	@RequestMapping("/inqGetBoard.do")
	public String inqGetBoard(InqVO inqVo, Model model) {
		model.addAttribute("inqBoard", inqService.inqUpdateViewCnt(inqVo));
		model.addAttribute("inqBoard", inqService.inqGetBoard(inqVo));	// Model 정보 저장
		return "inqGetBoard.jsp";	// View 정보 저장
	}
	
	
//	-------------------------------------------------------------
//	// 글 목록 검색
//	p.404
	@RequestMapping("/inqGetBoardList.do")
	public String inqGetBoardList(InqVO inqVo, Model model) {
//		p.419
		//Null Check
		if(inqVo.getInq_searchCondition() == null) inqVo.setInq_searchCondition("INQTITLE");
		if(inqVo.getInq_searchKeyword() == null) inqVo.setInq_searchKeyword("");
		// Model 정보 저장
		model.addAttribute("inqBoardList", inqService.inqGetBoardList(inqVo));	//p.391
		return "inqGetBoardList.jsp";	// View 이름 리턴
	}
//	-------------------------------------------------------------

	
//	// 검색 조건 목록 설정
//	p.404
	@ModelAttribute("inqConditionMap")
	public Map<String, String> inqSerachConditionMap(){
		Map<String, String> inqConditionMap = new HashMap<String, String>();
		inqConditionMap.put("제목", "INQTITLE");
		inqConditionMap.put("내용", "INQCONTENT");
		return inqConditionMap;
	}

}
