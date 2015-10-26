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


	//	public void getTaskDataFromDB(Connection con, String dbName) throws SQLException
	//	{
	//		System.out.println("called getTaskDataFromDB method");
	//
	//		dbName = "employee";
	//		Statement stmt = null;
	//		String query =
	//				"select COF_NAME, SUP_ID, PRICE, " +
	//						"SALES, TOTAL " +
	//						"from " + dbName + ".COFFEES";
	//
	//		try {
	//			stmt = con.createStatement();
	//			ResultSet rs = stmt.executeQuery(query);
	//			while (rs.next()) {
	//				String coffeeName = rs.getString("COF_NAME");
	//				int supplierID = rs.getInt("SUP_ID");
	//				float price = rs.getFloat("PRICE");
	//				int sales = rs.getInt("SALES");
	//				int total = rs.getInt("TOTAL");
	//				System.out.println(coffeeName + "\t" + supplierID +
	//						"\t" + price + "\t" + sales +
	//						"\t" + total);
	//			}
	//		}catch(SQLException se){
	//			//Handle errors for JDBC
	//			se.printStackTrace();
	//		}catch(Exception e){
	//			//Handle errors for Class.forName
	//			e.printStackTrace();
	//		} finally {
	//			if (stmt != null) { stmt.close(); }
	//		}
	//
	//	}

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


	//process variables passed as a parameter can only be of type STRING!
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
