package com.incess.activiti.business;

import java.io.InputStream;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.activiti.engine.FormService;
import org.activiti.engine.HistoryService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.ManagementService;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;


@Service
@Configuration
@ComponentScan("com.incess.activiti.business")
public class ActivitiLoadUpService 
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

	private ProcessInstance processInstance;

	@PersistenceContext
	//@Qualifier(value = "entityManagerFactory")
	private EntityManager entityManager;


	/*
	 * Business method to deploy the Process Workflow
	 * The activiti workflow is deployed to activiti DB using activiti API
	 */
	public String deployProcessFile() throws Exception 
	{
		//Create a InputStream for the workflow which is saved as bpmn file
		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
		InputStream inStream = classLoader.getResourceAsStream("Onboard_Sample.bpmn");
		System.out.println("Is inStream Create, what is the value ?"+ inStream);

		//Pass instream to Activiti API
		RepositoryService repositoryService = processEngine.getRepositoryService();
		Deployment deploymentObj = repositoryService.createDeployment().addInputStream("Onboard_Sample.bpmn20.xml", inStream).deploy();
		System.out.println("Number of process definitions: " + repositoryService.createProcessDefinitionQuery().count());

		if(null == deploymentObj)
		{
			return null;
		}

		return deploymentObj.getId();
	}

	public void startProcess(String processDefName ,Map<String,Object> processVariables) 
	{
		processInstance = runtimeService.startProcessInstanceByKey(processDefName,processVariables);
	}

	public String startProcessId(String processDefName)
	{
		processInstance = runtimeService.startProcessInstanceByKey(processDefName);		
		return processInstance.getId();
	}

	public void  startProcessInstanceWithId(String processId,Map<String, Object> variables) {
		processInstance = runtimeService.startProcessInstanceById(processId);
	}

	public Task createTask(String processId)
	{
		Task task = taskService.newTask(processId);
		return  task;
	}

	public void completeTaskById(String processId,Map<String,Object> processVariables)
	{
		Task task = processEngine.getTaskService().createTaskQuery().executionId(processId).singleResult();
		taskService.complete(task.getId(),processVariables);

	}
	
	public void completeTask(Task task,Map<String,Object> processVariables)
	{
		taskService.complete(task.getId(), processVariables);
	}

	public Map<String,Object> getProcessVariables(String processId)
	{
		Map<String, Object> processVar=runtimeService.getVariables(processId);
		return processVar;
	}

	public Task getTaskQuery(String processId)
	{
		Task task = taskService.createTaskQuery().executionId(processId).singleResult();
		return task;
	}

	public void setProcessVariables(String processId, Map<String,Object> processVarMap)
	{
		runtimeService.setVariables(processId, processVarMap);
	}

	// Temporary main method for test
	public static void main(String[] args) 
	{
		ActivitiLoadUpService loadService = new ActivitiLoadUpService();
		try 
		{
			//ApplicationContext context = new ClassPathXmlApplicationContext("src/main/resources/spring-servlet.xml");
			loadService.deployProcessFile();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
