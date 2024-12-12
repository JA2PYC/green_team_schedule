package org.team.dto;

public class EmployeeDTO {
	private String empno;
	private String id;
	private String ename;
	private String ephone;
	private String job;
	private String hiredate;
	private String deptno;
	
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
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
	public String getEphone() {
		return ephone;
	}
	public void setEphone(String ephone) {
		this.ephone = ephone;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getHiredate() {
		return hiredate;
	}
	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}
	public String getDeptno() {
		return deptno;
	}
	public void setDeptno(String deptno) {
		this.deptno = deptno;
	}
	
	@Override
	public String toString() {
		return "EmployeeDTO [empno=" + empno + ", id=" + id + ", ename=" + ename + ", ephone=" + ephone + ", job=" + job
				+ ", hiredate=" + hiredate + ", deptno=" + deptno + "]";
	}
}
