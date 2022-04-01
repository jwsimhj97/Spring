package com.springbook.biz.user.impl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.user.UserVO;

@Repository
public class UserDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 회원 등록
	public UserVO getUser(UserVO vo) {
		System.out.println("===> Mybatis 로 getUser() 기능 처리");
		return mybatis.selectOne("userDAO.getUser", vo);
	}
	
	public List<UserVO> getUserList(UserVO vo) {
		System.out.println("===> JDBC로 getUserList() 기능 처리");
		return mybatis.selectList("userDAO.getUserList", vo);
	}
	
	// 회원 삽입
	public int insertUser(UserVO vo) {
		System.out.println("===> JDBC로 insertUser() 기능 처리");
		return mybatis.insert("userDAO.insertUser", vo);
		
	}
	
	// 회원 수정
	public int updateUser(UserVO vo) {
		System.out.println("===> JDBC로 updateUser() 기능 처리");
		return mybatis.update("userDAO.updateUser", vo);
	}
	
	// 회원 삭제
	public int deleteUser(UserVO vo) {
		System.out.println("===> JDBC로 deleteUser() 기능 처리");
		return mybatis.delete("userDAO.deleteUser", vo);
	}
	
	
	
	
	
	// 회원 전체목록 보여주기 insert into users(id, password,name,role) values(?,?,?,?)
	
//	public List<BoardVO> getBoardList(UserVO vo) {
//		System.out.println("===> Mybatis 로 getBoardList() 기능 처리");
//		if(vo.getSearchCondition().equals("TITLE")) {
//			return mybatis.selectList("BoardDAO.getBoardList_T", vo);
//		}else if(vo.getSearchCondition().equals("CONTENT")) {
//			return mybatis.selectList("BoardDAO.getBoardList_C", vo);
//		}
//		return null;
//	}
	
	//회원 선택한 아이디 정보만 보여주기 USER_SELECTVIEW
	public List<UserVO> selectList(UserVO vo) {
		List<UserVO> selList = new ArrayList<UserVO>();
		System.out.println("===> JDBC로 selectList() 기능 처리");
		return selList;
	}
//	public List<UserVO> getUserList(UserVO vo) {
//		List<UserVO> userList = new ArrayList<UserVO>();
//		System.out.println("===> JDBC로 getUserListBoard() 기능 처리");
//		return userList;
//	}
	
}
