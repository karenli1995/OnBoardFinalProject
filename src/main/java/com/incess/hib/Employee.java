package com.incess.hib;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.SecondaryTable;
import javax.persistence.Table;

@Entity
@Table(name="allEmployees")
public class Employee {

	@Column(name="name")
	private String name;
	
	@Id
	private String empid;
	
	private String dob;
	private String experience;
	private boolean logistics;
	private boolean arrange;
	
	private String processId;
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmpid() {
		return empid;
	}

	public void setEmpid(String i) {
		this.empid = i;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	public boolean isLogistics() {
		return logistics;
	}

	public void setLogistics(boolean logistics) {
		this.logistics = logistics;
	}
	
	public boolean getLogistics() {
		return logistics;
	}

	public boolean isArrange() {
		return arrange;
	}

	public void setArrange(boolean arrange) {
		this.arrange = arrange;
	}
	
	public boolean getArrange() {
		return arrange;
	}
	
	public String getProcessId() {
		return processId;
	}
	public void setProcessId(String processId) {
		this.processId = processId;
	}
	
}
