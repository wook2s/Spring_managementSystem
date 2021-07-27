package com.jade.myapp.hr.service;

import java.util.List;
import java.util.Map;

import com.jade.myapp.hr.model.EmpVO;

public interface IEmpService {

	int getEmpCount();
	int getEmpCount(int deptId);
	List<EmpVO> getEmpList();
	List<EmpVO> getEmpList2();
	EmpVO getEmpInfo(int empId);

	void updateEmp(EmpVO emp);
	void insertEmp(EmpVO emp);
	void deleteEmp(int empId, String email);
	
	List<Map<String, Object>> getAllDeptId();
	List<Map<String, Object>> getAllJobId();
	List<Map<String, Object>> getAllManagertId();
}
