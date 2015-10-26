package com.incess.hib;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tasksForUser")
public class UserTasks {

	@Id
	//@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String empid;
	
	@Column(name = "taskid")
	private String processId;
	
	@Column(name = "dept")
	private String dept;
	
	@Column(name = "status")
	private String status;
	
	@Column(name = "empname")
	private String empname;

	
	
	public String getEmpid() {
		return empid;
	}

	public void setEmpid(String i) {
		this.empid = i;
	}
	
	
	public String getProcessId() {
		return processId;
	}
	public void setProcessId(String processId) {
		this.processId = processId;
	}
	
	
	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getEmpName() {
		return empname;
	}
	
	public void setEmpName(String empname) {
		this.empname = empname;
	}
}
