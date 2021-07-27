package com.jade.myapp.hr.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jade.myapp.hr.dao.EmpRepository;
import com.jade.myapp.hr.dao.IEmpRepository;
import com.jade.myapp.hr.model.EmpVO;

@Service
public class EmpService implements IEmpService{
	
	@Autowired
	IEmpRepository empRepository;
	
	@Override
	public int getEmpCount() {
		// TODO Auto-generated method stub
		return empRepository.getEmpCount();
	}

	@Override
	public int getEmpCount(int deptId) {
		// TODO Auto-generated method stub
		return empRepository.getEmpCount(deptId);
	}

	@Override
	public List<EmpVO> getEmpList() {
		return empRepository.getEmpList();
	}
	@Override
	public List<EmpVO> getEmpList2() {
		return empRepository.getEmpList2();
	}

	@Override
	public EmpVO getEmpInfo(int empId) {
		// TODO Auto-generated method stub
		return empRepository.getEmpInfo(empId);
	}

	@Override
	public void updateEmp(EmpVO emp) {
		empRepository.updateEmp(emp);
	}

	@Override
	public void insertEmp(EmpVO emp) {
		empRepository.insertEmp(emp);
	}

	@Override
	@Transactional("txManager")
	public void deleteEmp(int empId, String email) {
		empRepository.deleteJobHistory(empId);
		empRepository.deleteEmp(empId, email);
	}

	@Override
	public List<Map<String, Object>> getAllDeptId() {
		return empRepository.getAllDeptId();
	}

	@Override
	public List<Map<String, Object>> getAllJobId() {
		return empRepository.getAllJobId();
	}

	@Override
	public List<Map<String, Object>> getAllManagertId() {
		return empRepository.getAllManagertId();
	}


}
