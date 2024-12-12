package org.team.dto;

import java.util.Date;

public class BoardDTO {
	private Long bnum;		 // 게시판 등록번호
	private String title;	 // 게시판 제목
	private String content;  // 게시판 내용
	private Date postdate; // 게시판 등록날짜
	private Long visitcount;  // 게시판 조회수
	private String id;  // 게시판 조회수
	private String ename; // 게시자 이름
	
    // Getter and Setter
	
	public Long getBnum() {
		return bnum;
	}
	public void setBnum(Long bnum) {
		this.bnum = bnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getPostdate() {
		return postdate;
	}
	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}
	public Long getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(Long visitcount) {
		this.visitcount = visitcount;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	
	@Override
	public String toString() {
		return "BoardDTO [bnum=" + bnum + ", title=" + title + ", content=" + content + ", postdate=" + postdate
				+ ", visitcount=" + visitcount + ", id=" + id + ", ename=" + ename + "]";
	}
	
	
				
}
