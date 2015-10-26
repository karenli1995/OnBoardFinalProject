package com.incess.hib.dao;

import java.util.List;

import com.incess.hib.Employee;

public interface EmployeeDao {

	public void save(Employee e);
	public Employee findEmp(String id);
	public void updateStatus(Employee e);

	public List<Employee> list();


}
