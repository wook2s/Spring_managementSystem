package com.jade.myapp.hr.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jade.myapp.HomeController;
import com.jade.myapp.hr.model.EmpVO;
import com.jade.myapp.hr.service.IEmpService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class EmpController {

	private static final Logger logger = LoggerFactory.getLogger(EmpController.class);
	
	@Autowired
	IEmpService empService;
	
	@ExceptionHandler({RuntimeException.class})
	public ModelAndView error(HttpServletRequest request, HttpServletResponse response, Exception e) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("url", request.getRequestURL());
		mav.addObject("e", e);
		mav.setViewName("hr/errorPage");
		return mav;
	}
	
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
		logger.info("insert start");
		try {
			empService.insertEmp(emp);
			logger.info("insert ok");
		} catch (Exception e) {
			logger.info("insert fail");
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
		logger.info("update start");
		try {
			empService.updateEmp(emp);
			logger.info("update ok");
		} catch (Exception e) {
			logger.info("update fail");
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
		logger.info("delete start");
		try {
			empService.deleteEmp(employeeId, email);
			logger.info("delete ok");
		} catch (Exception e) {
			logger.info("delete fail");
		}
		return "redirect:/hr";
	}
	
}



