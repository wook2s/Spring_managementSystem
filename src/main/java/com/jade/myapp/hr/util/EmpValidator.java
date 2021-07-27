package com.jade.myapp.hr.util;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.jade.myapp.hr.model.EmpVO;

@Component
public class EmpValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return EmpVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		EmpVO emp = (EmpVO)target;
		Integer employeeId = emp.getEmployeeId();
		
		ValidationUtils.rejectIfEmpty(errors, "employeeId", "emp.employeeId.empty","사원 번호를 입력하세요.");
		if(employeeId != null && employeeId <1 ) {
			errors.rejectValue("employeeId", "emp.employeeId.lessThenOne", "사원번호가 1보다 작습니다.");
		}
		
		ValidationUtils.rejectIfEmpty(errors, "lastName", "emp.lastName.empty","성을 입력하세요.");
		ValidationUtils.rejectIfEmpty(errors, "firstName", "emp.firstName.empty","이름을 입력하세요.");
	}

}
