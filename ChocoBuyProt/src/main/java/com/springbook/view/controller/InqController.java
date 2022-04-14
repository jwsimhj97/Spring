package com.springbook.view.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.springbook.biz.inquiry.InqReplyService;
import com.springbook.biz.inquiry.InqReplyVO;
import com.springbook.biz.inquiry.InqService;
import com.springbook.biz.inquiry.InqVO;
import com.springbook.biz.util.PagingVO;

@Controller
@SessionAttributes("inq")
public class InqController {
	
	@Autowired
	private InqService inqService;
	
	@Autowired
	private InqReplyService inqReplyService;
	
	//상대 경로 추가 시 realPath 추가
    //String realPath = request.getSession().getServletContext().getRealPath("/img/");
	String realPath = "c:/springWork/ChocoBuyProject/src/main/webapp/img/" ;
	
	@ModelAttribute("inqConditionMap")
	public Map<String, String> inq_searchConditionMap() {
		Map<String, String> inqConditionMap = new HashMap<String, String>();
		inqConditionMap.put("내용", "INQ_CONTENT");
		inqConditionMap.put("제목", "INQ_TITLE");
		return inqConditionMap;
	}


	// 글 등록
	@RequestMapping(value = "/Inquiry/insertInq.do")
	public String insertInq(InqVO inqVo, MultipartHttpServletRequest request) throws IOException{
		//파일 업로드 처리 
		//board테이블에 컬럼추가하기 ALTER TABLE board ADD COLUMN filename varchar(200);
		MultipartFile inq_uploadFile = inqVo.getInq_uploadFile();
		
		if(!inq_uploadFile.isEmpty()) {
			String inqFileName = inq_uploadFile.getOriginalFilename();
			
			File inqfile = new File(realPath+inqFileName);
			inqVo.setInq_filename(inqFileName);
			if(!inqfile.exists()) {
				inqfile.mkdirs();
			}
			inq_uploadFile.transferTo(inqfile);
		}
		
		inqService.insertInq(inqVo);
		return "getInqList.do";
	}

	// 글 수정
	@RequestMapping("/Inquiry/updateInq.do")
	public String updateInq(@ModelAttribute("inq") InqVO inqVo, HttpSession session) {
		if( inqVo.getInq_nickname().equals(session.getAttribute("userName").toString()) ){
			inqService.updateInq(inqVo);
			return "getInqList.do";
		}else {
			return "getInq.do?error=1";
		}
		
	}

	// 글 삭제
	@RequestMapping("/Inquiry/deleteInq.do")
	public String deleteInq(@ModelAttribute("inq") InqVO inqVo, HttpSession session) {
		if( inqVo.getInq_nickname().equals(session.getAttribute("userName").toString()) ) {
			if(inqVo.getInq_filename()!=null) {
				System.out.println("파일삭제: "+realPath + inqVo.getInq_filename());
				File f = new File(realPath + inqVo.getInq_filename());		
				f.delete();
			}
		}
		inqService.deleteInq(inqVo);
		return "getInqList.do";
	}

	// 글 상세 조회
	@RequestMapping("/Inquiry/getInq.do")
	public String getInq(InqVO inqVo, InqReplyVO inqReplyVo, Model model, HttpServletRequest request) {
		System.out.println(inqVo.getInq_num());
		inqReplyVo.setInqRe_bno(inqVo.getInq_num());
		model.addAttribute("inq", inqService.getInq(inqVo));
		

//		댓글기능 목록
		model.addAttribute("inqReplyList", inqReplyService.getInqReplyList(inqReplyVo));
		
		
		return "getInq.jsp";
	}
	// 댓글 작성
	@RequestMapping(value = "/Inquiry/insertInqReply.do")
	public String insertInqReply(InqReplyVO inqReplyVo, MultipartHttpServletRequest request, Model model) throws IOException{
		System.out.println(inqReplyVo.getInqRe_bno()+" zz");
		inqReplyService.insertInqReply(inqReplyVo);
		
		InqVO inqVo = new InqVO();
		inqVo.setInq_num(inqReplyVo.getInqRe_bno());
		model.addAttribute("inq", inqService.getInq(inqVo));
		model.addAttribute("inqReplyList", inqReplyService.getInqReplyList(inqReplyVo));
		
		return "getInq.jsp";
	}
	// 댓글 수정
	@RequestMapping("/Inquiry/updateInqReply.do*")
	public String updateInqReply(InqReplyVO inqReplyVo, HttpServletRequest request, Model model, HttpSession session) throws IOException{
		System.out.println(inqReplyVo.getInqRe_rno());
		System.out.println(inqReplyVo.getInqRe_content());
		inqReplyService.updateInqReply(inqReplyVo);
		System.out.println(request.getParameter("bno"));
		System.out.println(inqReplyVo);
		System.out.println(inqReplyVo.getInqRe_nickname());
		
		if( inqReplyVo.getInqRe_nickname().equals(session.getAttribute("userName").toString()) ){
			inqReplyService.updateInqReply(inqReplyVo);
			return "getInq.do";
		}else {
			return "getInq.do?error=1";
		}
		
	}
	
		

	// 글 목록
	@RequestMapping("/Inquiry/getInqList.do")
	public String getInqListPost(PagingVO pv, InqVO inqVo, Model model,@RequestParam(value = "nowPage", required = false) String nowPage) {
		System.out.println("글 목록 검색 처리");
		String cntPerPage = "5";
		if (inqVo.getInq_searchCondition() != null) inqVo.setInq_searchCondition(inqVo.getInq_searchCondition());
		else inqVo.setInq_searchCondition("INQ_TITLE");
		
		if (inqVo.getInq_searchKeyword() != null) inqVo.setInq_searchKeyword(inqVo.getInq_searchKeyword());
		else inqVo.setInq_searchKeyword("");
		System.out.println("000: "+inqVo.getInq_searchCondition());
		System.out.println("111: "+inqVo.getInq_searchKeyword());

		int total = inqService.countInq(inqVo);
		if (nowPage == null)  nowPage = "1";

		pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pv);
		inqVo.setStart(pv.getStart());
		inqVo.setListcnt(Integer.parseInt(cntPerPage));

		model.addAttribute("inqList", inqService.getInqList(inqVo));
		model.addAttribute("inq_searchKeyword", inqVo.getInq_searchKeyword());
		model.addAttribute("inq_searchCondition", inqVo.getInq_searchCondition());
		return "getInqList.jsp";
	}
	
	@RequestMapping(value="/inqDownload.do", method=RequestMethod.GET)
    public void fileDownLoad(@RequestParam(value="inq_filename",defaultValue = "", required=false) String inq_filename, HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("INQUIRY 파일 다운로드");
		if (!inq_filename.equals("")) {
	        //(2) 요청파일 정보 불러오기
	        File file = new File(realPath+inq_filename);
	
			// 한글은 http 헤더에 사용할 수 없기 때문에 파일명은 영문으로 인코딩하여 헤더에 적용한다
			String fn = new String(file.getName().getBytes(), "iso_8859_1");
			System.out.println("fn: "+fn);
	
			
			//(3) ContentType설정
			byte[] bytes = org.springframework.util.FileCopyUtils.copyToByteArray(file);
			response.setHeader("Content-Disposition", "attachment; inq_filename=\""+ fn + "\"");
			response.setContentLength(bytes.length);
	//			response.setContentType("image/jpeg");
	        
			response.getOutputStream().write(bytes);
	        response.getOutputStream().flush();
	        response.getOutputStream().close();
        }
    }
	
	
	
	
	
	
}
