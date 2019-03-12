package com.ppms.dao.impl;

import java.util.List;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.object.SqlQuery;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import com.ppms.dao.SaleDao;
import com.ppms.pojo.CustomerPojo;
import com.ppms.pojo.GstInvoicePojo;
import com.ppms.pojo.GstInvoiceProductPojo;
import com.ppms.pojo.ReferencesPojo;
import com.ppms.pojo.SaleOrderPojo;
import com.ppms.pojo.SaleOrderProductPojo;

@Repository
@Transactional
public class SaleDaoImpl implements SaleDao {

	@Autowired
	private SessionFactory sessionFactory;	
	
	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Override
	public boolean addCustomerData(CustomerPojo customerPojo) {
		Session session = sessionFactory.getCurrentSession();
		session.save(customerPojo);
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CustomerPojo> getCustomerList() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from CustomerPojo where status='active'");
		return query.list();
	}

	@Override
	public CustomerPojo getCustomerData(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		return (CustomerPojo) session.get(CustomerPojo.class, id);
	}

	@Override
	public boolean updateCustomerData(CustomerPojo customer) {
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		session.update(customer);
		tr.commit();
		session.close();
		return true;
	}

	@Override
	public boolean deleteCustomerDetails(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("update CustomerPojo set status=? where id='"+id+"'");
		query.setParameter(0, "deactive");
		query.executeUpdate();
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getProductNameList() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select distinct productName from ManufactureProductPojo");
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getProductSizeList(String productName) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select distinct productSize from ManufactureProductPojo where productName='"+productName+"'");
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getProductGageList(String productName, String productSize) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select distinct productGage from ManufactureProductPojo where productName='"+productName+"' and productSize='"+productSize+"'");
		return query.list();
	}

	@Override
	public Object[] getProductQtyList(String productName, String productSize, String productGage) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select id, qtyPerPkt, noOfPkts, boxWeight from BoxingsPojo where productName='"+productName+"' and productSize='"+productSize+"' and productGage='"+productGage+"'");
		return (Object[]) query.uniqueResult();
	}

	@Override
	public Double getProductUnitWeight(String productName, String productSize, String productGage) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select unitWeight from ManufactureProductPojo where productName='"+productName+"' and productSize='"+productSize+"' and productGage='"+productGage+"'");
		return (Double) query.uniqueResult();
	}

	@Override
	public void addSaleOrderData(SaleOrderPojo saleOrderPojo) {
		Session session = sessionFactory.getCurrentSession();
		session.save(saleOrderPojo);
	}

	@Override
	public void addSaleOrderProduct(SaleOrderProductPojo saleOrderProduct) {
		Session session = sessionFactory.getCurrentSession();
		session.save(saleOrderProduct);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getCustomerNamesList() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select firmName from CustomerPojo");
		return query.list();
	}

	@Override
	public Object[] getCustomerShipAddress(String customerName) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select shipAddress, shipCity, shipState, shipCountry, shipPinCode from CustomerPojo where firmName='"+customerName+"'");
		return (Object[]) query.uniqueResult();
	}

	@Override
	public boolean addReferences(ReferencesPojo referencesPojo) {
		Session session = sessionFactory.getCurrentSession();
		session.save(referencesPojo);
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ReferencesPojo> getReferencesList() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from ReferencesPojo");
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<SaleOrderPojo> getSaleOrdersList() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from SaleOrderPojo");
		return query.list();
	}

	@Override
	public void addGstInvoiceData(GstInvoicePojo gstInvoicePojo) {
		Session session = sessionFactory.getCurrentSession();
		session.save(gstInvoicePojo);
	}

	@Override
	public void addGstInvoiceProduct(GstInvoiceProductPojo gstInvoiceProduct) {
		Session session = sessionFactory.getCurrentSession();
		session.save(gstInvoiceProduct);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<GstInvoicePojo> getGstInvoiceList() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from GstInvoicePojo");
		return query.list();
	}

}
