package com.ppms.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import com.ppms.dao.ManufactureDao;
import com.ppms.pojo.ManufactureProductPojo;
import com.ppms.pojo.ProductMfgDetailsPojo;
import com.ppms.pojo.ProductMfgPojo;
import com.ppms.pojo.SheetMfgDetailsPojo;
import com.ppms.pojo.SheetMfgProductPojo;
import com.ppms.pojo.SheetMfgsPojo;

@Repository
@Transactional
public class ManufactureDaoImpl implements ManufactureDao{

	@Autowired
	private SessionFactory sessionFactory;	
	
	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Override
	public boolean addMfgProductData(ManufactureProductPojo manufactureProductPojo) {
		
		int i = (Integer) hibernateTemplate.save(manufactureProductPojo);
		/*if(i==1){
			return true;
		}
		else {
			return false;
		}*/
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ManufactureProductPojo> getAllManufactureProsucts() {
		DetachedCriteria criteria = DetachedCriteria.forClass(ManufactureProductPojo.class);
		return (List<ManufactureProductPojo>) hibernateTemplate.findByCriteria(criteria);
	}

	@Override
	public ManufactureProductPojo getManufactureDataById(Integer id) {
		
		return hibernateTemplate.get(ManufactureProductPojo.class, id);
	}

	@Override
	public boolean updateMfgProductData(ManufactureProductPojo manufactureProduct) {
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		session.update(manufactureProduct);
		tr.commit();
		session.close();
		return true;
	}

	@Override
	public boolean deleteMfgProduct(Integer id) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("delete from ManufactureProductPojo where id='"+id+"'");
		int i = query.executeUpdate();
		if(i==1){
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public void addManufactureData(SheetMfgDetailsPojo sheetMfgDetailsPojo) {
		hibernateTemplate.save(sheetMfgDetailsPojo);
	}

	@Override
	public void addMfgCartProduct(SheetMfgProductPojo sheetMfgProduct) {
		hibernateTemplate.save(sheetMfgProduct);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<SheetMfgDetailsPojo> getAllManufactureList() {
		DetachedCriteria criteria = DetachedCriteria.forClass(SheetMfgDetailsPojo.class);
		return (List<SheetMfgDetailsPojo>) hibernateTemplate.findByCriteria(criteria);
	}

	@Override
	public SheetMfgDetailsPojo getSheetManufactureDataById(Integer id) {
		
		return hibernateTemplate.get(SheetMfgDetailsPojo.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<SheetMfgProductPojo> getSheetMfgProductsList(Integer id) {
		DetachedCriteria criteria = DetachedCriteria.forClass(SheetMfgProductPojo.class);
		criteria.add(Restrictions.eq("mfgId", id));
		return (List<SheetMfgProductPojo>) hibernateTemplate.findByCriteria(criteria);
	}

	@Override
	public boolean deleSheetMfgDetails(Integer id) {
		Session session = sessionFactory.openSession();
		Query query1 = session.createQuery("delete from SheetMfgDetailsPojo where id='"+id+"'");
		int i = query1.executeUpdate();
		Query query2 = session.createQuery("delete from SheetMfgProductPojo where mfgId='"+id+"'");
		int i2 = query2.executeUpdate();
		if(i==1 && i2==1){
			return true;
		}
		else {
			return false;
		}
		
	}

	/*@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> getSheetMfgData(String sheetName) {
		DetachedCriteria criteria = DetachedCriteria.forClass(SheetMfgDetailsPojo.class);
		ProjectionList pList = Projections.projectionList();
		pList.add(Projections.property("sheetSize"));
		pList.add(Projections.property("sheetGage"));
		criteria.setProjection(pList);
		criteria.add(Restrictions.eq("sheetName", sheetName));
		
		return (List<Object[]>) hibernateTemplate.findByCriteria(criteria);
	}*/

	@Override
	public Double getSheetAvlQty(String sheetName, String sheetSize, String sheetGage) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select mfgQty from SheetMfgsPojo where sheetName='"+sheetName+"' and sheetSize='"+sheetSize+"' and sheetGage='"+sheetGage+"'");
		return (Double) query.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getSheetMfgSizeList(String sheetName) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(SheetMfgsPojo.class);
		criteria.setProjection(Projections.distinct(Projections.property("sheetSize")));
		criteria.add(Restrictions.eq("sheetName", sheetName));
		return (List<String>) criteria.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getSheetMfgGageList(String sheetName, String sheetSize) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(SheetMfgsPojo.class);
		criteria.setProjection(Projections.distinct(Projections.property("sheetGage")));
		criteria.add(Restrictions.eq("sheetName", sheetName));
		criteria.add(Restrictions.eq("sheetSize", sheetSize));
		return (List<String>) criteria.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getProductMfgSizeList(String productName) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(ManufactureProductPojo.class);
		criteria.setProjection(Projections.distinct(Projections.property("productSize")));
		criteria.add(Restrictions.eq("productName", productName));
		return (List<String>) criteria.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getProductMfgGageList(String productName, String productSize) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(ManufactureProductPojo.class);
		criteria.setProjection(Projections.distinct(Projections.property("productGage")));
		criteria.add(Restrictions.eq("productName", productName));
		criteria.add(Restrictions.eq("productSize", productSize));
		return (List<String>) criteria.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getSheetMfgSheetNameList() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select sheetName from SheetMfgsPojo where mfgQty>0");
		return (List<String>) query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getMfgProductNameList() {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(ManufactureProductPojo.class);
		criteria.setProjection(Projections.distinct(Projections.property("productName")));
		return (List<String>) criteria.list();
	}

	@Override
	public boolean addProductMfgData(ProductMfgDetailsPojo productMfgDetailsPojo) {
		hibernateTemplate.save(productMfgDetailsPojo);
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductMfgDetailsPojo> getProductMfgListData() {
		DetachedCriteria criteria = DetachedCriteria.forClass(ProductMfgDetailsPojo.class);
		return (List<ProductMfgDetailsPojo>) hibernateTemplate.findByCriteria(criteria);
	}

	@Override
	public ProductMfgDetailsPojo getProductMfgDataById(Integer id) {
		
		return hibernateTemplate.get(ProductMfgDetailsPojo.class, id);
	}

	@Override
	public boolean deleteProductMfgById(Integer id) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("delete from ProductMfgPojo where id='"+id+"'");
		int i = query.executeUpdate();
		
		if(i==1){
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public boolean updateProductMfgData(ProductMfgDetailsPojo productMfgData) {
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		session.update(productMfgData);
		tr.commit();
		session.close();
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> getRawProductNameList() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select distinct rp.id, rp.productName from RawProductPojo rp, DispatchesRawProductPojo  drp where rp.id=drp.rawProductId and rp.productGroup='Polystyrene'");
		return query.list();
	}

	@Override
	public Object[] getDispatchProductAvlblqty(String productName) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select rp.id, drp.dispatchQty from RawProductPojo rp, DispatchesRawProductPojo  drp where rp.id=drp.rawProductId and rp.productGroup='Polystyrene' and rp.productName='"+productName+"'");
		return (Object[]) query.uniqueResult();
	}

	@Override
	public String getRawProductName(Integer rawProductId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select productName from RawProductPojo rp where id='"+rawProductId+"'");
		return (String) query.uniqueResult();
	}

	@Override
	public void updateDispatchQty(double updDispatchQty, Integer productId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("update DispatchesRawProductPojo  drp set drp.dispatchQty=? where drp.rawProductId='"+productId+"'");
		query.setParameter(0, updDispatchQty);
		query.executeUpdate();
	}

	@Override
	public SheetMfgsPojo getSheetMfgsData(String sheetName, String sheetSize, String sheetGage) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from SheetMfgsPojo smfg where smfg.sheetName='"+sheetName+"'and smfg.sheetSize='"+sheetSize+"' and smfg.sheetGage='"+sheetGage+"'");
		return (SheetMfgsPojo) query.uniqueResult();
	}

	@Override
	public void updateSheetMfgQty(double updSheetMfgQty, Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("update SheetMfgsPojo smfg set smfg.mfgQty=? where smfg.id='"+id+"'");
		query.setParameter(0, updSheetMfgQty);
		query.executeUpdate();	
	}

	@Override
	public void addSheetMfgsData(SheetMfgsPojo sheetMfgsPojo) {
		Session session = sessionFactory.getCurrentSession();
		session.save(sheetMfgsPojo);
	}

	@Override
	public ProductMfgPojo getProductMfgData(ProductMfgPojo productMfgPojo) {
		Session session = sessionFactory.getCurrentSession();
		//Query query = session.createQuery("from ProductMfgPojo pmfg where pmfg.sheetName='"+productMfgPojo.getSheetName()+"'and pmfg.sheetSize='"+productMfgPojo.getSheetSize()+"' and pmfg.sheetGage='"+productMfgPojo.getSheetGage()+"' and pmfg.productName='"+productMfgPojo.getProductName()+"'and pmfg.productSize='"+productMfgPojo.getProductSize()+"' and pmfg.productGage='"+productMfgPojo.getProductGage()+"'");
		Query query = session.createQuery("from ProductMfgPojo pmfg where pmfg.productName='"+productMfgPojo.getProductName()+"'and pmfg.productSize='"+productMfgPojo.getProductSize()+"' and pmfg.productGage='"+productMfgPojo.getProductGage()+"'");
		return (ProductMfgPojo) query.uniqueResult();
	}

	@Override
	public void updateProductMfgQty(double updProductMfgQtyKg, double updProductMfgQtyPieces, Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("update ProductMfgPojo pmfg set pmfg.mfgQtyKg=? , pmfg.mfgQtyPiece=? where pmfg.id='"+id+"'");
		query.setParameter(0, updProductMfgQtyKg);
		query.setParameter(1, updProductMfgQtyPieces);
		query.executeUpdate();	
	}

	@Override
	public void addProductMfg(ProductMfgPojo productMfgPojo) {
		Session session = sessionFactory.getCurrentSession();
		session.save(productMfgPojo);
	}

	@Override
	public void updatesSheetMfgQty(double updSheetMfgQty, String sheetName, String sheetSize, String sheetGage) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("update SheetMfgsPojo smfg set smfg.mfgQty=? where smfg.sheetName='"+sheetName+"' and smfg.sheetSize='"+sheetSize+"' and smfg.sheetGage='"+sheetGage+"'");
		query.setParameter(0, updSheetMfgQty);
		query.executeUpdate();	
	}

	@Override
	public Double getProductMfgunitWeight(String productName, String productSize, String productGage) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(ManufactureProductPojo.class);
		criteria.setProjection(Projections.property("unitWeight"));
		criteria.add(Restrictions.eq("productName", productName));
		criteria.add(Restrictions.eq("productSize", productSize));
		criteria.add(Restrictions.eq("productGage", productGage));
		return (Double) criteria.uniqueResult();
	}

	
}
