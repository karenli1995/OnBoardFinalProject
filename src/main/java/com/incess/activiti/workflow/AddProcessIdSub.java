package com.incess.activiti.workflow;

import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.JavaDelegate;

public class AddProcessIdSub implements JavaDelegate
{

	public void execute(DelegateExecution execution) throws Exception 
	{
		
		String process_id = execution.getProcessInstanceId();
		execution.setVariable("process_id2", process_id);
		System.out.println("Submarine process_id == "+process_id);
		
		
	}

}