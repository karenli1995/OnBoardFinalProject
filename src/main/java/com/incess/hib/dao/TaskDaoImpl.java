package com.incess.hib.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import com.incess.hib.Employee;
import com.incess.hib.UserTasks;

public class TaskDaoImpl implements TaskDao {

	@PersistenceContext	
	EntityManager entityManager;
	
	@Transactional
	public void save(UserTasks t) {
		entityManager.persist(t);
		
	}

	@Transactional
	public UserTasks findTask(String id) {
		UserTasks myTask = entityManager.find(UserTasks.class, id);
		return myTask;
	}

	@Transactional
	public void updateStatus(UserTasks t) {
		entityManager.merge(t);
		
	}

	@SuppressWarnings("unchecked")
	public List<UserTasks> list() {
		return null;
	}

}
