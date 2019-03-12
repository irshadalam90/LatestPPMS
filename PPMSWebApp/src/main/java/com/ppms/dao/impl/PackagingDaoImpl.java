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

import com.ppms.dao.ManufactureDao;
import com.ppms.dao.PackagingDao;
import com.ppms.dao.RawProductDao;
import com.ppms.pojo.BoxingDetailsPojo;
import com.ppms.pojo.BoxingProductPojo;
import com.ppms.pojo.BoxingsPojo;
import com.ppms.pojo.DispatchRawProductPojo;
import com.ppms.pojo.DispatchesRawProductPojo;
import com.ppms.pojo.GstReceivedPojo;
import com.ppms.pojo.GstReceivedProductPojo;
import com.ppms.pojo.ProductMfgDetailsPojo;
import com.ppms.pojo.ProductPackagingDetailsPojo;
import com.ppms.pojo.ProductPackagingPojo;
import com.ppms.pojo.RawProductPojo;
import com.ppms.pojo.RawReceivedPojo;
import com.ppms.pojo.RawReceivedProductPojo;
import com.ppms.pojo.RawSupplierPojo;

@Repository
@Transactional
public class PackagingDaoImpl implements PackagingDao {

	@Autowired
	private SessionFactory sessionFactory;	
	
	@Autowired
	private HibernateTemplate hibernateTemplate;

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getProductMfgNameList() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select distinct productName from ProductMfgPojo");
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getProductpkgSizeList(String productpkgName) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select distinct productSize from ProductMfgPojo where productName='"+productpkgName+"'");
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getProductpkgGageList(String productpkgName, String productpkgSize) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select distinct productGage from ProductMfgPojo where productName='"+productpkgName+"' and productSize='"+productpkgSize+"'");
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getDispatchedprodNames() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select distinct rp.productName from RawProductPojo rp, DispatchesRawProductPojo dp where rp.id=dp.rawProductId and rp.productGroup='Plastic Bags'");
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getPlasticbagProductSize(String plasticBagProdName) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select distinct rp.productSize from RawProductPojo rp, DispatchesRawProductPojo dp where rp.id=dp.rawProductId and rp.productGroup='Plastic Bags' and rp.productName='"+plasticBagProdName+"'");
		return query.list();
	}

	@Override
	public Object[] getPlasticbagProductAvlQty(String plasticBagProdName, String plasticBagProdSize) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select dp.rawProductId, dp.dispatchQty from RawProductPojo rp, DispatchesRawProductPojo dp where rp.id=dp.rawProductId and rp.productGroup='Plastic Bags' and rp.productName='"+plasticBagProdName+"' and rp.productSize='"+plasticBagProdSize+"'");
		return (Object[]) query.uniqueResult();
		
	}

	@Override
	public Object[] getProductmfgQty(String productmfgName, String productmfgSize, String productmfgGage) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select distinct id, mfgQtyKg, batchNo from ProductMfgPojo where productName='"+productmfgName+"' and productSize='"+productmfgSize+"' and productGage='"+productmfgGage+"'");
		return (Object[]) query.uniqueResult();
	}

	@Override
	public Double packagingDaogetProductmfgPktwt(String productmfgName, String productmfgSize, String productmfgGage) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select unitWeight from ManufactureProductPojo where productName='"+productmfgName+"' and productSize='"+productmfgSize+"' and productGage='"+productmfgGage+"'");
		return (Double) query.uniqueResult();
	}

	@Override
	public boolean addPrductPackagingDetails(ProductPackagingDetailsPojo productPackagingDetailsPojo) {
		Session session = sessionFactory.getCurrentSession();
		session.save(productPackagingDetailsPojo);
		return true;
	}

	@Override
	public void updateMfgQty(double updProdMfgQty, Integer productMfgId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("update ProductMfgPojo pmfg set pmfg.mfgQtyKg=? where id='"+productMfgId+"'");
		query.setParameter(0, updProdMfgQty);
		query.executeUpdate();
	}

	@Override
	public void updateBagQty(double updBagQty, Integer rawProductId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("update DispatchesRawProductPojo drp set drp.dispatchQty=? where rawProductId='"+rawProductId+"'");
		query.setParameter(0, updBagQty);
		query.executeUpdate();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getPlasticBagsLis() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select distinct rp.productName from RawProductPojo rp, ProductPackagingPojo pp  where rp.id=pp.rawProductId");
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getPlasticbagSize(String plasticBagName) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select distinct rp.productSize from RawProductPojo rp, ProductPackagingPojo pp  where rp.id=pp.rawProductId and rp.productName='"+plasticBagName+"'");
		return query.list();
	}
	
	@Override
	public Integer getPlasticBagId(String plasticBagName, String plasticBagSize) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select pp.rawProductId from RawProductPojo rp, ProductPackagingPojo pp where rp.id=pp.rawProductId and rp.productName='"+plasticBagName+"' and  rp.productSize='"+plasticBagSize+"'");
		return (Integer) query.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getMfgpkgProductName(String plasticBagName, String plasticBagSize) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select pmfg.productName from ProductPackagingPojo pp, ProductMfgPojo pmfg, RawProductPojo rp where pp.productMfgId=pmfg.id and pp.rawProductId=rp.id and rp.productName='"+plasticBagName+"' and rp.productSize='"+plasticBagSize+"'");
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getProductmfgpkgSize(String productmfgName, String plasticBagName, String plasticBagSize) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select pmfg.productSize from ProductPackagingPojo pp, ProductMfgPojo pmfg, RawProductPojo rp where pp.productMfgId=pmfg.id and pp.rawProductId=rp.id and rp.productName='"+plasticBagName+"' and rp.productSize='"+plasticBagSize+"' and pmfg.productName='"+productmfgName+"'");
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getProductmfgpkgGage(String productmfgName, String productmfgSize, String plasticBagName, String plasticBagSize) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select pmfg.productGage from ProductPackagingPojo pp, ProductMfgPojo pmfg, RawProductPojo rp where pp.productMfgId=pmfg.id and pp.rawProductId=rp.id and rp.productName='"+plasticBagName+"' and rp.productSize='"+plasticBagSize+"' and pmfg.productName='"+productmfgName+"' and pmfg.productSize='"+productmfgSize+"'");
		return query.list();
	}

	@Override
	public Object[] getProductmfgpkgQty(String productmfgName, String productmfgSize, String productmfgGage,
			String plasticBagName, String plasticBagSize) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select pmfg.id, pp.totalPacketing, pp.packetWeight,pp.qtyPerPacket from ProductPackagingPojo pp, ProductMfgPojo pmfg, RawProductPojo rp where pp.productMfgId=pmfg.id and rp.id=pp.rawProductId and rp.productName='"+plasticBagName+"' and rp.productSize='"+plasticBagSize+"' and pmfg.productName='"+productmfgName+"' and pmfg.productSize='"+productmfgSize+"' and pmfg.productGage='"+productmfgGage+"'");
		return (Object[]) query.uniqueResult();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getProductmfgpkgName(String plasticBagName, String plasticBagSize) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select pmfg.productName from RawProductPojo rp, ProductPackagingPojo pp, ProductMfgPojo pmfg  where rp.id=pp.rawProductId and pp.productMfgId=pmfg.id and rp.productName='"+plasticBagName+"' and  rp.productSize='"+plasticBagSize+"'");
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> getPackagingList() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select pp.id,pp.packagingDate,pp.productName,pp.productSize,pp.productGage,pp.plasticBag from ProductPackagingDetailsPojo pp");
		return query.list();
	}

	@Override
	public ProductPackagingPojo getProductPackagingData(Integer productMfgId, Integer rawProductId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from ProductPackagingPojo pp where pp.productMfgId='"+productMfgId+"' and pp.rawProductId='"+rawProductId+"'");
		return (ProductPackagingPojo) query.uniqueResult();
	}

	@Override
	public void updatePackagingQty(double updNoOfPackets, double updTotalPackagingWt, Integer productMfgId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("update ProductPackagingPojo pp set pp.noOfPacketsCreated=?, pp.totalPacketing=? where productMfgId='"+productMfgId+"'");
		query.setParameter(0, updNoOfPackets);
		query.setParameter(1, updTotalPackagingWt);
		query.executeUpdate();
	}

	@Override
	public void addProductPackaging(ProductPackagingPojo productPackagingPojo) {
		Session session = sessionFactory.getCurrentSession();
		session.save(productPackagingPojo);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getBoxeList() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select rp.productName from DispatchesRawProductPojo drp, RawProductPojo rp where drp.rawProductId=rp.id and rp.productGroup='Box'");
		return (List<String>) query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> boxSizeList(String boxName) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select rp.productSize from DispatchesRawProductPojo drp, RawProductPojo rp where drp.rawProductId=rp.id and rp.productGroup='Box' and rp.productName='"+boxName+"'");
		return (List<String>) query.list();
	}

	@Override
	public Object[] boxAvlQty(String boxName, String boxSize) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select rp.id, drp.dispatchQty from DispatchesRawProductPojo drp, RawProductPojo rp where drp.rawProductId=rp.id and rp.productGroup='Box' and rp.productName='"+boxName+"' and rp.productSize='"+boxSize+"'");
		return (Object[]) query.uniqueResult();
	}

	@Override
	public void addBoxingDtails(BoxingDetailsPojo boxingDetailsPojo) {
		Session session = sessionFactory.getCurrentSession();
		session.save(boxingDetailsPojo);
	}

	@Override
	public void addBoxingProduct(BoxingProductPojo boxingProduct) {
		Session session = sessionFactory.getCurrentSession();
		session.save(boxingProduct);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> getAllBoxingData() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select bd.id, bd.boxingDate, bd.productName, bd.productSize, bd.productGage, bd.plasticBag from BoxingDetailsPojo bd");
		return (List<Object[]>) query.list();
	}

	@Override
	public void updateAvlPkgWeight(double updAvlPkgWt, Integer productId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("update ProductPackagingPojo pp set pp.totalPacketing=? where productMfgId='"+productId+"'");
		query.setParameter(0, updAvlPkgWt);
		query.executeUpdate();
	}

	@Override
	public void updateDispatchBoxQty(double updDispatchBoxQty, Integer rawProductId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("update DispatchesRawProductPojo drp set drp.dispatchQty=? where rawProductId='"+rawProductId+"'");
		query.setParameter(0, updDispatchBoxQty);
		query.executeUpdate();
	}

	@Override
	public ProductPackagingDetailsPojo getPackaging(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		return (ProductPackagingDetailsPojo) session.get(ProductPackagingDetailsPojo.class, id);
	}

	@Override
	public BoxingDetailsPojo getBoxingData(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		return (BoxingDetailsPojo) session.get(BoxingDetailsPojo.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<BoxingProductPojo> getBoxingProducts(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from BoxingProductPojo where boxingId='"+id+"'");
		return query.list();
	}

	@Override
	public void updatePackagingDetails(ProductPackagingDetailsPojo ppd) {
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		session.update(ppd);
		tr.commit();
		session.close();
	}

	@Override
	public void updatePacketingData(ProductPackagingPojo productPackagingPojo) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("update ProductPackagingPojo pp set pp.noOfPacketsCreated=?, pp.totalPacketing=?,pp.rawProductId=? where id='"+productPackagingPojo.getId()+"'");
		query.setParameter(0, productPackagingPojo.getNoOfPacketsCreated());
		query.setParameter(1, productPackagingPojo.getTotalPacketing());
		query.setParameter(2, productPackagingPojo.getRawProductId());
		query.executeUpdate();
	}

	@Override
	public ProductPackagingPojo getPackagingData(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		return (ProductPackagingPojo) session.get(ProductPackagingPojo.class, id);
	}

	@Override
	public Object[] getProductMfgQty(Integer productMfgId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select mfgQtyKg, mfgQtyPiece from ProductMfgPojo where id='"+productMfgId+"'");
		return (Object[]) query.uniqueResult();
	}

	@Override
	public void updateProductMfgQty(double updMfgQtyKg, Integer productMfgId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("update ProductMfgPojo pmfg set pmfg.mfgQtyKg=? where pmfg.id='"+productMfgId+"'");
		query.setParameter(0, updMfgQtyKg);
		query.executeUpdate();
	}

	@Override
	public Double getAvailableBagQty(Integer rawProductId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select dispatchQty from DispatchesRawProductPojo where rawProductId='"+rawProductId+"'");
		return (Double) query.uniqueResult();
	}

	@Override
	public void updateAvlBagQty(double updAvlBagQty, Integer rawProductId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("update DispatchesRawProductPojo drp set drp.dispatchQty=? where drp.id='"+rawProductId+"'");
		query.setParameter(0, updAvlBagQty);
		query.executeUpdate();
	}

	@Override
	public void deletePackagingData(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("delete ProductPackagingDetailsPojo where id='"+id+"'");
		query.executeUpdate();
	}

	@Override
	public Object[] getPackettingQty(Integer packetingId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select totalPacketing, noOfPacketsCreated from ProductPackagingPojo where id='"+packetingId+"'");
		return (Object[]) query.uniqueResult();
	}

	@Override
	public void updatPackettingQty(double updPackettingQtyWt, double updPackettingQtyPiece, Integer packetingId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("update ProductPackagingPojo pp set pp.totalPacketing=?, pp.noOfPacketsCreated=? where pp.id='"+packetingId+"'");
		query.setParameter(0, updPackettingQtyWt);
		query.setParameter(1, updPackettingQtyPiece);
		query.executeUpdate();
	}

	@Override
	public BoxingsPojo getBoxing(BoxingsPojo boxingsPojo) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from BoxingsPojo b where b.productName='"+boxingsPojo.getProductName()+"' and b.productSize='"+boxingsPojo.getProductSize()+"' and b.productGage='"+boxingsPojo.getProductGage()+"' and b.qtyPerPkt='"+boxingsPojo.getQtyPerPkt()+"' and b.noOfPkts='"+boxingsPojo.getNoOfPkts()+"'");
		return (BoxingsPojo) query.uniqueResult();
	}

	@Override
	public void updateBoxingQty(double updTotalBox, double updTotalWt, Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("update BoxingsPojo b set b.createdBoxQty=?, b.totalWeight=? where b.id='"+id+"'");
		query.setParameter(0, updTotalBox);
		query.setParameter(1, updTotalWt);
		query.executeUpdate();
	}

	@Override
	public void addBoxings(BoxingsPojo boxingsPojo) {
		Session session = sessionFactory.getCurrentSession();
		session.save(boxingsPojo);
	}


}
