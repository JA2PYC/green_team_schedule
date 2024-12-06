package org.team.dto;

public class ReservationDTO {
    private Long rnum;          // 고객 접수번호
    private String rdate;       // 고객 접수일자
    private String cname;       // 고객 이름
    private String cphone;      // 고객 휴대전화번호
    private String address;     // 고객 주소
    private String category;    // 제품 분류
    private String model;       // 보일러 모델명
    private String issue;       // 고장 증상
    private String detail;      // 고장 상세 내용
    private String visitdate;   // AS 방문일자
    private Boolean pinformation; // 개인정보 동의 여부

    // Getter and Setter
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
    public String getCname(){
    	return cname;
    }
    public void setCname(String cname) {
    	this.cname=cname;
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
    public String getCategory() {
        return category;
    }
    public void setCategory(String category) {
        this.category = category;
    }
    public String getModel() {
        return model;
    }
    public void setModel(String model) {
        this.model = model;
    }
    public String getIssue() {
        return issue;
    }
    public void setIssue(String issue) {
        this.issue = issue;
    }
    public String getDetail() {
        return detail;
    }
    public void setDetail(String detail) {
        this.detail = detail;
    }
    public String getVisitdate() {
        return visitdate;
    }
    public void setVisitdate(String visitdate) {
        this.visitdate = visitdate;
    }
    public Boolean getPinformation() {
        return pinformation;
    }
    public void setPinformation(Boolean pinformation) {
        this.pinformation = pinformation;
    }

    @Override
    public String toString() {
        return "ReservationDTO [rnum=" + rnum + ", rdate=" + rdate + ", cname=" + cname + ", cphone=" + cphone
                + ", address=" + address + ", category=" + category + ", model=" + model + ", issue=" + issue
                + ", detail=" + detail + ", visitdate=" + visitdate + ", pinformation=" + pinformation + "]";
    }
}