package com.springbook.biz.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.user.UserService;
import com.springbook.biz.user.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDAOMybatis userDAO;
	
//	public void setUserDAO(UserDAOMybatis userDAO) {
//		this.userDAO = userDAO;
//	}
	
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}

	public void insertUser(UserVO vo) {
		userDAO.insertUser(vo);
	}
	
	public void updateUser(UserVO vo) {
		userDAO.updateUser(vo);
	}
	
	public void deleteUser(UserVO vo) {
		userDAO.deleteUser(vo);
	}
	
	
	public List<UserVO> getUserList(UserVO vo) {
		return userDAO.getUserList(vo);
	}
	
	public List<UserVO> selectList(UserVO vo) {
		return userDAO.selectList(vo);
	}
	
	
}
