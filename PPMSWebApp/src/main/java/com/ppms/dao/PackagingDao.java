package com.ppms.dao;

import java.util.List;

import com.ppms.pojo.BoxingDetailsPojo;
import com.ppms.pojo.BoxingProductPojo;
import com.ppms.pojo.BoxingsPojo;
import com.ppms.pojo.ProductMfgDetailsPojo;
import com.ppms.pojo.ProductPackagingDetailsPojo;
import com.ppms.pojo.ProductPackagingPojo;
import com.ppms.pojo.RawProductPojo;


public interface PackagingDao {

	List<String> getProductMfgNameList();

	List<String> getProductpkgSizeList(String productpkgName);

	List<String> getProductpkgGageList(String productpkgName, String productpkgSize);

	List<String> getDispatchedprodNames();

	List<String> getPlasticbagProductSize(String plasticBagProdName);

	Object[] getPlasticbagProductAvlQty(String plasticBagProdName, String plasticBagProdSize);

	Object[] getProductmfgQty(String productmfgName, String productmfgSize, String productmfgGage);

	Double packagingDaogetProductmfgPktwt(String productmfgName, String productmfgSize, String productmfgGage);

	boolean addPrductPackagingDetails(ProductPackagingDetailsPojo productPackaginDetailsgPojo);

	void updateMfgQty(double updProdMfgQty, Integer productMfgId);

	void updateBagQty(double updBagQty, Integer rawProductId);

	List<String> getPlasticBagsLis();

	List<String> getPlasticbagSize(String plasticBagName);

	List<String> getProductmfgpkgSize(String productmfgName, String plasticBagName, String plasticBagSize);

	List<String> getProductmfgpkgGage(String productmfgName, String productmfgSize, String plasticBagName, String plasticBagSize);

	List<String> getProductmfgpkgName(String plasticBagName, String plasticBagSize);

	Integer getPlasticBagId(String plasticBagName, String plasticBagSize);

	List<String> getMfgpkgProductName(String plasticBagName, String plasticBagSize);

	Object[] getProductmfgpkgQty(String productmfgName, String productmfgSize, String productmfgGage,
			String plasticBagName, String plasticBagSize);

	List<Object[]> getPackagingList();

	ProductPackagingPojo getProductPackagingData(Integer productMfgId, Integer rawProductId);

	void updatePackagingQty(double updNoOfPackets, double updTotalPackagingWt, Integer productMfgId);

	void addProductPackaging(ProductPackagingPojo productPackagingPojo);

	List<String> getBoxeList();

	List<String> boxSizeList(String boxName);

	Object[] boxAvlQty(String boxName, String boxSize);

	void addBoxingDtails(BoxingDetailsPojo boxingDetailsPojo);

	void addBoxingProduct(BoxingProductPojo boxingProduct);

	List<Object[]> getAllBoxingData();

	void updateAvlPkgWeight(double updAvlPkgWt, Integer productId);

	void updateDispatchBoxQty(double updDispatchBoxQty, Integer rawProductId);

	ProductPackagingDetailsPojo getPackaging(Integer id);

	BoxingDetailsPojo getBoxingData(Integer id);

	List<BoxingProductPojo> getBoxingProducts(Integer id);

	void updatePackagingDetails(ProductPackagingDetailsPojo ppd);

	void updatePacketingData(ProductPackagingPojo productPackagingPojo);

	ProductPackagingPojo getPackagingData(Integer packetingId);

	Object[] getProductMfgQty(Integer productMfgId);

	void updateProductMfgQty(double updMfgQtyKg, Integer productMfgId);

	Double getAvailableBagQty(Integer rawProductId);

	void updateAvlBagQty(double updAvlBagQty, Integer rawProductId);

	void deletePackagingData(Integer id);

	Object[] getPackettingQty(Integer packetingId);

	void updatPackettingQty(double updPackettingQtyWt, double updPackettingQtyPiece, Integer packetingId);

	BoxingsPojo getBoxing(BoxingsPojo boxingsPojo);

	void updateBoxingQty(double updTotalBox, double updTotalWt, Integer id);

	void addBoxings(BoxingsPojo boxingsPojo);

	
}
