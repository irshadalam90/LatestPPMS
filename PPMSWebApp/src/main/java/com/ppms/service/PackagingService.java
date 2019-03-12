package com.ppms.service;

import java.util.List;

import com.ppms.beans.RawReceivedBean;
import com.ppms.beans.RawReceivedProductBean;
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

public interface PackagingService {

	List<String> getProductMfgName();

	List<String> getProductpkgSize(String productpkgName);

	List<String> getProductpkgGage(String productpkgName, String productpkgSize);

	List<String> getDispatchedprodNames();

	List<String> getPlasticbagProductSize(String plasticBagProdName);

	Object[] getPlasticbagProductAvlQty(String plasticBagProdName, String plasticBagProdSize);

	Object[] getProductmfgQty(String productmfgName, String productmfgSize, String productmfgGage);

	Double getProductmfgPktwt(String productmfgName, String productmfgSize, String productmfgGage);

	boolean addPackagingDetails(ProductPackagingDetailsPojo productPackaginDetailsgPojo, ProductPackagingPojo productPackagingPojo);

	List<String> getPlasticBags();

	List<String> getPlasticbagSize(String plasticBagName);

	List<String> getProductmfgpkgSize(String productmfgName, String plasticBagName, String plasticBagSize);

	List<String> getProductmfgpkgGage(String productmfgName, String productmfgSize, String plasticBagName, String plasticBagSize);

	List<String> getProductmfgpkgName(String plasticBagName, String plasticBagSize);

	Integer getPlasticBagId(String plasticBagName, String plasticBagSize);

	List<String> getMfgpkgProductName(String plasticBagProdName, String plasticBagProdSize);

	Object[] getProductmfgpkgQty(String productmfgName, String productmfgSize, String productmfgGage, String plasticBagName, String plasticBagSize);

	List<Object[]> getPackagingList();

	List<String> getBoxes();

	List<String> boxSizes(String boxName);

	Object[] boxAvlQty(String boxName, String boxSize);

	boolean addBoxingDetails(BoxingDetailsPojo boxingDetailsPojo, BoxingProductPojo[] boxingProductPojo);

	List<Object[]> getBoxingDataList();

	ProductPackagingDetailsPojo getPackaging(Integer id);

	BoxingDetailsPojo getBoxingData(Integer id);

	List<BoxingProductPojo> getBoxingProducts(Integer id);

	boolean updatePackagingDetails(ProductPackagingDetailsPojo productPackaginDetailsgPojo,
			ProductPackagingPojo productPackagingPojo);

	void deletePackagingData(Integer id);

	boolean addBoxings(BoxingDetailsPojo boxingDetailsPojo, BoxingsPojo boxingsPojo);

	
}
