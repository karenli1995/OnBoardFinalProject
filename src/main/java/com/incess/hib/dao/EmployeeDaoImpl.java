package com.incess.hib.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceContext;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.incess.hib.Employee;

public class EmployeeDaoImpl implements EmployeeDao {

	@PersistenceContext	
	EntityManager entityManager;

	@Transactional
	public void save(Employee e) {
		entityManager.persist(e);

	}

	@SuppressWarnings("unchecked")
	public List<Employee> list() {
		/*	Session session = this.sessionFactory.openSession();
		List<Employee> personList = session.createQuery("from employee").list();
		session.close();*/
		return null ; // personList;
	}
	
	@Transactional
	public Employee findEmp(String id){
		Employee myEmp = entityManager.find(Employee.class, id);
		return myEmp;
	}
	
	@Transactional
	public void updateStatus(Employee e) {
		entityManager.merge(e);
	}

}
