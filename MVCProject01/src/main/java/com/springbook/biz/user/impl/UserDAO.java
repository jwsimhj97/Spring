package com.springbook.biz.user.impl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.springbook.biz.common.JDBCUtil;
import com.springbook.biz.user.UserVO;

public class UserDAO {
	// JDBC 관련 변수
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	
	// SQL 명령어들
	private final String USER_GET = "select * from users where id=? and password=?";
	private final String USER_INSERT = "insert into users(id, password,name,role) values(?,?,?,?)";
	private final String USER_UPDATE = "update users set password=?, name=?, role=? where id=?";
	private final String USER_DELETE = "delete from users where id=?";
	private final String USER_LIST = "select * from users order by id desc";
//	private final String USER_SELECTVIEW = "select * id from users";
	private final String USER_SELECTVIEW = "select * from users where id='test'";
	
	// CRUD 기능의 메소드 구현
	// 회원 등록
	public UserVO getUser(UserVO vo) {
		UserVO user = null;
		try {
			System.out.println("===> JDBC로 getUser() 기능 처리");
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_GET);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPassword());
			rs = stmt.executeQuery();
			if(rs.next()) {
				user = new UserVO();
				user.setId(rs.getString("ID"));
				user.setPassword(rs.getString("PASSWORD"));
				user.setName(rs.getString("NAME"));
				user.setRole(rs.getString("ROLE"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return user;
	}
	
	
		// 회원 삽입
		public UserVO insertUser(UserVO vo) {
			UserVO user = null;
			System.out.println("===> JDBC로 insertBoard() 기능 처리");
			try {
				conn=JDBCUtil.getConnection();
				stmt=conn.prepareStatement(USER_INSERT);
				stmt.setString(1, vo.getId());
				stmt.setString(2, vo.getPassword());
				stmt.setString(3, vo.getName());
				stmt.setString(4, vo.getRole());
				stmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally{
				JDBCUtil.close(stmt, conn);
			}
			return user;
		}
		
		// 회원 수정 update users set password=?, name=?, role=? where id=?
		public UserVO updateUser(UserVO vo) {
			UserVO user = null;
			System.out.println("===> JDBC로 updateBoard() 기능 처리");
			try {
				conn=JDBCUtil.getConnection();
				stmt=conn.prepareStatement(USER_UPDATE);
				stmt.setString(1, vo.getPassword());
				stmt.setString(2, vo.getName());
				stmt.setString(3, vo.getRole());
				stmt.setString(4, vo.getId());
				stmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally{
				JDBCUtil.close(stmt, conn);
			}
			return user;
		}
		
		// 회원 삭제
		public UserVO deleteUser(UserVO vo) {
			UserVO user = null;
			System.out.println("===> JDBC로 deleteBoard() 기능 처리");
			try {
				conn=JDBCUtil.getConnection();
				stmt=conn.prepareStatement(USER_DELETE);
				stmt.setString(1, vo.getId());
				stmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally{
				JDBCUtil.close(stmt, conn);
			}
			return user;
		}
		
		// 회원 전체목록 보여주기 insert into users(id, password,name,role) values(?,?,?,?)
		public List<UserVO> getUserList(UserVO vo) {
			List<UserVO> userList = new ArrayList<UserVO>();
			System.out.println("===> JDBC로 getUserListBoard() 기능 처리");
			try {
				conn=JDBCUtil.getConnection();
				stmt=conn.prepareStatement(USER_LIST);
				rs=stmt.executeQuery();
				
				while(rs.next()) {
					UserVO uList=new UserVO();
					uList.setId(rs.getString("id"));
					uList.setPassword(rs.getString("password"));
					uList.setName(rs.getString("name"));
					uList.setRole(rs.getString("role"));
					userList.add(uList);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally{
				JDBCUtil.close(rs, stmt, conn);
			}
			return userList;
		}
		
		//회원 선택한 아이디 정보만 보여주기 USER_SELECTVIEW
		public List<UserVO> selectList(UserVO vo) {
			List<UserVO> selList = new ArrayList<UserVO>();
			System.out.println("===> JDBC로 getUserListBoard() 기능 처리");
			try {
				conn=JDBCUtil.getConnection();
				stmt=conn.prepareStatement(USER_SELECTVIEW);
				rs=stmt.executeQuery();
				
				while(rs.next()) {
					UserVO uList=new UserVO();
					uList.setId(rs.getString("id"));
					uList.setPassword(rs.getString("password"));
					uList.setName(rs.getString("name"));
					uList.setRole(rs.getString("role"));
					selList.add(uList);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally{
				JDBCUtil.close(rs, stmt, conn);
			}
			return selList;
		}
		
		
}
