package com.ppms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ppms.dao.HomeDao;
import com.ppms.pojo.UserPojo;
import com.ppms.service.HomeService;

@Service
public class HomeServiceImpl implements HomeService{

	@Autowired
	HomeDao homeDao;
	
	@Override
	public UserPojo isValidate(String email) {
		
		return homeDao.isValidateUser(email);
	}
}
