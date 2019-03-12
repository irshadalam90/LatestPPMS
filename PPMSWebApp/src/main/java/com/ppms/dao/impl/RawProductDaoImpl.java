package com.ppms.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import com.ppms.dao.RawProductDao;
import com.ppms.pojo.BankEntryPojo;
import com.ppms.pojo.DispatchRawProductPojo;
import com.ppms.pojo.DispatchesRawProductPojo;
import com.ppms.pojo.GstReceivedPojo;
import com.ppms.pojo.GstReceivedProductPojo;
import com.ppms.pojo.PaymentsPojo;
import com.ppms.pojo.RawProductPojo;
import com.ppms.pojo.RawReceivedPojo;
import com.ppms.pojo.RawReceivedProductPojo;
import com.ppms.pojo.RawSupplierPojo;
import com.ppms.pojo.SupplierGroupPojo;

@Repository
@Transactional
public class RawProductDaoImpl implements RawProductDao{

	@Autowired
	private SessionFactory sessionFactory;	
	 
	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Override
	public void addRawProduct(RawProductPojo rawProductPojo) {
		hibernateTemplate.save(rawProductPojo);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<RawProductPojo> getRawProducts() {
		DetachedCriteria criteria = DetachedCriteria.forClass(RawProductPojo.class);
		criteria.add(Restrictions.eq("status", "active"));
		return (List<RawProductPojo>) hibernateTemplate.findByCriteria(criteria);
	}

	@Override
	public RawProductPojo getRawProductDataById(Integer id) {
		return hibernateTemplate.get(RawProductPojo.class, id);
	}

	@Override
	public boolean updateRawProductData(RawProductPojo rawProduct) {
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		session.update(rawProduct);
		tr.commit();
		session.close();
		//hibernateTemplate.update(rawProduct);
		return true;
	}

	@Override
	public void deleteRawProductData(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("update RawProductPojo rp set rp.status=? where id='"+id+"'");
		query.setParameter(0, "deactive");
		query.executeUpdate();
	}

	@Override
	public boolean addRawSupplier(RawSupplierPojo rawSupplierPojo) {
		hibernateTemplate.save(rawSupplierPojo);
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<RawSupplierPojo> getAllRawSupplier() {
		DetachedCriteria criteria = DetachedCriteria.forClass(RawSupplierPojo.class);
		criteria.add(Restrictions.eq("status", "active"));
		
		//criteria.setProjection(Projections.distinct(Projections.property("firmName")));
		return (List<RawSupplierPojo>) hibernateTemplate.findByCriteria(criteria);
	}

	@Override
	public RawSupplierPojo rawSupplierDataById(Integer id) {
		
		return hibernateTemplate.get(RawSupplierPojo.class, id);
	}

	@Override
	public boolean updateRawSupplierData(RawSupplierPojo rawSupplier) {
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		session.update(rawSupplier);
		tr.commit();
		session.close();
		return true;
	}

	@Override
	public boolean deleteRawSupplier(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("update RawSupplierPojo rs set rs.status=? where id='"+id+"'");
		query.setParameter(0, "deactive");
		query.executeUpdate();
		return true;
	}

	@Override
	public Object[] getSupplierAddress(String supplierName) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select address, city, state, country, pinCode, paymentTerms, paymentDays, salesPersons, totalBilling, totalPaid, balanceAmount, id from RawSupplierPojo where firmName='"+supplierName+"'");
		return (Object[]) query.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<RawProductPojo> getProductColumns(String productName) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from RawProductPojo where productName='"+productName+"'");
		return ( List<RawProductPojo>) query.list();
	}

	@Override
	public void addRawReceived(RawReceivedPojo rawReceivedPojo) {
		hibernateTemplate.save(rawReceivedPojo);
		
	}

	@Override
	public void addRawReceivedProduct(RawReceivedProductPojo rawReceivedProduct) {
		hibernateTemplate.save(rawReceivedProduct);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<RawReceivedPojo> getRawReceivedData() {
		DetachedCriteria criteria = DetachedCriteria.forClass(RawReceivedPojo.class);
		
		return (List<RawReceivedPojo>) hibernateTemplate.findByCriteria(criteria);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllSupliersName() {
		DetachedCriteria criteria = DetachedCriteria.forClass(RawSupplierPojo.class);
		criteria.add(Restrictions.eq("status", "active"));
		criteria.setProjection(Projections.distinct(Projections.property("firmName")));
		return (List<String>) hibernateTemplate.findByCriteria(criteria);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllProductName() {
		DetachedCriteria criteria = DetachedCriteria.forClass(RawProductPojo.class);
		criteria.add(Restrictions.eq("status", "active"));
		criteria.setProjection(Projections.distinct(Projections.property("productName")));
		return (List<String>) hibernateTemplate.findByCriteria(criteria);
	}

	@Override
	public RawProductPojo getRawProductStock(String productName, String productSize) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from RawProductPojo where productName='"+productName+"' AND productSize='"+productSize+"'");
		return (RawProductPojo) query.uniqueResult();
	}

	@Override
	public void updateInventoryQty(String productName, String productSize, double updateQty) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("update RawProductPojo rp set rp.inventoryQty=? where rp.productName='"+productName+"' AND productSize='"+productSize+"'");
		query.setParameter(0, updateQty);
		int res = query.executeUpdate();
		
	}

	@Override
	public void addGstReceived(GstReceivedPojo gstReceivedPojo) {
		hibernateTemplate.save(gstReceivedPojo);
	}

	@Override
	public void addGstReceivedProduct(GstReceivedProductPojo gstReceivedProduct) {
		hibernateTemplate.save(gstReceivedProduct);
	}

	@Override
	public void dispatchRawProduct(DispatchRawProductPojo dispatchRawProductPojo) {
	
		hibernateTemplate.save(dispatchRawProductPojo);
	}

	@Override
	public void updateInventoryQty(Integer rawProductId, double updateInvQty) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("update RawProductPojo rp set rp.inventoryQty=? where id='"+rawProductId+"'");
		query.setParameter(0, updateInvQty);
		query.executeUpdate();
	}

	@Override
	public Double getInventoryQuantity(Integer rawProductId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select rp.inventoryQty from RawProductPojo rp where id='"+rawProductId+"'");

		return  (Double) query.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<GstReceivedPojo> getGstReceivedData() {
		DetachedCriteria criteria = DetachedCriteria.forClass(GstReceivedPojo.class);
		
		return (List<GstReceivedPojo>) hibernateTemplate.findByCriteria(criteria);
	}

	@Override
	public RawReceivedPojo getRawReceivedDetailData(Integer id) {
		
		return hibernateTemplate.get(RawReceivedPojo.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<RawReceivedProductPojo> getRawReceivedProducts(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from RawReceivedProductPojo where rawReceivedId='"+id+"'");
		return query.list();
	}

	@Override
	public RawReceivedProductPojo getRawReceivedProductData(Integer id) {
		
		return hibernateTemplate.get(RawReceivedProductPojo.class, id);
	}

	@Override
	public void updateRawProductData(RawReceivedProductPojo rawReceivedProduct) {
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		session.update(rawReceivedProduct);
		tr.commit();
		session.close();
	}

	@Override
	public RawReceivedProductPojo getUpdatedRawReceivedProduct(int id) {
		
		return hibernateTemplate.get(RawReceivedProductPojo.class, id);
	}

	@Override
	public void dispatchesRawProduct(DispatchesRawProductPojo dispatchesRawProductPojo) {
		hibernateTemplate.save(dispatchesRawProductPojo);
	}

	@Override
	public Double getDispatchesQty(Integer rawProductId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select d.dispatchQty from DispatchesRawProductPojo d where rawProductId='"+rawProductId+"'");
	
		return (Double) query.uniqueResult();
	}

	@Override
	public void updateDispatchesQty(double totalDispatchQty, Integer rawProductId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("update DispatchesRawProductPojo d set d.dispatchQty=? where rawProductId='"+rawProductId+"'");
		query.setParameter(0, totalDispatchQty);
		query.executeUpdate();
	}

	@Override
	public DispatchesRawProductPojo getDispatchesRawProduct(Integer rawProductId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from DispatchesRawProductPojo where rawProductId='"+rawProductId+"'");
		return (DispatchesRawProductPojo) query.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getSalesPersons() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select distinct name from ReferencesPojo");
		return (List<String>) query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getCustomerGroup() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select customerGroup from RawSupplierPojo");
		return (List<String>) query.list();
	}

	@Override
	public GstReceivedPojo getGstReceivedDetailData(Integer id) {
		
		return hibernateTemplate.get(GstReceivedPojo.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<GstReceivedProductPojo> getGstReceivedProducts(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from GstReceivedProductPojo where gstReceivedId='"+id+"'");
		return query.list();
	}

	@Override
	public RawReceivedProductPojo getRawReceivedProduct(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from RawReceivedProductPojo where rawReceivedId='"+id+"'");
		return (RawReceivedProductPojo) query.list();
	}

	@Override
	public void updateRawReceivedData(RawReceivedPojo rr) {
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		session.update(rr);
		tr.commit();
		session.close();
	}

	@Override
	public void updatedRawReceivedProduct(RawReceivedProductPojo rrp) {
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		session.save(rrp);
		tr.commit();
		session.close();
	}

	@Override
	public void deleteRawProduct(Integer rawReceivedId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("delete RawReceivedProductPojo where rawReceivedId='"+rawReceivedId+"'");
		query.executeUpdate();
	}

	@Override
	public void updateGstReceivedData(GstReceivedPojo gr) {
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		session.update(gr);
		tr.commit();
		session.close();
	}

	@Override
	public void updatedGstReceivedProduct(GstReceivedProductPojo gstReceivedProduct) {
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		session.save(gstReceivedProduct);
		tr.commit();
		session.close();
	}

	@Override
	public void deleteGstProduct(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("delete GstReceivedProductPojo where gstReceivedId='"+id+"'");
		query.executeUpdate();
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<DispatchRawProductPojo> getdispatchRawProductList() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from DispatchRawProductPojo");
		return query.list();
	}

	@Override
	public DispatchRawProductPojo getDispatchRawProduct(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from DispatchRawProductPojo where id='"+id+"'");
		return (DispatchRawProductPojo) query.uniqueResult();
	}

	@Override
	public void updateDispatchRawProduct(DispatchRawProductPojo dispatchRawProductPojo) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("update DispatchRawProductPojo d set d.dispatchQty=?,d.inventoryQty=? where id='"+dispatchRawProductPojo.getId()+"'");
		query.setParameter(0, dispatchRawProductPojo.getDispatchQty());
		query.setParameter(1, dispatchRawProductPojo.getInventoryQty());
		query.executeUpdate();
	}

	@Override
	public void updateDispatchesRawProduct(DispatchesRawProductPojo dispatchesRawProductPojo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Double getDispatchQuantity(Integer rawProductId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select dispatchQty from DispatchRawProductPojo where id='"+rawProductId+"'");
		return (Double) query.uniqueResult();
	}

	@Override
	public Double getDispatchesQuantity(Integer rawProductId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select dispatchQty from DispatchesRawProductPojo where rawProductId='"+rawProductId+"'");
		return (Double) query.uniqueResult();
	}

	@Override
	public void deleteDispatchProduct(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("delete DispatchRawProductPojo where id='"+id+"'");
		query.executeUpdate();
	}

	@Override
	public Integer getRawProductId(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select rawProductId from DispatchRawProductPojo where id='"+id+"'");
		return (Integer) query.uniqueResult();
	}

	@Override
	public boolean addNewSupplierGroup(SupplierGroupPojo supplierGroupPojo) {
		Session session = sessionFactory.getCurrentSession();
		session.save(supplierGroupPojo);
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<SupplierGroupPojo> getSupplierGroupList() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from SupplierGroupPojo");
		return query.list();
	}

	@Override
	public SupplierGroupPojo getSupplierGroupData(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from SupplierGroupPojo where id='"+id+"'");
		return (SupplierGroupPojo) query.uniqueResult();
	}

	@Override
	public boolean updateSupplierGroupData(SupplierGroupPojo supplierGroupPojo) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("update SupplierGroupPojo sg set sg.supplierGroup=?, sg.description=? where id='"+supplierGroupPojo.getId()+"'");
		query.setParameter(0, supplierGroupPojo.getSupplierGroup());
		query.setParameter(1, supplierGroupPojo.getDescription());
		query.executeUpdate();
		return true;
	}

	@Override
	public boolean deleteSupplierGroup(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("delete SupplierGroupPojo where id='"+id+"'");
		query.executeUpdate();
		return true;
	}

	@Override
	public boolean addPaymentsInfo(PaymentsPojo paymentsPojo) {
		Session session = sessionFactory.getCurrentSession();
		session.save(paymentsPojo);
		return true;
	}

	@Override
	public Object[] getSupplierData(String supplierName) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select id, totalBilling, totalPaid, balanceAmount from RawSupplierPojo where firmName='"+supplierName+"'");
		return (Object[]) query.uniqueResult();
	}

	@Override
	public void updateRawSupplierData(double updTotalBilling, double updTotalPaid, double updBalanceAmount,
			String supplierName) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("update RawSupplierPojo rs set rs.totalBilling=?, rs.totalPaid=?, rs.balanceAmount=? where rs.firmName='"+supplierName+"'");
		query.setParameter(0, updTotalBilling);
		query.setParameter(1, updTotalPaid);
		query.setParameter(2, updBalanceAmount);
		query.executeUpdate();
		
	}

	@Override
	public void updateSupplierTotalBilling(double totalBilling, String supplierName) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("update RawSupplierPojo rs set rs.totalBilling=? where firmName='"+supplierName+"'");
		query.setParameter(0, totalBilling);
		query.executeUpdate();
	}

	@Override
	public void addBankEntry(BankEntryPojo bankEntry) {
		Session session = sessionFactory.getCurrentSession();
		session.save(bankEntry);
	}

}
