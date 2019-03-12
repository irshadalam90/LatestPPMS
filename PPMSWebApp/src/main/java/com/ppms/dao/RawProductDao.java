package com.ppms.dao;

import java.util.List;

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


public interface RawProductDao {

	void addRawProduct(RawProductPojo rawProductPojo);

	List<RawProductPojo> getRawProducts();

	RawProductPojo getRawProductDataById(Integer id);

	boolean updateRawProductData(RawProductPojo rawProduct);

	void deleteRawProductData(Integer id);

	boolean addRawSupplier(RawSupplierPojo rawSupplierPojo);

	List<RawSupplierPojo> getAllRawSupplier();

	RawSupplierPojo rawSupplierDataById(Integer id);

	boolean updateRawSupplierData(RawSupplierPojo rawSupplier);

	boolean deleteRawSupplier(Integer id);

	Object[] getSupplierAddress(String supplierName);

	List<RawProductPojo> getProductColumns(String productName);

	void addRawReceived(RawReceivedPojo rawReceivedPojo);

	void addRawReceivedProduct(RawReceivedProductPojo rawReceivedProduct);

	List<RawReceivedPojo> getRawReceivedData();

	List<String> getAllSupliersName();

	List<String> getAllProductName();

	RawProductPojo getRawProductStock(String productName, String productSize);

	//void updateInventoryQty(RawProductPojo rawProductPojo);

	void updateInventoryQty(String productName, String productSize, double updateQty);

	void addGstReceived(GstReceivedPojo gstReceivedPojo);

	void addGstReceivedProduct(GstReceivedProductPojo gstReceivedProduct);

	void dispatchRawProduct(DispatchRawProductPojo dispatchRawProductPojo);

	void updateInventoryQty(Integer rawProductId, double updateInvQty);

	Double getInventoryQuantity(Integer rawProductId);

	List<GstReceivedPojo> getGstReceivedData();

	RawReceivedPojo getRawReceivedDetailData(Integer id);

	List<RawReceivedProductPojo> getRawReceivedProducts(Integer id);

	RawReceivedProductPojo getRawReceivedProductData(Integer id);

	void updateRawProductData(RawReceivedProductPojo rawReceivedProduct);

	RawReceivedProductPojo getUpdatedRawReceivedProduct(int id);

	void dispatchesRawProduct(DispatchesRawProductPojo dispatchesRawProductPojo);

	Double getDispatchesQty(Integer rawProductId);

	void updateDispatchesQty(double totalDispatchQty, Integer rawProductId);

	DispatchesRawProductPojo getDispatchesRawProduct(Integer rawProductId);

	List<String> getSalesPersons();

	List<String> getCustomerGroup();

	GstReceivedPojo getGstReceivedDetailData(Integer id);

	List<GstReceivedProductPojo> getGstReceivedProducts(Integer id);

	RawReceivedProductPojo getRawReceivedProduct(Integer id);

	void updateRawReceivedData(RawReceivedPojo rr);

	void updatedRawReceivedProduct(RawReceivedProductPojo rrp);

	void deleteRawProduct(Integer rawProductId);

	void updateGstReceivedData(GstReceivedPojo gr);

	void updatedGstReceivedProduct(GstReceivedProductPojo gstReceivedProduct);

	void deleteGstProduct(Integer id);

	List<DispatchRawProductPojo> getdispatchRawProductList();

	DispatchRawProductPojo getDispatchRawProduct(Integer id);

	void updateDispatchRawProduct(DispatchRawProductPojo dispatchRawProductPojo);

	void updateDispatchesRawProduct(DispatchesRawProductPojo dispatchesRawProductPojo);

	Double getDispatchQuantity(Integer rawProductId);

	Double getDispatchesQuantity(Integer rawProductId);

	void deleteDispatchProduct(Integer id);

	Integer getRawProductId(Integer id);

	boolean addNewSupplierGroup(SupplierGroupPojo supplierGroupPojo);

	List<SupplierGroupPojo> getSupplierGroupList();

	SupplierGroupPojo getSupplierGroupData(Integer id);

	boolean updateSupplierGroupData(SupplierGroupPojo supplierGroupPojo);

	boolean deleteSupplierGroup(Integer id);

	boolean addPaymentsInfo(PaymentsPojo paymentsPojo);

	Object[] getSupplierData(String supplierName);

	void updateRawSupplierData(double updTotalBilling, double updTotalPaid, double updBalanceAmount,
			String supplierName);

	void updateSupplierTotalBilling(double totalBilling, String supplierName);

	void addBankEntry(BankEntryPojo bankEntry);
	

}
