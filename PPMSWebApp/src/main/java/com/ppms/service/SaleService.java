package com.ppms.service;

import java.util.List;

import com.ppms.pojo.CustomerPojo;
import com.ppms.pojo.GstInvoicePojo;
import com.ppms.pojo.GstInvoiceProductPojo;
import com.ppms.pojo.ReferencesPojo;
import com.ppms.pojo.SaleOrderPojo;
import com.ppms.pojo.SaleOrderProductPojo;

public interface SaleService {

	boolean addCustomerDetails(CustomerPojo custmerPojo);

	List<CustomerPojo> getCustomers();

	CustomerPojo getCustomer(Integer id);

	boolean updateCustomerDetails(CustomerPojo custmerPojo);

	boolean deleteCustomerDetails(Integer id);

	List<String> getProductNameList();

	List<String> getProductSizeList(String productName);

	List<String> getProductGageList(String productName, String productSize);

	Object[] getProductQtyList(String productName, String productSize, String productGage);

	Double getProductUnitWeight(String productName, String productSize, String productGage);

	boolean addSaleOrder(SaleOrderPojo saleOrderPojo, SaleOrderProductPojo[] saleOrderProductPojo);

	List<String> getCustomerNamesList();

	Object[] getCustomerShipAddress(String customerName);

	boolean addReferences(ReferencesPojo referencesPojo);

	List<ReferencesPojo> getReferencesList();

	List<SaleOrderPojo> getSaleOrdersList();

	boolean addGstInvoice(GstInvoicePojo gstInvoicePojo, GstInvoiceProductPojo[] gstInvoiceProductPojo);

	List<GstInvoicePojo> getGstInvoiceList();

	
}
