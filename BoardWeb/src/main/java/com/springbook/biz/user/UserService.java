package com.springbook.biz.user;

import java.util.List;

public interface UserService {
	// CRUD 기능의 메소드 구현
	// 회원 등록
	public UserVO getUser(UserVO vo);
	public UserVO insertUser(UserVO vo);
	public UserVO updateUser(UserVO vo);
	public UserVO deleteUser(UserVO vo);
	public List<UserVO> getUserList(UserVO vo);
	public List<UserVO> selectList(UserVO vo);
}
