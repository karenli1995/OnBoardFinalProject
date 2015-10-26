package com.incess.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.incess.activiti.business.ActivitiLoadUpService;
import com.incess.hib.Employee;
import com.incess.hib.UserTasks;
import com.incess.hib.dao.EmployeeDao;
import com.incess.hib.dao.TaskDao;

@Controller
public class HelloController {

	@Autowired
	ActivitiLoadUpService newEmployeeAPI;

	@Autowired	
	EmployeeDao employeeDAO;
	
	@Autowired	
	TaskDao taskDAO;
	

	//Spring Security sees this :
	@RequestMapping(value = {"/", "/login"}, method = RequestMethod.GET)
	public ModelAndView login(

			//there are two /login?XXXXX pages (/login?error and /login?logout)
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		
		try {
			newEmployeeAPI.deployProcessFile();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.setViewName("login");

		return model;
	}

	@RequestMapping(value = "/newemp", method = RequestMethod.GET)
	public ModelAndView newemp() {
		Employee addNewEmp = new Employee();
		ModelAndView empModAndView = new ModelAndView("newemp", "command", addNewEmp);
		return empModAndView;
	}

	@RequestMapping(value = "/addEmployee", method = RequestMethod.POST)
	public ModelAndView addEmployee(
			@ModelAttribute("SpringWeb") Employee newemp, ModelMap modelmap, HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		
		//WF
		Map<String, Object> processVariablemap = new HashMap<String, Object>();
		//processVariablemap.put("employeeInfo", newemp);
		processVariablemap.put("name", newemp.getName());
		processVariablemap.put("empname", newemp.getName());
		processVariablemap.put("empid", newemp.getEmpid());  
		processVariablemap.put("dob", newemp.getDob());
		processVariablemap.put("experience", newemp.getExperience());
		processVariablemap.put("logistics", newemp.getLogistics());
		processVariablemap.put("arrange", newemp.getArrange());
		processVariablemap.put("status", "Pending");
		
		if(newemp.getLogistics() == true) processVariablemap.put("dept", "Admin");  //may need to set dept later on
		if(newemp.getArrange() == true) processVariablemap.put("dept", "IT");
		
		try {
			newEmployeeAPI.startProcess("OnboardingWorkflow", processVariablemap); //rename!
		}catch (Exception e) {
			e.printStackTrace();
		}

		model.addObject("msg", "You have successfully added a new employee.");
		model.setViewName("newemp");

		return model;
	}


	@RequestMapping(value = "/mytasks", method = RequestMethod.GET)
	public ModelAndView myTasks(@ModelAttribute Employee myEmpInstance) {

		ModelAndView model = new ModelAndView();
		model.setViewName("mytasks");
		return model;
	}
	
	
	@RequestMapping(value = "/approvetask", method = RequestMethod.POST)
	public ModelAndView approveTask(ModelMap modelmap, @ModelAttribute("Spring Web") UserTasks taskInstance) {
		ModelAndView model = new ModelAndView();
		
		
		UserTasks existingTaskInstance = taskDAO.findTask(taskInstance.getEmpid());

		//somehow need to get the correct employee object
		existingTaskInstance.setProcessId(taskInstance.getProcessId());
		existingTaskInstance.setDept(taskInstance.getDept());
		existingTaskInstance.setEmpName(existingTaskInstance.getEmpName());  //interesting... taskInstance will not work
		existingTaskInstance.setEmpid(taskInstance.getEmpid());
		existingTaskInstance.setStatus("Approved");
		taskDAO.updateStatus(existingTaskInstance);
	
		
		
		Map<String, Object> ourProcessVarMap = newEmployeeAPI.getProcessVariables(existingTaskInstance.getProcessId());
		ourProcessVarMap.put("empname", existingTaskInstance.getEmpName());
		ourProcessVarMap.put("status", "Approved");
		newEmployeeAPI.setProcessVariables(existingTaskInstance.getProcessId(), ourProcessVarMap);
		
		
		Task ourTask = newEmployeeAPI.getTaskQuery(existingTaskInstance.getProcessId());
		newEmployeeAPI.completeTask(ourTask, ourProcessVarMap);
		
		
		model.addObject("msg", "You have approved an employee task.");
		model.setViewName("mytasks");

		return model;
	}
	

	@RequestMapping(value = "/emptable", method = RequestMethod.GET)
	public ModelAndView tablePage() {

		ModelAndView model = new ModelAndView();
		model.setViewName("employeetable");
		return model;
	}

}

