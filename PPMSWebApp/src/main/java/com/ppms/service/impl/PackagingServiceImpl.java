package com.ppms.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ppms.beans.RawReceivedBean;
import com.ppms.beans.RawReceivedProductBean;
import com.ppms.dao.ManufactureDao;
import com.ppms.dao.PackagingDao;
import com.ppms.dao.RawProductDao;
import com.ppms.pojo.BoxingDetailsPojo;
import com.ppms.pojo.BoxingProductPojo;
import com.ppms.pojo.BoxingsPojo;
import com.ppms.pojo.DispatchRawProductPojo;
import com.ppms.pojo.GstReceivedPojo;
import com.ppms.pojo.GstReceivedProductPojo;
import com.ppms.pojo.ProductMfgDetailsPojo;
import com.ppms.pojo.ProductPackagingDetailsPojo;
import com.ppms.pojo.ProductPackagingPojo;
import com.ppms.pojo.RawProductPojo;
import com.ppms.pojo.RawReceivedPojo;
import com.ppms.pojo.RawReceivedProductPojo;
import com.ppms.pojo.RawSupplierPojo;
import com.ppms.service.ManufactureService;
import com.ppms.service.PackagingService;
import com.ppms.service.RawProductService;


@Service
public class PackagingServiceImpl implements PackagingService {

	@Autowired
	PackagingDao packagingDao;

	@Override
	public List<String> getProductMfgName() {
		
		return packagingDao.getProductMfgNameList();
	}

	@Override
	public List<String> getProductpkgSize(String productpkgName) {
		
		return packagingDao.getProductpkgSizeList(productpkgName);
	}

	@Override
	public List<String> getProductpkgGage(String productpkgName, String productpkgSize) {
		
		return packagingDao.getProductpkgGageList(productpkgName, productpkgSize);
	}

	@Override
	public List<String> getDispatchedprodNames() {
		
		return packagingDao.getDispatchedprodNames();
	}

	@Override
	public List<String> getPlasticbagProductSize(String plasticBagProdName) {
		
		return packagingDao.getPlasticbagProductSize(plasticBagProdName);
	}

	@Override
	public Object[] getPlasticbagProductAvlQty(String plasticBagProdName, String plasticBagProdSize) {
		
		return packagingDao.getPlasticbagProductAvlQty(plasticBagProdName, plasticBagProdSize);
	}

	@Override
	public Object[] getProductmfgQty(String productmfgName, String productmfgSize, String productmfgGage) {
		
		return packagingDao.getProductmfgQty(productmfgName, productmfgSize, productmfgGage);
	}

	@Override
	public Double getProductmfgPktwt(String productmfgName, String productmfgSize, String productmfgGage) {
		
		return packagingDao.packagingDaogetProductmfgPktwt(productmfgName,productmfgSize,productmfgGage);
	}

	@Override
	public boolean addPackagingDetails(ProductPackagingDetailsPojo productPackaginDetailsgPojo, ProductPackagingPojo productPackagingPojo) {
		
		
		
		ProductPackagingPojo productPackaging = new ProductPackagingPojo();
		Integer productMfgId = productPackagingPojo.getProductMfgId();
		Integer rawProductId = productPackagingPojo.getRawProductId();
		productPackaging = packagingDao.getProductPackagingData(productMfgId,rawProductId);
		if(productPackaging != null){
			double updNoOfPackets = productPackaging.getNoOfPacketsCreated() + productPackagingPojo.getNoOfPacketsCreated();
			double updTotalPackagingWt = productPackaging.getTotalPacketing() + productPackagingPojo.getTotalPacketing();
			packagingDao.updatePackagingQty(updNoOfPackets,updTotalPackagingWt,productMfgId);
			productPackaginDetailsgPojo.setPacketingId(productPackaging.getId());
		}
		else{
			packagingDao.addProductPackaging(productPackagingPojo);
			productPackaginDetailsgPojo.setPacketingId(productPackagingPojo.getId());
		}
		
		boolean addPackagigng = packagingDao.addPrductPackagingDetails(productPackaginDetailsgPojo);
		
		double updProdMfgQty = productPackagingPojo.getAvailablePacketweight()-productPackagingPojo.getTotalPacketing();
		packagingDao.updateMfgQty(updProdMfgQty,productPackagingPojo.getProductMfgId());
		double updBagQty = productPackagingPojo.getAvailableBagQty()-(productPackagingPojo.getBagweight()/1000);
		packagingDao.updateBagQty(updBagQty,productPackagingPojo.getRawProductId());
		
		return addPackagigng;
		
	}

	@Override
	public List<String> getPlasticBags() {
		return packagingDao.getPlasticBagsLis();
	}

	@Override
	public List<String> getPlasticbagSize(String plasticBagName) {
		
		return packagingDao.getPlasticbagSize(plasticBagName);
	}

	@Override
	public List<String> getProductmfgpkgSize(String productmfgName, String plasticBagName, String plasticBagSize) {
		return packagingDao.getProductmfgpkgSize(productmfgName, plasticBagName, plasticBagSize);
	}

	@Override
	public List<String> getProductmfgpkgGage(String productmfgName, String productmfgSize, String plasticBagName, String plasticBagSize) {
		
		return packagingDao.getProductmfgpkgGage(productmfgName,productmfgSize,plasticBagName,plasticBagSize);
	}

	@Override
	public List<String> getProductmfgpkgName(String plasticBagName, String plasticBagSize) {
	
		return packagingDao.getProductmfgpkgName(plasticBagName, plasticBagSize);
	}

	@Override
	public Integer getPlasticBagId(String plasticBagName, String plasticBagSize) {
		
		return packagingDao.getPlasticBagId(plasticBagName, plasticBagSize);
	}

	@Override
	public List<String> getMfgpkgProductName(String plasticBagName, String plasticBagSize) {
		
		return packagingDao.getMfgpkgProductName(plasticBagName, plasticBagSize);
	}

	@Override
	public Object[] getProductmfgpkgQty(String productmfgName, String productmfgSize,String productmfgGage, String plasticBagName, String plasticBagSize) {
		
		return packagingDao.getProductmfgpkgQty(productmfgName, productmfgSize, productmfgGage, plasticBagName, plasticBagSize);
		
	}

	@Override
	public List<Object[]> getPackagingList() {
		
		return packagingDao.getPackagingList();
	}

	@Override
	public List<String> getBoxes() {
		
		return packagingDao.getBoxeList();
	}

	@Override
	public List<String> boxSizes(String boxName) {
		
		return packagingDao.boxSizeList(boxName);
	}

	@Override
	public Object[] boxAvlQty(String boxName, String boxSize) {
		
		return packagingDao.boxAvlQty(boxName, boxSize);
	}
    @Transactional
	@Override
	public boolean addBoxingDetails(BoxingDetailsPojo boxingDetailsPojo, BoxingProductPojo[] boxingProductPojo) {
		
		packagingDao.addBoxingDtails(boxingDetailsPojo);
		double updDispatchBoxQty = boxingDetailsPojo.getAvailableBoxQty()-boxingDetailsPojo.getTotalWeight();
		packagingDao.updateDispatchBoxQty(updDispatchBoxQty, boxingDetailsPojo.getRawProductId());
		for(BoxingProductPojo boxingProduct : boxingProductPojo){
			boxingProduct.setBoxingId(boxingDetailsPojo.getId());
			packagingDao.addBoxingProduct(boxingProduct);
			double updAvlPkgWt = boxingProduct.getAvlPkgWeight()-boxingProduct.getBoxWeight();
			packagingDao.updateAvlPkgWeight(updAvlPkgWt,boxingProduct.getProductId());
		}
		
		return true;
	}

	@Override
	public List<Object[]> getBoxingDataList() {
		
		return packagingDao.getAllBoxingData();
	}

	@Override
	public ProductPackagingDetailsPojo getPackaging(Integer id) {
		
		return packagingDao.getPackaging(id);
	}

	@Override
	public BoxingDetailsPojo getBoxingData(Integer id) {
		
		return packagingDao.getBoxingData(id);
	}

	@Override
	public List<BoxingProductPojo> getBoxingProducts(Integer id) {
		
		return packagingDao.getBoxingProducts(id);
	}

	@Override
	public boolean updatePackagingDetails(ProductPackagingDetailsPojo productPackaginDetailsgPojo,
			ProductPackagingPojo productPackagingPojo) {
		
		ProductPackagingDetailsPojo ppd = new ProductPackagingDetailsPojo();
		ppd = packagingDao.getPackaging(productPackaginDetailsgPojo.getId());
		
		ProductPackagingPojo pp = new ProductPackagingPojo();
		
		pp = packagingDao.getPackagingData(ppd.getPacketingId());
		double updNoOfPcketing = productPackaginDetailsgPojo.getNoOfPacketsCreated()-ppd.getNoOfPacketsCreated() + pp.getNoOfPacketsCreated();
		double updTotalPcketingWt = productPackaginDetailsgPojo.getTotalPacketing()-ppd.getTotalPacketing() + pp.getTotalPacketing();
		
		productPackagingPojo.setId(ppd.getPacketingId());
		productPackagingPojo.setNoOfPacketsCreated(updNoOfPcketing);
		productPackagingPojo.setTotalPacketing(updTotalPcketingWt);
		
		packagingDao.updatePacketingData(productPackagingPojo);
		
		double updProdMfgQty = productPackaginDetailsgPojo.getAvailablePacketweight()-productPackaginDetailsgPojo.getTotalPacketing()+ppd.getTotalPacketing();
		packagingDao.updateMfgQty(updProdMfgQty,productPackagingPojo.getProductMfgId());
		double updBagQty = productPackaginDetailsgPojo.getAvailableBagQty()-(productPackaginDetailsgPojo.getBagweight()/1000)+(ppd.getBagweight()/1000);
		packagingDao.updateBagQty(updBagQty,productPackagingPojo.getRawProductId());
		
		ppd.setAvailablePacketweight(updProdMfgQty);
		ppd.setAvailableBagQty(updBagQty);
		ppd.setPlasticBag(productPackaginDetailsgPojo.getPlasticBag());
		ppd.setBagSize(productPackaginDetailsgPojo.getBagSize());
		ppd.setQtyPerPacket(productPackaginDetailsgPojo.getQtyPerPacket());
		ppd.setBagweight(productPackaginDetailsgPojo.getBagweight());
		ppd.setNoOfPacketsCreated(productPackaginDetailsgPojo.getNoOfPacketsCreated());
		ppd.setPacketWeight(productPackaginDetailsgPojo.getPacketWeight());
		ppd.setWeightWithBag(productPackaginDetailsgPojo.getWeightWithBag());
		ppd.setTotalPacketing(productPackaginDetailsgPojo.getTotalPacketing());
		packagingDao.updatePackagingDetails(ppd);
		
		
		return true;
	}

	@Override
	public void deletePackagingData(Integer id) {
		ProductPackagingDetailsPojo ppd = new ProductPackagingDetailsPojo();
		
	    ppd = packagingDao.getPackaging(id);
	    
	    double noOfPacketting = ppd.getNoOfPacketsCreated();
	    double totalPackettingWt = ppd.getTotalPacketing();
	    double bagWeight = ppd.getBagweight();
	    Integer ProductMfgId = ppd.getProductMfgId();
	    Integer rawProductId = ppd.getRawProductId();
	    
	    Object[] packettingQty = packagingDao.getPackettingQty(ppd.getPacketingId());
	    
	    double updPackettingQtyWt = (Double)packettingQty[0] + totalPackettingWt;
	    double updPackettingQtyPiece = (Double)packettingQty[1] + noOfPacketting;
	    packagingDao.updatPackettingQty(updPackettingQtyWt,updPackettingQtyPiece,ppd.getPacketingId());
	    
	    Object[] produtmfgQty = packagingDao.getProductMfgQty(ProductMfgId);
	    double updMfgQtyKg = (Double) produtmfgQty[0] + totalPackettingWt;
	    packagingDao.updateProductMfgQty(updMfgQtyKg,ProductMfgId);
	    
	    Double avlBagQty = packagingDao.getAvailableBagQty(rawProductId);
	    double updAvlBagQty = avlBagQty + bagWeight;
	    packagingDao.updateAvlBagQty(updAvlBagQty, rawProductId);
	    packagingDao.deletePackagingData(id);
	    
	}

	@Override
	public boolean addBoxings(BoxingDetailsPojo boxingDetailsPojo, BoxingsPojo boxingsPojo) {
		packagingDao.addBoxingDtails(boxingDetailsPojo);
		double updDispatchBoxQty = boxingDetailsPojo.getAvailableBoxQty()-boxingDetailsPojo.getCreatedBoxQty();
		packagingDao.updateDispatchBoxQty(updDispatchBoxQty, boxingDetailsPojo.getRawProductId());
		/*for(BoxingProductPojo boxingProduct : boxingProductPojo){
			boxingProduct.setBoxingId(boxingDetailsPojo.getId());
			packagingDao.addBoxingProduct(boxingProduct);
			double updAvlPkgWt = boxingProduct.getAvlPkgWeight()-boxingProduct.getBoxWeight();
			packagingDao.updateAvlPkgWeight(updAvlPkgWt,boxingProduct.getProductId());
		}*/
		BoxingsPojo boxing = new BoxingsPojo();
		boxing = packagingDao.getBoxing(boxingsPojo);
		if(boxing != null){
			double updTotalBox = boxing.getCreatedBoxQty() + boxingsPojo.getCreatedBoxQty();
			double updTotalWt = boxing.getTotalWeight() + boxingsPojo.getTotalWeight();
			packagingDao.updateBoxingQty(updTotalBox,updTotalWt,boxing.getId());
		}
		else {
			packagingDao.addBoxings(boxingsPojo);
		}
		return true;
	}

}
