package com.incess.activiti.workflow;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.activiti.engine.HistoryService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.ManagementService;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.springframework.beans.factory.annotation.Autowired;

import com.incess.activiti.business.ActivitiLoadUpService;
import com.incess.hib.Employee;
import com.incess.hib.UserTasks;
import com.incess.hib.dao.EmployeeDao;
import com.incess.hib.dao.TaskDao;


public class WorkFlowTaskOperations 
{
	@Autowired
	private RuntimeService runtimeService;

	@Autowired
	private TaskService taskService;

	@Autowired
	ProcessEngine processEngine;
	@Autowired
	private HistoryService historyService;

	@Autowired
	private ManagementService managementService;

	@Autowired
	private IdentityService identityService;

	@Autowired
	private RepositoryService repositoryService;

	@PersistenceContext
	private EntityManager entityManager;

	@Autowired	
	private EmployeeDao employeeDAO;

	@Autowired	
	private TaskDao taskDAO;

	@Autowired
	ActivitiLoadUpService newEmployeeAPI;

	
	public void createUser(String process_id, String empid, String name, String dob, String experience, boolean logistics, boolean arrange)
	{
		if(process_id !=  null)
		{
			Employee theNewEmp = new Employee();
			theNewEmp.setProcessId(process_id);
			theNewEmp.setEmpid(empid);
			theNewEmp.setName(name);
			theNewEmp.setDob(dob);
			theNewEmp.setExperience(experience);
			theNewEmp.setLogistics(logistics);
			theNewEmp.setArrange(arrange);

			employeeDAO.save(theNewEmp);
		}

	}


	public void createITTask(String process_id, String dept, String empid, String empname, String status)
	{	
		if(process_id !=  null)
		{
			UserTasks theNewTask = new UserTasks();
			theNewTask.setProcessId(process_id);
			theNewTask.setDept(dept);
			theNewTask.setEmpid(empid);
			theNewTask.setEmpName(empname);
			theNewTask.setStatus(status);

			taskDAO.save(theNewTask);
		}

	}

}
