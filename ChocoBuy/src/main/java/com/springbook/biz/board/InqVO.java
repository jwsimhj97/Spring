package com.springbook.biz.board;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

//VO(Value Object)
public class InqVO {
//	1:1문의
	private int inq_num;
	private String inq_title;
	private String inq_nickname;
	private String inq_content;
	private MultipartFile inq_file;
	private Date inq_date;
	
	private int inq_cnt;
	private String inq_searchCondition;
	private String inq_searchKeyword;
	private String inq_fileName;
	
	
	public int getInq_num() {
		return inq_num;
	}
	public void setInq_num(int inq_num) {
		this.inq_num = inq_num;
	}

	public String getInq_title() {
		return inq_title;
	}
	public void setInq_title(String inq_title) {
		this.inq_title = inq_title;
	}

	public String getInq_nickname() {
		return inq_nickname;
	}
	public void setInq_nickname(String inq_nickname) {
		this.inq_nickname = inq_nickname;
	}

	public String getInq_content() {
		return inq_content;
	}
	public void setInq_content(String inq_content) {
		this.inq_content = inq_content;
	}

	public MultipartFile getInq_file() {
		return inq_file;
	}
	public void setInq_file(MultipartFile inq_file) {
		this.inq_file = inq_file;
	}

	public Date getInq_date() {
		return inq_date;
	}
	public void setInq_date(Date inq_date) {
		this.inq_date = inq_date;
	}

	public int getInq_cnt() {
		return inq_cnt;
	}
	public void setInq_cnt(int inq_cnt) {
		this.inq_cnt = inq_cnt;
	}

	public String getInq_searchCondition() {
		return inq_searchCondition;
	}
	public void setInq_searchCondition(String inq_searchCondition) {
		this.inq_searchCondition = inq_searchCondition;
	}

	public String getInq_searchKeyword() {
		return inq_searchKeyword;
	}
	public void setInq_searchKeyword(String inq_searchKeyword) {
		this.inq_searchKeyword = inq_searchKeyword;
	}

	public String getInq_fileName() {
		return inq_fileName;
	}
	public void setInq_fileName(String inq_fileName) {
		this.inq_fileName = inq_fileName;
	}

	
	@Override
	public String toString() {
		return "InqVO [inq_num=" + inq_num + ", inq_title=" + inq_title + ", inq_nickname=" + inq_nickname + ", inq_content=" + inq_content + ", inq_fileName=" + inq_fileName + ", inq_date=" + inq_date + ", inq_cnt=" + inq_cnt +"]";
	}

}
