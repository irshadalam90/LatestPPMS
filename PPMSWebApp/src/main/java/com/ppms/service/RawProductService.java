package com.ppms.service;

import java.util.List;

import com.ppms.beans.GstReceivedBean;
import com.ppms.beans.RawReceivedBean;
import com.ppms.beans.RawReceivedProductBean;
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

public interface RawProductService {

	void addRawProduct(RawProductPojo rawProductPojo);

	List<RawProductPojo> getRawProductList();

	RawProductPojo getRawProductById(Integer id);

	boolean updateRawProduct(RawProductPojo rawProductPojo);

	void deleteRawProductById(Integer id);

	boolean addNewRawSupplier(RawSupplierPojo rawSupplierPojo);

	List<RawSupplierPojo> getSupplierList();

	RawSupplierPojo getRawSupplierById(Integer id);

	boolean updateRawSupplier(RawSupplierPojo rawSupplierPojo);

	boolean deleteRawSupplierById(Integer id);

	Object[] getSupplAddress(String supplierName);

	List<RawProductPojo> getProductFields(String productName);

	boolean addRawReceivedProduct(RawReceivedPojo rawReceivedPojo, RawReceivedProductPojo[] rawReceivedProductPojo);

	List<RawReceivedPojo> getRawReceived();

	List<String> getSuppliersName();

	List<String> getRawProductName();

	boolean addGstReceivedProduct(GstReceivedPojo gstReceivedPojo, GstReceivedProductPojo[] gstReceivedProductPojo);

	boolean dispatchProduct(DispatchRawProductPojo dispatchRawProductPojo, DispatchesRawProductPojo dispatchesRawProductPojo);

	List<GstReceivedPojo> getGstReceived();

	RawReceivedBean getRawReceivedDetail(Integer id);

	RawReceivedProductPojo getRawReceivedProduct(Integer id);

	void updateRawReceivedProduct(RawReceivedProductPojo rawReceivedProductPojo);

	RawReceivedProductPojo getUpdatedRawReceivedProduct(int id);

	boolean updateRawReceivedProduct(RawReceivedPojo rawReceivedPojo, RawReceivedProductPojo[] rawReceivedProductPojo);

	List<String> getSalesPersons();

	List<String> getCustomerGroup();

	GstReceivedBean getGstReceivedDetail(Integer id);

	boolean updateGstReceivedProduct(GstReceivedPojo gstReceivedPojo, GstReceivedProductPojo[] gstReceivedProductPojo);

	List<DispatchRawProductPojo> getdispatchRawProductList();

	DispatchRawProductPojo getDispatchRawProduct(Integer id);

	boolean updateDispatchProduct(DispatchRawProductPojo dispatchRawProductPojo,
			DispatchesRawProductPojo dispatchesRawProductPojo);

	void deleteDispatchProduct(Integer id);

	boolean addNewSupplierGroup(SupplierGroupPojo supplierGroupPojo);

	List<SupplierGroupPojo> getSupplierGroupList();

	SupplierGroupPojo getSupplierGroup(Integer id);

	boolean updateSupplierGroupData(SupplierGroupPojo supplierGroupPojo);

	boolean deleteSupplierGroup(Integer id);

	boolean addPayments(PaymentsPojo paymentsPojo);

}
