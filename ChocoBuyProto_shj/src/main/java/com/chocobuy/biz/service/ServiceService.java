package com.chocobuy.biz.service;

import java.util.List;


public interface ServiceService {
	
	void insertService(ServiceVO vo);

	//글수정
	void updateService(ServiceVO vo);

	//글삭제
	void deleteService(ServiceVO vo);

	//글상세 조회
	ServiceVO getService(ServiceVO vo);

	//글목록 조회
	List<ServiceVO> getServiceList(ServiceVO vo);
	
}
