package com.jade.myapp.hr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jade.myapp.hr.model.EmpVO;
import com.jade.myapp.hr.service.IEmpService;

@Controller
public class EmpController {

	@Autowired
	IEmpService empService;
	
	@RequestMapping(value = "/hr/count")
	public String empCount(Model model, @RequestParam(value="deptid", required = false, defaultValue = "0") int deptid) {
		if(deptid ==0) {
			model.addAttribute("count", empService.getEmpCount());
		}else {
			model.addAttribute("count", empService.getEmpCount(deptid));
		}
		return "hr/count";
	}
	
	@RequestMapping(value= {"/hr","/hr/list"})
	public String getAllEmps(Model model){
		List<EmpVO> empList = empService.getEmpList();
		model.addAttribute("empList", empList); 
		return "hr/list";
	}
	
	@RequestMapping(value= {"/hr2","/hr/list2"})
	public String getAllEmps2(Model model){
		List<EmpVO> empList = empService.getEmpList2();
		model.addAttribute("empList", empList); 
		return "hr/list";
	}
	
	
	@RequestMapping(value="/hr/{employeeId}")
	public String getEmpInfo(@PathVariable int employeeId, Model model) {
		EmpVO emp = empService.getEmpInfo(employeeId);
		model.addAttribute("emp",emp);
		return "hr/detail";
	}
	
	@RequestMapping(value="/hr/insert")
	public String insertEmp(Model model) {
		model.addAttribute("jobList",empService.getAllJobId());
		model.addAttribute("departmentList", empService.getAllDeptId());
		model.addAttribute("managerList",empService.getAllManagertId());
		return "hr/insert";
	}
	
	@RequestMapping(value="/hr/insert", method = RequestMethod.POST)
	public String insertEmp(EmpVO emp) {
		try {
			empService.insertEmp(emp);
			System.out.println("insert OK");
		} catch (Exception e) {
			System.out.println("insert error");
			System.out.println(e.toString());
		}
		return "redirect:/hr";
	}
	
	@RequestMapping(value="/hr/update", method = RequestMethod.GET)
	public String updateEmp(int employeeId, Model model) {
		model.addAttribute("emp",empService.getEmpInfo(employeeId));
		model.addAttribute("jobList",empService.getAllJobId());
		model.addAttribute("departmentList", empService.getAllDeptId());
		model.addAttribute("managerList",empService.getAllManagertId());
		return "hr/update";
	}
	@RequestMapping(value="/hr/update", method = RequestMethod.POST)
	public String updateEmp(EmpVO emp) {
		try {
			empService.updateEmp(emp);
			System.out.println("update OK");
		} catch (Exception e) {
			System.out.println(e.toString());
			System.out.println("update error");
		}
		return "redirect:/hr";
	}
	
	@RequestMapping(value="/hr/delete")
	public String deleteEmp(Model model, int employeeId) {
		model.addAttribute("emp",empService.getEmpInfo(employeeId));
		return "hr/delete";
	}
	
	@RequestMapping(value="/hr/delete", method = RequestMethod.POST)
	public String deleteEmp(int employeeId, String email) {
		try {
			empService.deleteEmp(employeeId, email);
			System.out.println("delete ok");
		} catch (Exception e) {
			System.out.println(e.toString());
			System.out.println("delete error");
		}
		return "redirect:/hr";
	}
	
}











