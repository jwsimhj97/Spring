package com.chocobuy.biz.trade;

import java.sql.Date;

public class TradeVO {
	
	private int trade_seq;//	글번호
	private String trade_nick;//	닉네임
	private String trade_title;//	글 제목
	private int trade_money;//	금액
	private String trade_content;//	글 내용
	private String trade_area;//	거래 지역
	private String trade_img;//	이미지 이름
	private String trade_category;//	카테고리
	private String trade_buyinfo;//	구매자정보
	private String trade_review;//	리뷰
	private Date trade_date;//	날짜
	private int trade_reporting;// 유저 신고
	public int getTrade_reporting() {
		return trade_reporting;
	}
	public void setTrade_reporting(int trade_reporting) {
		this.trade_reporting = trade_reporting;
	}
	private String searchCategory;
	
	public String getSearchInput() {
		return searchInput;
	}
	public void setSearchInput(String searchInput) {
		this.searchInput = searchInput;
	}
	private String searchInput;

	public String getSearchCategory() {
		return searchCategory;
	}
	public void setSearchCategory(String searchCategory) {
		this.searchCategory = searchCategory;
	}
	public int getTrade_seq() {
		return trade_seq;
	}
	public void setTrade_seq(int trade_seq) {
		this.trade_seq = trade_seq;
	}
	public String getTrade_nick() {
		return trade_nick;
	}
	public void setTrade_nick(String trade_nick) {
		this.trade_nick = trade_nick;
	}
	public String getTrade_title() {
		return trade_title;
	}
	public void setTrade_title(String trade_title) {
		this.trade_title = trade_title;
	}
	public int getTrade_money() {
		return trade_money;
	}
	public void setTrade_money(int trade_money) {
		this.trade_money = trade_money;
	}
	public String getTrade_content() {
		return trade_content;
	}
	public void setTrade_content(String trade_content) {
		this.trade_content = trade_content;
	}
	public String getTrade_area() {
		return trade_area;
	}
	public void setTrade_area(String trade_area) {
		this.trade_area = trade_area;
	}
	public String getTrade_img() {
		return trade_img;
	}
	public void setTrade_img(String trade_img) {
		this.trade_img = trade_img;
	}
	public String getTrade_category() {
		return trade_category;
	}
	public void setTrade_category(String trade_category) {
		this.trade_category = trade_category;
	}
	public String getTrade_buyinfo() {
		return trade_buyinfo;
	}
	public void setTrade_buyinfo(String trade_buyinfo) {
		this.trade_buyinfo = trade_buyinfo;
	}
	public String getTrade_review() {
		return trade_review;
	}
	public void setTrade_review(String trade_review) {
		this.trade_review = trade_review;
	}
	public Date getTrade_date() {
		return trade_date;
	}
	public void setTrade_date(Date trade_date) {
		this.trade_date = trade_date;
	}
	
	
	
	
	
}
