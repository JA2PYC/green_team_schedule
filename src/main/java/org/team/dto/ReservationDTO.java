package org.team.dto;

public class ReservationDTO {
	private Long rnum;
	private String rdate;
	private String cname;
	private String cphone;
	private String address;
	private String content;
	private String visitdate;
	
	public Long getRnum() {
		return rnum;
	}
	public void setRnum(Long rnum) {
		this.rnum = rnum;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCphone() {
		return cphone;
	}
	public void setCphone(String cphone) {
		this.cphone = cphone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getVisitdate() {
		return visitdate;
	}
	public void setVisitdate(String visitdate) {
		this.visitdate = visitdate;
	}
	
	@Override
	public String toString() {
		return "reservationDTO [rnum=" + rnum + ", rdate=" + rdate + ", cname=" + cname + ", cphone=" + cphone
				+ ", address=" + address + ", content=" + content + ", visitdate=" + visitdate + "]";
	}
	
	
}
