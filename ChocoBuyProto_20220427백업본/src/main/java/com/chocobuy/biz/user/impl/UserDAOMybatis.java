package com.chocobuy.biz.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chocobuy.biz.user.UserVO;

@Repository
public class UserDAOMybatis{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	/* getUser 기준:user_tel */
	public UserVO getUser(UserVO vo) {
		System.out.println("===> Mybatis로 getUser() 기능 처리");
		return (UserVO) mybatis.selectOne("UserDAO.getUser", vo);
	}

	/* 전화번호 입력 */
	public void insertUser(UserVO vo) {
		System.out.println("===> Mybatis로 insertUser() 기능 처리");
		mybatis.insert("UserDAO.insertUser_tel", vo);
	}
	
	/* 주소 입력 */
	public void updateUserArea(UserVO vo) {
		System.out.println("===> Mybatis로 updateUserArea() 기능 처리");
		mybatis.update("UserDAO.updateUserArea", vo);
	}
	
	/* 별명 입력 */
	public void updateUserNick(UserVO vo) {
		System.out.println("===> Mybatis로 updateUserNick() 기능 처리");
		mybatis.update("UserDAO.updateUserNick", vo);
	}
	
	/* 별명 중복 체크 */
	public int nickDupCheck(String user_nick) {
		System.out.println("===> Mybatis로 nickDupCheck() 기능 처리");
		return mybatis.selectOne("UserDAO.nickDupCheck", user_nick);
	}
	
	/* 휴대폰 번호 로그인 체크 */
	public int userTelCheck(String user_tel) {
		System.out.println("===> Mybatis로 userTelCheck() 기능 처리");
		return mybatis.selectOne("UserDAO.userTelCheck", user_tel);
	}

	public List<UserVO> getUserList(UserVO vo){
		System.out.println("===> Mybatis로 getUserList() 기능 처리");
		return mybatis.selectList("UserDAO.getUserList", vo);			
	}	
	

	
	////
public int updateUser(UserVO vo) {
	System.out.println("===> JDBC로 updateUser() 기능 처리");
	return mybatis.update("UserDAO.updateUser", vo);
}

public int deleteUser(UserVO vo) {
	System.out.println("===> JDBC로 deleteUser() 기능 처리");
	return mybatis.delete("UserDAO.deleteUser", vo);
}
public int nameCheck(String sm_name) {
	System.out.println("===> JDBC nameCheck() 기능 처리");
	System.out.println(sm_name);
	return mybatis.selectOne("UserDAO.nameCheck", sm_name);
}
public UserVO getMypageUser(UserVO vo) {
	System.out.println("===> Mybatis로 getMypageUser() 기능 처리");
	return (UserVO) mybatis.selectOne("UserDAO.getMypageUser", vo);
}

//2022.04.26 inquiry 추가 
	public UserVO getUserInfo(UserVO vo) {
		System.out.println("===> Mybatis로 getUserInfo() 기능 처리");
		return (UserVO) mybatis.selectOne("UserDAO.getUserInfo", vo);
	}
	
	
}