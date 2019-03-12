package com.ppms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ppms.dao.SaleDao;
import com.ppms.pojo.CustomerPojo;
import com.ppms.pojo.GstInvoicePojo;
import com.ppms.pojo.GstInvoiceProductPojo;
import com.ppms.pojo.RawSupplierPojo;
import com.ppms.pojo.ReferencesPojo;
import com.ppms.pojo.SaleOrderPojo;
import com.ppms.pojo.SaleOrderProductPojo;
import com.ppms.service.SaleService;


@Service
public class SaleServiceImpl implements SaleService {

	@Autowired
	SaleDao saleDao;

	@Override
	public boolean addCustomerDetails(CustomerPojo custmerPojo) {
		
		return saleDao.addCustomerData(custmerPojo);
	}

	@Override
	public List<CustomerPojo> getCustomers() {
		
		return saleDao.getCustomerList();
	}

	@Override
	public CustomerPojo getCustomer(Integer id) {
		
		return saleDao.getCustomerData(id);
	}

	@Override
	public boolean updateCustomerDetails(CustomerPojo customerPojo) {
		
		CustomerPojo customer = new CustomerPojo();
		customer = saleDao.getCustomerData(customerPojo.getId());
		customer.setFirmName(customerPojo.getFirmName());
		customer.setPanNo(customerPojo.getPanNo());
		customer.setGstNo(customerPojo.getGstNo());
		customer.setContactPerson(customerPojo.getContactPerson());
		customer.setPersonDob(customerPojo.getPersonDob());
		customer.setPaymentTerms(customerPojo.getPaymentTerms());
		customer.setSalesPersons(customerPojo.getSalesPersons());
		customer.setCustomerGroup(customerPojo.getCustomerGroup());
		customer.setShipAddress(customerPojo.getShipAddress());
		customer.setShipCity(customerPojo.getShipCity());
		customer.setShipState(customerPojo.getShipState());
		customer.setShipCountry(customerPojo.getShipCountry());
		customer.setShipPinCode(customerPojo.getShipPinCode());
		customer.setAddress(customerPojo.getAddress());
		customer.setCity(customerPojo.getCity());
		customer.setState(customerPojo.getState());
		customer.setCountry(customerPojo.getCountry());
		customer.setContactNo(customerPojo.getContactNo());
		customer.setMobileNo(customerPojo.getMobileNo());
		customer.setEmailId(customerPojo.getEmailId());
		customer.setWebsite(customerPojo.getWebsite());
		customer.setOpeningBalanceDate(customerPojo.getOpeningBalanceDate());
		customer.setOpeningBalance(customerPojo.getOpeningBalance());
		customer.setCustomerNote(customerPojo.getCustomerNote());
		return saleDao.updateCustomerData(customer);
	}

	@Override
	public boolean deleteCustomerDetails(Integer id) {
		
		return saleDao.deleteCustomerDetails(id);
	}

	@Override
	public List<String> getProductNameList() {
		
		return saleDao.getProductNameList();
	}

	@Override
	public List<String> getProductSizeList(String productName) {
		
		return saleDao.getProductSizeList(productName);
	}

	@Override
	public List<String> getProductGageList(String productName, String productSize) {
		
		return saleDao.getProductGageList(productName, productSize);
	}

	@Override
	public Object[] getProductQtyList(String productName, String productSize, String productGage) {
		
		return saleDao.getProductQtyList(productName, productSize, productGage);
	}

	@Override
	public Double getProductUnitWeight(String productName, String productSize, String productGage) {
		
		return saleDao.getProductUnitWeight(productName, productSize, productGage);
	}

	@Override
	public boolean addSaleOrder(SaleOrderPojo saleOrderPojo, SaleOrderProductPojo[] saleOrderProductPojo) {
		saleDao.addSaleOrderData(saleOrderPojo);
		
		for(SaleOrderProductPojo saleOrderProduct: saleOrderProductPojo){
			if(saleOrderProduct.getTax().equals("igstper")){
				saleOrderProduct.setIgstPer(saleOrderProduct.getGstPer());
				saleOrderProduct.setIgstRate(saleOrderProduct.getGstRate());
				saleOrderProduct.setGstPer(0);
				saleOrderProduct.setGstRate(0);
			}
			saleOrderProduct.setSaleOrderId(saleOrderPojo.getId());
			saleDao.addSaleOrderProduct(saleOrderProduct);
		}
		return true;
	}

	@Override
	public List<String> getCustomerNamesList() {
		
		return saleDao.getCustomerNamesList();
	}

	@Override
	public Object[] getCustomerShipAddress(String customerName) {
		
		return saleDao.getCustomerShipAddress(customerName);
	}

	@Override
	public boolean addReferences(ReferencesPojo referencesPojo) {
		
		return saleDao.addReferences(referencesPojo);
	}

	@Override
	public List<ReferencesPojo> getReferencesList() {
		
		return saleDao.getReferencesList();
	}

	@Override
	public List<SaleOrderPojo> getSaleOrdersList() {
		
		return saleDao.getSaleOrdersList();
	}

	@Override
	public boolean addGstInvoice(GstInvoicePojo gstInvoicePojo, GstInvoiceProductPojo[] gstInvoiceProductPojo) {
		saleDao.addGstInvoiceData(gstInvoicePojo);
		
		for(GstInvoiceProductPojo gstInvoiceProduct: gstInvoiceProductPojo){
			gstInvoiceProduct.setGstInvoiceId(gstInvoicePojo.getId());
			saleDao.addGstInvoiceProduct(gstInvoiceProduct);
		}
		return true;
	}

	@Override
	public List<GstInvoicePojo> getGstInvoiceList() {
		
		return saleDao.getGstInvoiceList();
	}

	
}
