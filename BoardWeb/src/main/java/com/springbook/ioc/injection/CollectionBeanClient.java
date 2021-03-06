package com.springbook.ioc.injection;

import java.io.FileReader;
import java.util.*;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class CollectionBeanClient {

	public static void main(String[] args) {
		AbstractApplicationContext factory= new GenericXmlApplicationContext("collectionContext.xml");
		
		CollectionBean bean=(CollectionBean) factory.getBean("collectionBean");
		
//		p.98
		Properties addressList=bean.getAddressList();
		for(Object i: addressList.keySet()) {
			String key=(String)i;
			String value=addressList.getProperty(key);
		}
		
//		p.97
//		Map<String,String> addressList=bean.getAddressList();
		
//		p.96
//		Set<String> addressList=bean.getAddressList();
				
//		p.94
//		List<String> addressList=bean.getAddressList();
		
//		for(String address: addressList) {
//			System.out.println(address.toString());
//		}
		factory.close();
	}

}
