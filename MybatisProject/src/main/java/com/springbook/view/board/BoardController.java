package com.springbook.view.board;

import java.util.HashMap;
import java.util.Map;
import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.springbook.biz.board.BoardService;
import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.impl.BoardDAO;

@Controller
@SessionAttributes("board")
public class BoardController {
   @Autowired
   private BoardService boardService;
   
   // 검색 조건 목록 설정
   @ModelAttribute("conditionMap")
   public Map<String, String> searchConditionMap() {
      Map<String, String> conditionMap = new HashMap<String, String>();
      conditionMap.put("제목",  "TITLE");
      conditionMap.put("내용", "CONTENT");
      return conditionMap;
   }
   
   // 글 등록
   @RequestMapping("/insertBoard.do")
   public String insertBoard(BoardVO vo) throws IOException{
      // 파일 업로드 처리
      MultipartFile uploadFile = vo.getUploadFile();
      if(!uploadFile.isEmpty()) {
         String fileName = uploadFile.getOriginalFilename();
         vo.setFileName(uploadFile.getOriginalFilename());
         uploadFile.transferTo(new File(".\\" + fileName));
      }
      boardService.insertBoard(vo);
      return "getBoardList.do";
   }
   
   // 글 수정
   @RequestMapping("/upddateBoard.do")
   public String updateBoard(@ModelAttribute("board") BoardVO vo) {
      System.out.println("번호 : " + vo.getSeq());
      System.out.println("제목 : " + vo.getTitle());
      System.out.println("작성자 : " + vo.getWriter());
      System.out.println("내용 : " + vo.getContent());
      System.out.println("등록일 : " + vo.getRegDate());
      System.out.println("조회수 : " + vo.getCnt());
      System.out.println("작성자 이름 : " + vo.getWriter());
      boardService.updateBoard(vo);
      return "getBoardList.do";
   }
   
   // 글 삭제
   @RequestMapping("/deleteBoard.do")
   public String deleteBoard(BoardVO vo) {
      boardService.deleteBoard(vo);
      return "getBoardList.do";
   }
   
   // 글 상세 조회
   @RequestMapping("/getBoard.do")
   public String getBoard(BoardVO vo, Model model) {
      model.addAttribute("board", boardService.getBoard(vo));   // Model 정보 저장
      return "getBoard.jsp";   // View 이름 리턴
   }
   
   // 글 목록 검색
   @RequestMapping("/getBoardList.do")
   public String getBoardList(BoardVO vo, Model model) {
      //NULL Check
      if(vo.getSearchCondition()==null) vo.setSearchCondition("TITLE");
      if(vo.getSearchKeyword()==null) vo.setSearchKeyword("");
      
      // Model 정보 저장
      model.addAttribute("boardList", boardService.getBoardList(vo));
      return "getBoardList.jsp";   // View 이름 리턴
   }
}