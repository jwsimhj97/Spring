//package com.springbook.biz.board.impl;
//
//import java.util.List;
//
//import org.apache.ibatis.session.SqlSession;
//
//import com.springbook.biz.board.InqVO;
//import com.springbook.biz.util.SqlSessionFactoryBean;
//
//public class InqDAO {
//	private SqlSession inqMybatis;
//	
//	public InqDAO() {
//		inqMybatis = SqlSessionFactoryBean.getSqlSessionInstance();
//	}
//	
//	public void insertInq(InqVO inqVo) {
//		inqMybatis.insert("InqDAO.insertInq", inqVo);
//		inqMybatis.commit();
//	}
//	
//	public void updateInq(InqVO inqVo) {
//		inqMybatis.update("InqDAO.updateInq", inqVo);
//		inqMybatis.commit();
//	}
//	
//	public void deleteInq(InqVO inqVo) {
//		inqMybatis.delete("InqDAO.deleteInq", inqVo);
//		inqMybatis.commit();
//	}
//	
//	public InqVO getInq(InqVO inqVo) {
//		return (InqVO) inqMybatis.selectOne("InqDAO.getInq", inqVo);
//	}
//	
//	public List<InqVO> getInqList(InqVO inqVo) {
//		return inqMybatis.selectList("InqDAO.getInqList", inqVo);
//	}
//}
