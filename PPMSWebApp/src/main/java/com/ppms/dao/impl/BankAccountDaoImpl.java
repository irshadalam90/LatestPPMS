package com.ppms.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ppms.dao.BankAccountDao;
import com.ppms.dao.HomeDao;
import com.ppms.pojo.BankAccountPojo;
import com.ppms.pojo.BankEntryPojo;
import com.ppms.pojo.PaymentsPojo;
import com.ppms.pojo.UserPojo;

@Repository
@Transactional
public class BankAccountDaoImpl implements BankAccountDao{

	@Autowired
	private SessionFactory sessionFactory;	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	@Override
	public boolean submitBankAccountData(BankAccountPojo bankAccountPojo) {
		Session session = sessionFactory.getCurrentSession();
		session.save(bankAccountPojo);
		return true;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<BankAccountPojo> getBankAccountList() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from BankAccountPojo");
		return query.list();
	}
	@Override
	public BankAccountPojo getBankAccountData(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from BankAccountPojo where id='"+id+"'");
		return (BankAccountPojo) query.uniqueResult();
	}
	@Override
	public void updateBankAccount(BankAccountPojo bankAccount) {
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		session.update(bankAccount);
		tr.commit();
		session.close();
	}
	@Override
	public boolean deleteBankAccount(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("delete BankAccountPojo where id='"+id+"'");
		query.executeUpdate();
		return true;
	}
	@Override
	public boolean submitBankEntryData(BankEntryPojo bankEntryPojo) {
		Session session = sessionFactory.getCurrentSession();
		session.save(bankEntryPojo);
		return true;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getBankNames() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select distinct bankName from BankAccountPojo");
		return query.list();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<BankEntryPojo> getbankEntryList() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from BankEntryPojo");
		return query.list();
	}
	@Override
	public BankEntryPojo getbankEntryData(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from BankEntryPojo where id='"+id+"'");
		return (BankEntryPojo) query.uniqueResult();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<PaymentsPojo> getPayments() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from PaymentsPojo");
		return query.list();
	}
	@Override
	public PaymentsPojo getPaymentData(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from PaymentsPojo where id='"+id+"'");
		return (PaymentsPojo) query.uniqueResult();
	}
	@Override
	public void addPaymentsInfo(PaymentsPojo payment) {
		Session session = sessionFactory.getCurrentSession();
		session.save(payment);
	}
	
}
