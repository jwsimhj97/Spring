package com.springbook.biz.board.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.common.JDBCUtil;
import com.springbook.biz.util.SqlSessionFactoryBean;

public class BoardDAO {
   private SqlSession mybatis;
   
   public BoardDAO() {
      mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
   }
   
   public void insertBoard(BoardVO vo) {
      mybatis.insert("BoardDAO.insertBoard", vo);
      mybatis.commit();
   }
   
   public void updateBoard(BoardVO vo) {
      mybatis.update("BoardDAO.updateBoard", vo);
      mybatis.commit();
   }
   public void deleteBoard(BoardVO vo) {
      mybatis.delete("BoardDAO.deleteBoard", vo);
      mybatis.commit();
   }
   public BoardVO getBoard(BoardVO vo) {
      return (BoardVO) mybatis.selectOne("BoardDAO.getBoard", vo);
   }
   
   public List<BoardVO> getBoardList(BoardVO vo) {
      return mybatis.selectList("BoardDAO.getBoardList",vo);
   }
}

//// DAO(Data Access
//@Repository("boardDAO")
//public class BoardDAO {
//   //JDBC 관련 변수
//   private Connection conn = null;
//   private PreparedStatement stmt = null;
//   private ResultSet rs = null;
//   
//   // SQL 명령어들
//   private final String BOARD_INSERT = "insert into board(title, writer, content, fileName) values(?,?,?,?)";
//   private final String BOARD_UPDATE = "update board set title=?,writer=?,content=? where seq=?";
//   private final String BOARD_DELETE = "delete from board where seq=?";
//   private final String BOARD_GET = "select * from board where seq=?";
//   private final String BOARD_LIST = "select * from board order by seq desc";
//   private final String BOARD_LIST_T = "select * from board where title like CONCAT('%', ?, '%') order by seq desc";
//   private final String BOARD_LIST_C = "select * from board where content like CONCAT('%', ?, '%') order by seq desc";
//   
//   // CRUD 기능의 메소드 구현
//   // 글 등록
//   public void insertBoard(BoardVO vo) {
//      System.out.println("===> JDBC로 insertBoard() 기능 처리");
//      try {
//         conn = JDBCUtil.getConnetion();
//         stmt = conn.prepareStatement(BOARD_INSERT);
//         stmt.setString(1,  vo.getTitle());
//         stmt.setString(2,  vo.getWriter());
//         stmt.setString(3, vo.getContent());
//         stmt.setString(4, vo.getFileName());
//         stmt.executeUpdate();
//      } catch (Exception e) {
//         e.printStackTrace();
//      } finally {
//         JDBCUtil.close(stmt, conn);
//      }
//   }
//   
//   // 글 수정
//   public void updateBoard(BoardVO vo) {
//      System.out.println("===> JDBC로 updateBoard() 기능 처리");
//      try {
//         conn = JDBCUtil.getConnetion();
//         stmt = conn.prepareStatement(BOARD_UPDATE);
//         stmt.setString(1, vo.getTitle());
//         stmt.setString(2, vo.getWriter());
//         stmt.setString(3, vo.getContent());
//         stmt.setInt(4, vo.getSeq());
//         stmt.executeUpdate();
//      } catch (Exception e) {
//         e.printStackTrace();
//      } finally {
//         JDBCUtil.close(stmt, conn);
//      }
//   }
//   
//   // 글 삭제
//   public void deleteBoard(BoardVO vo) {
//      System.out.println("===> JDBC로 deleteBoard() 기능 처리");
//      try {
//         conn = JDBCUtil.getConnetion();
//         stmt = conn.prepareStatement(BOARD_DELETE);
//         stmt.setInt(1, vo.getSeq());
//         stmt.executeUpdate();
//      }catch(Exception e) {
//         e.printStackTrace();
//      }finally {
//         JDBCUtil.close(stmt, conn);
//      }
//   }
//   
//   // 글 상세 조회
//   public BoardVO getBoard(BoardVO vo) {
//      System.out.println("===> JDBC로 getBoard() 기능 처리");
//      BoardVO board = null;
//      try {
//         conn = JDBCUtil.getConnetion();
//         stmt = conn.prepareStatement(BOARD_GET);
//         stmt.setInt(1, vo.getSeq());
//         rs = stmt.executeQuery();
//         if (rs.next()) {
//            board = new BoardVO();
//            board.setSeq(rs.getInt("SEQ"));
//            board.setWriter(rs.getString("WRITER"));
//            board.setContent(rs.getString("CONTENT"));
//            board.setRegDate(rs.getDate("REGDATE"));
//            board.setCnt(rs.getInt("CNT"));
//            board.setFileName(rs.getString("FILENAME"));
//         }
//      } catch (Exception e) {
//         e.printStackTrace();
//      } finally {
//         JDBCUtil.close(stmt, conn);
//      }
//      return board;
//   }
//   
//
//   
//   public List<BoardVO> getBoardList(BoardVO vo) {
//         System.out.println("===> JDBC로 getBoardList() 기능 처리");
//         List<BoardVO> boardList = new ArrayList<BoardVO>();
//         try {
//            conn=JDBCUtil.getConnetion();
////            p.421
//            if(vo.getSearchCondition().equals("TITLE")) {
//               stmt=conn.prepareStatement(BOARD_LIST_T);
//            }else if(vo.getSearchCondition().equals("CONTENT")) {
//               stmt=conn.prepareStatement(BOARD_LIST_C);
//            }
//            stmt.setString(1, vo.getSearchKeyword());
//            
////            stmt=conn.prepareStatement(BOARD_LIST);
//            rs=stmt.executeQuery();
//            while(rs.next()) {
//               BoardVO board=new BoardVO();
//               board.setSeq(rs.getInt("SEQ"));
//               board.setTitle(rs.getString("TITLE"));
//               board.setWriter(rs.getString("WRITER"));
//               board.setContent(rs.getString("CONTENT"));
//               board.setRegDate(rs.getDate("REGDATE"));
//               board.setCnt(rs.getInt("CNT"));
//               boardList.add(board);
//            }
//         }catch(Exception e) {
//            e.printStackTrace();
//         }finally{
//            JDBCUtil.close(rs, stmt, conn);
//         }
//         return boardList;
//      }
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//