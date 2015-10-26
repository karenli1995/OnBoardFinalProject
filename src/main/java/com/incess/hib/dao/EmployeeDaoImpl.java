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

	/*@Autowired
	private SessionFactory sessionFactory;
	 */

	@PersistenceContext	
	EntityManager entityManager;

	/* 
    public void setSessionFactory(SessionFactory sessionFactory) {
       // this.sessionFactory = sessionFactory;
    } */

	@Transactional
	public void save(Employee e) {
		/*Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.persist(p);
		tx.commit();
		session.close();*/
		entityManager.persist(e);

	}

	//public void delete(Employee s){
	  //  entityManager.find(Employee.class, "Approved");
	//	entityManager.remove(s);

	//}


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
