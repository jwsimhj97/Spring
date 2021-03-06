package com.springbook.biz.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.user.UserService;
import com.springbook.biz.user.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDAO userDAO;
	
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}

	public UserVO insertUser(UserVO vo) {
		return userDAO.insertUser(vo);
	}
	
	public UserVO updateUser(UserVO vo) {
		return userDAO.updateUser(vo);
	}
	
	public UserVO deleteUser(UserVO vo) {
		return userDAO.deleteUser(vo);
	}
	
	
	public List<UserVO> getUserList(UserVO vo) {
		return userDAO.getUserList(vo);
	}
	
	public List<UserVO> selectList(UserVO vo) {
		return userDAO.selectList(vo);
	}
	
	
}
