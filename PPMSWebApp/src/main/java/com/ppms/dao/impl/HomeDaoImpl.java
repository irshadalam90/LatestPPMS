package com.ppms.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.ppms.dao.HomeDao;
import com.ppms.pojo.UserPojo;

@Repository
@Transactional
public class HomeDaoImpl implements HomeDao{

	@Autowired
	private SessionFactory sessionFactory;	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	

	@Override
	public UserPojo isValidateUser(String email) {
		Session session = sessionFactory.getCurrentSession(); 
		Criteria criteria = session.createCriteria(UserPojo.class);
		criteria.add(Restrictions.eq("email", email));
		return (UserPojo) criteria.uniqueResult();
	}

	
}
