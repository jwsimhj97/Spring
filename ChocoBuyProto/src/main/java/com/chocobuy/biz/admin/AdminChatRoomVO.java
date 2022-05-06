package com.chocobuy.biz.admin;

public class AdminChatRoomVO {
	private int chatroom_seq;
	private int trade_seq;
	private String trade_uuid;
	private String trade_nick;
	private String trade_title;
	private String trade_area;
	private String user_nick;
	private String user_uuid;
	private String chatroom_app;
	private String chatroom_report;
	private String chatroom_date;
	
	private int start;
	private int listcnt;
	
	private String searchKeyword;
	
	private int report0;
	private int report1;
	
	public int getChatroom_seq() {
		return chatroom_seq;
	}
	public void setChatroom_seq(int chatroom_seq) {
		this.chatroom_seq = chatroom_seq;
	}
	public int getTrade_seq() {
		return trade_seq;
	}
	public void setTrade_seq(int trade_seq) {
		this.trade_seq = trade_seq;
	}
	public String getTrade_uuid() {
		return trade_uuid;
	}
	public void setTrade_uuid(String trade_uuid) {
		this.trade_uuid = trade_uuid;
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
	public String getTrade_area() {
		return trade_area;
	}
	public void setTrade_area(String trade_area) {
		this.trade_area = trade_area;
	}
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public String getUser_uuid() {
		return user_uuid;
	}
	public void setUser_uuid(String user_uuid) {
		this.user_uuid = user_uuid;
	}
	public String getChatroom_app() {
		return chatroom_app;
	}
	public void setChatroom_app(String chatroom_app) {
		this.chatroom_app = chatroom_app;
	}
	public String getChatroom_report() {
		return chatroom_report;
	}
	public void setChatroom_report(String chatroom_report) {
		this.chatroom_report = chatroom_report;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getListcnt() {
		return listcnt;
	}
	public void setListcnt(int listcnt) {
		this.listcnt = listcnt;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getChatroom_date() {
		return chatroom_date;
	}
	public void setChatroom_date(String chatroom_date) {
		this.chatroom_date = chatroom_date;
	}
	public int getReport0() {
		return report0;
	}
	public void setReport0(int report0) {
		this.report0 = report0;
	}
	public int getReport1() {
		return report1;
	}
	public void setReport1(int report1) {
		this.report1 = report1;
	}
	@Override
	public String toString() {
		return "ChatRoomVO [chatroom_seq=" + chatroom_seq + ", trade_seq=" + trade_seq + ", trade_uuid=" + trade_uuid
				+ ", trade_nick=" + trade_nick + ", trade_title=" + trade_title + ", trade_area=" + trade_area
				+ ", user_nick=" + user_nick + ", user_uuid=" + user_uuid + ", chatroom_app=" + chatroom_app
				+ ", chatroom_report=" + chatroom_report + ", chatroom_date=" + chatroom_date + "]";
	}
}
