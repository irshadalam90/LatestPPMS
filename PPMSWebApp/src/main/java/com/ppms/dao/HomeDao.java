package com.ppms.dao;

import java.util.List;

import com.ppms.pojo.UserPojo;


public interface HomeDao {

	UserPojo isValidateUser(String email);
}
