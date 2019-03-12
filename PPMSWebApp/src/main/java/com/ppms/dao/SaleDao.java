package com.ppms.dao;

import java.util.List;

import com.ppms.pojo.CustomerPojo;
import com.ppms.pojo.GstInvoicePojo;
import com.ppms.pojo.GstInvoiceProductPojo;
import com.ppms.pojo.ReferencesPojo;
import com.ppms.pojo.SaleOrderPojo;
import com.ppms.pojo.SaleOrderProductPojo;

public interface SaleDao {

	boolean addCustomerData(CustomerPojo custmerPojo);

	List<CustomerPojo> getCustomerList();

	CustomerPojo getCustomerData(Integer id);

	boolean updateCustomerData(CustomerPojo customer);

	boolean deleteCustomerDetails(Integer id);

	List<String> getProductNameList();

	List<String> getProductSizeList(String productName);

	List<String> getProductGageList(String productName, String productSize);

	Object[] getProductQtyList(String productName, String productSize, String productGage);

	Double getProductUnitWeight(String productName, String productSize, String productGage);

	void addSaleOrderData(SaleOrderPojo saleOrderPojo);

	void addSaleOrderProduct(SaleOrderProductPojo saleOrderProduct);

	List<String> getCustomerNamesList();

	Object[] getCustomerShipAddress(String customerName);

	boolean addReferences(ReferencesPojo referencesPojo);

	List<ReferencesPojo> getReferencesList();

	List<SaleOrderPojo> getSaleOrdersList();

	void addGstInvoiceData(GstInvoicePojo gstInvoicePojo);

	void addGstInvoiceProduct(GstInvoiceProductPojo gstInvoiceProduct);

	List<GstInvoicePojo> getGstInvoiceList();
	
}
