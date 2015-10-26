package com.incess.hib.dao;

import java.util.List;

import com.incess.hib.UserTasks;

public interface TaskDao {

	public void save(UserTasks t);
	public UserTasks findTask(String id);
	public void updateStatus(UserTasks t);

	public List<UserTasks> list();
	
}
