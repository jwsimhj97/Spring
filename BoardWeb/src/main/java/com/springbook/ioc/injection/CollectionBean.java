package com.springbook.ioc.injection;

import java.util.*;

public class CollectionBean {
//	p.98
	private Properties addressList;	
	public void setAddressList(Properties addressList) {
		this.addressList=addressList;
	}	
	public Properties getAddressList(){
		return addressList;
	}
	
//	p.96
//	private Map<String,String> addressList;	
//	public void setAddressList(Map<String,String> addressList) {
//		this.addressList=addressList;
//	}	
//	public Map<String,String> getAddressList(){
//		return addressList;
//	}

	//p.95
//	private Set<String> addressList;	
//	public void setAddressList(Set<String> addressList) {
//		this.addressList=addressList;
//	}	
//	public Set<String> getAddressList(){
//		return addressList;
//	}	
	
//	p.94
//	private List<String> addressList;
//	public void setAddressList(List<String> addressList) {
//		this.addressList=addressList;
//	}
//	public List<String> getAddressList(){
//		return addressList;
//	}
}


