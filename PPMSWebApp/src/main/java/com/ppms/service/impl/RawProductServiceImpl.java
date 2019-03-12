package com.ppms.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ppms.beans.GstReceivedBean;
import com.ppms.beans.RawReceivedBean;
import com.ppms.beans.RawReceivedProductBean;
import com.ppms.dao.RawProductDao;
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
import com.ppms.service.BankAccountService;
import com.ppms.service.RawProductService;


@Service
public class RawProductServiceImpl implements RawProductService {

	@Autowired
	RawProductDao rawProductDao;
	
	@Autowired
	BankAccountService bankAccountService;

	@Override
	public void addRawProduct(RawProductPojo rawProductPojo) {
		rawProductDao.addRawProduct(rawProductPojo);
	}

	@Override
	public List<RawProductPojo> getRawProductList() {
		
		return rawProductDao.getRawProducts();
	}

	@Override
	public RawProductPojo getRawProductById(Integer id) {
		
		return rawProductDao.getRawProductDataById(id);
	}

	@Override
	public boolean updateRawProduct(RawProductPojo rawProductPojo) {
		
		RawProductPojo rawProduct = new RawProductPojo();
		rawProduct = rawProductDao.getRawProductDataById(rawProductPojo.getId());
		rawProduct.setProductGroup(rawProductPojo.getProductGroup());
		rawProduct.setProductName(rawProductPojo.getProductName());
		rawProduct.setProductSize(rawProductPojo.getProductSize());
		rawProduct.setMeasurmentUnit(rawProductPojo.getMeasurmentUnit());
		rawProduct.setHsnCode(rawProductPojo.getHsnCode());
		rawProduct.setWarningQty(rawProductPojo.getWarningQty());
		rawProduct.setInventoryQty(rawProductPojo.getInventoryQty());
		
		boolean updateRawProduct = rawProductDao.updateRawProductData(rawProduct);
		return updateRawProduct;
	}

	@Override
	public void deleteRawProductById(Integer id) {
		
		rawProductDao.deleteRawProductData(id);
	}

	@Override
	public boolean addNewRawSupplier(RawSupplierPojo rawSupplierPojo) {
		
		return rawProductDao.addRawSupplier(rawSupplierPojo);
	}

	@Override
	public List<RawSupplierPojo> getSupplierList() {
		
		return rawProductDao.getAllRawSupplier();
	}

	@Override
	public RawSupplierPojo getRawSupplierById(Integer id) {
		
		return rawProductDao.rawSupplierDataById(id);
	}

	@Override
	public boolean updateRawSupplier(RawSupplierPojo rawSupplierPojo) {
		
		RawSupplierPojo rawSupplier = new RawSupplierPojo();
		rawSupplier = rawProductDao.rawSupplierDataById(rawSupplierPojo.getId());
		rawSupplier.setFirmName(rawSupplierPojo.getFirmName());
		rawSupplier.setPanNo(rawSupplierPojo.getPanNo());
		rawSupplier.setGstNo(rawSupplierPojo.getGstNo());
		rawSupplier.setContactPerson(rawSupplierPojo.getContactPerson());
		rawSupplier.setPersonDob(rawSupplierPojo.getPersonDob());
		rawSupplier.setPaymentTerms(rawSupplierPojo.getPaymentTerms());
		rawSupplier.setSalesPersons(rawSupplierPojo.getSalesPersons());
		rawSupplier.setCustomerGroup(rawSupplierPojo.getCustomerGroup());
		rawSupplier.setShipAddress(rawSupplierPojo.getShipAddress());
		rawSupplier.setShipCity(rawSupplierPojo.getShipCity());
		rawSupplier.setShipState(rawSupplierPojo.getShipState());
		rawSupplier.setShipCountry(rawSupplierPojo.getShipCountry());
		rawSupplier.setShipPinCode(rawSupplierPojo.getShipPinCode());
		rawSupplier.setAddress(rawSupplierPojo.getAddress());
		rawSupplier.setCity(rawSupplierPojo.getCity());
		rawSupplier.setState(rawSupplierPojo.getState());
		rawSupplier.setCountry(rawSupplierPojo.getCountry());
		rawSupplier.setContactNo(rawSupplierPojo.getContactNo());
		rawSupplier.setMobileNo(rawSupplierPojo.getMobileNo());
		rawSupplier.setEmailId(rawSupplierPojo.getEmailId());
		rawSupplier.setWebsite(rawSupplierPojo.getWebsite());
		rawSupplier.setOpeningBalanceDate(rawSupplierPojo.getOpeningBalanceDate());
		rawSupplier.setOpeningBalance(rawSupplierPojo.getOpeningBalance());
		rawSupplier.setCustomerNote(rawSupplierPojo.getCustomerNote());
		
		return rawProductDao.updateRawSupplierData(rawSupplier);
	}

	@Override
	public boolean deleteRawSupplierById(Integer id) {
		
		return rawProductDao.deleteRawSupplier(id);
	}

	@Override
	public Object[] getSupplAddress(String supplierName) {
		
		return rawProductDao.getSupplierAddress(supplierName);
	}

	@Override
	public List<RawProductPojo> getProductFields(String productName) {
		
		return rawProductDao.getProductColumns(productName);
	}

	@Override
	public boolean addRawReceivedProduct(RawReceivedPojo rawReceivedPojo,
			RawReceivedProductPojo[] rawReceivedProductPojo) {
		rawProductDao.addRawReceived(rawReceivedPojo);
		
		
		for(RawReceivedProductPojo rawReceivedProduct : rawReceivedProductPojo){
			//rawReceivedPojo.getRawReceivedProductPojo().add(rawReceivedProduct);
			rawReceivedProduct.setRawReceivedId(rawReceivedPojo.getId());
			rawProductDao.addRawReceivedProduct(rawReceivedProduct);
			
			RawProductPojo rawProductPojo = new RawProductPojo();
			rawProductPojo = rawProductDao.getRawProductStock(rawReceivedProduct.getProductName(), rawReceivedProduct.getProductSize());
			double inventoryQuantity = rawProductPojo.getInventoryQty();
			double rawRecieveQty = rawReceivedProduct.getQuantity();
			double updateQty = inventoryQuantity+rawRecieveQty;
			//rawProductPojo.setInventoryQty(updateQty);
			rawProductDao.updateInventoryQty(rawReceivedProduct.getProductName(), rawReceivedProduct.getProductSize(),updateQty);
		}
		
		return true;
	}

	@Override
	public List<RawReceivedPojo> getRawReceived() {
		
		return rawProductDao.getRawReceivedData();
	}

	@Override
	public List<String> getSuppliersName() {
		
		return rawProductDao.getAllSupliersName();
	}

	@Override
	public List<String> getRawProductName() {
		// TODO Auto-generated method stub
		return rawProductDao.getAllProductName();
	}

	@Override
	public boolean addGstReceivedProduct(GstReceivedPojo gstReceivedPojo,
			GstReceivedProductPojo[] gstReceivedProductPojo) {
		
		rawProductDao.addGstReceived(gstReceivedPojo);
		double totalBilling =  gstReceivedPojo.getGrandTotal();
		rawProductDao.updateSupplierTotalBilling(totalBilling,gstReceivedPojo.getSupplierName());
		
		for(GstReceivedProductPojo gstReceivedProduct : gstReceivedProductPojo){
			//rawReceivedPojo.getRawReceivedProductPojo().add(rawReceivedProduct);
			gstReceivedProduct.setGstReceivedId(gstReceivedPojo.getId());
			rawProductDao.addGstReceivedProduct(gstReceivedProduct);
			
			/*RawProductPojo rawProductPojo = new RawProductPojo();
			rawProductPojo = rawProductDao.getRawProductStock(gstReceivedProduct.getProductName(), gstReceivedProduct.getProductSize());
			double inventoryQuantity = rawProductPojo.getInventoryQty();
			double rawRecieveQty = gstReceivedProduct.getQuantity();
			double updateQty = inventoryQuantity+rawRecieveQty;
			//rawProductPojo.setInventoryQty(updateQty);
			rawProductDao.updateInventoryQty(gstReceivedProduct.getProductName(), gstReceivedProduct.getProductSize(),updateQty);*/
		}
		return true;
	}

	@Override
	public boolean dispatchProduct(DispatchRawProductPojo dispatchRawProductPojo, DispatchesRawProductPojo dispatchesRawProductPojo) {
		
		double dispatchQty = dispatchRawProductPojo.getDispatchQty();
		Double inventoryQty = rawProductDao.getInventoryQuantity(dispatchRawProductPojo.getRawProductId());
		//double dblinventoryQty = Double.parseDouble(inventoryQty);
		double updateInvQty = inventoryQty-dispatchQty;
		dispatchRawProductPojo.setInventoryQty(updateInvQty);
		rawProductDao.dispatchRawProduct(dispatchRawProductPojo);
		rawProductDao.updateInventoryQty(dispatchRawProductPojo.getRawProductId(), updateInvQty);
		 
		Integer rawProductId = dispatchesRawProductPojo.getRawProductId();
		DispatchesRawProductPojo dispatchesRawProduct = new DispatchesRawProductPojo();
		dispatchesRawProduct = rawProductDao.getDispatchesRawProduct(rawProductId);
		if(dispatchesRawProduct==null){
			rawProductDao.dispatchesRawProduct(dispatchesRawProductPojo);
		}
		else{
			
			Double dispatchesQty = rawProductDao.getDispatchesQty(rawProductId);
			double newDispatchQty =  dispatchesRawProductPojo.getDispatchQty();
			double totalDispatchQty = dispatchesQty + newDispatchQty;
			rawProductDao.updateDispatchesQty(totalDispatchQty,rawProductId);
		}
		
		return true;
	}

	@Override
	public List<GstReceivedPojo> getGstReceived() {
		
		return rawProductDao.getGstReceivedData();
	}

	@Override
	public RawReceivedBean getRawReceivedDetail(Integer id) {
		RawReceivedBean rawReceivedObj = new RawReceivedBean();
		RawReceivedPojo rawReceived = rawProductDao.getRawReceivedDetailData(id);
		List<RawReceivedProductPojo> rawReceivedProductList = rawProductDao.getRawReceivedProducts(rawReceived.getId());
		rawReceivedObj.setRawReceived(rawReceived);
		rawReceivedObj.setRawReceivedProduct(rawReceivedProductList);
		
		return rawReceivedObj;
		
	}

	@Override
	public RawReceivedProductPojo getRawReceivedProduct(Integer id) {
		// TODO Auto-generated method stub
		return rawProductDao.getRawReceivedProductData(id);
	}

	@Override
	public void updateRawReceivedProduct(RawReceivedProductPojo rrp) {
		RawReceivedProductPojo rawReceivedProduct = new RawReceivedProductPojo();
		rawReceivedProduct = rawProductDao.getRawReceivedProductData(rrp.getId());
		rawReceivedProduct.setProductName(rrp.getProductName());
		rawReceivedProduct.setBatchNo(rrp.getBatchNo());
		rawReceivedProduct.setProductSize(rrp.getProductSize());
		rawReceivedProduct.setAmount(rrp.getAmount());
		rawReceivedProduct.setDiscPer1(rrp.getDiscPer1());
		rawReceivedProduct.setDiscPer2(rrp.getDiscPer2());
		rawReceivedProduct.setDiscount1(rrp.getDiscount1());
		rawReceivedProduct.setDiscount2(rrp.getDiscount2());
		rawReceivedProduct.setGstPer(rrp.getGstPer());
		rawReceivedProduct.setGstRate(rrp.getGstRate());
		rawReceivedProduct.setQuantity(rrp.getQuantity());
		rawReceivedProduct.setRate(rrp.getRate());
		
		rawProductDao.updateRawProductData(rawReceivedProduct);
	}

	@Override
	public RawReceivedProductPojo getUpdatedRawReceivedProduct(int id) {
		// TODO Auto-generated method stub
		return rawProductDao.getUpdatedRawReceivedProduct(id);
	}

	@Override
	public boolean updateRawReceivedProduct(RawReceivedPojo rawReceivedPojo,
			RawReceivedProductPojo[] rawReceivedProductPojo) {
			
		RawReceivedPojo rr = new RawReceivedPojo();
		rr = rawProductDao.getRawReceivedDetailData(rawReceivedPojo.getId());
		rr.setSupplierName(rawReceivedPojo.getSupplierName());
		rr.setShippingAddress(rawReceivedPojo.getShippingAddress());
		rr.setShipBy(rawReceivedPojo.getShipBy());
		rr.setTrackNo(rawReceivedPojo.getTrackNo());
		rr.setInvoiceDate(rawReceivedPojo.getInvoiceDate());
		rr.setPaymentTerm(rawReceivedPojo.getPaymentTerm());
		rr.setPaymentDays(rawReceivedPojo.getPaymentDays());
		rr.setSalesPerson(rawReceivedPojo.getSalesPerson());
		rr.setInvoiceNo(rawReceivedPojo.getInvoiceNo());
		rr.setVehicleNo(rawReceivedPojo.getVehicleNo());
		rr.setDriverName(rawReceivedPojo.getDriverName());
		rr.setDriverNo(rawReceivedPojo.getDriverNo());
		rr.setShippingCost(rawReceivedPojo.getShippingCost());
		rr.setShippingGstPer(rawReceivedPojo.getShippingGstPer());
		rr.setAdditionalNote1(rawReceivedPojo.getAdditionalNote1());
		rr.setAdditonalChg1Per(rawReceivedPojo.getAdditonalChg1Per());
		rr.setAdditonalChg1(rawReceivedPojo.getAdditonalChg1());
		rr.setAdditonalNote2(rawReceivedPojo.getAdditonalNote2());
		rr.setAdditonalChg2Per(rawReceivedPojo.getAdditonalChg2Per());
		rr.setAdditonalChg2(rawReceivedPojo.getAdditonalChg2());
		rr.setSubtotal(rawReceivedPojo.getSubtotal());
		rr.setShippingGstAmt(rawReceivedPojo.getShippingGstAmt());
		rr.setTotalAdditionChg(rawReceivedPojo.getTotalAdditionChg());
		rr.setTotalSGSTAmt(rawReceivedPojo.getTotalSGSTAmt());
		rr.setTotalCGSTAmt(rawReceivedPojo.getTotalCGSTAmt());
		rr.setGrandTotal(rawReceivedPojo.getGrandTotal());
		rr.setComments(rawReceivedPojo.getComments());
		rr.setPrivateComments(rawReceivedPojo.getPrivateComments());
		rr.setNoteComments(rawReceivedPojo.getNoteComments());
		rr.setFooterComments(rawReceivedPojo.getFooterComments());
		rawProductDao.updateRawReceivedData(rr);
		rawProductDao.deleteRawProduct(rawReceivedPojo.getId());
		for(RawReceivedProductPojo rawReceivedProduct : rawReceivedProductPojo){
			rawReceivedProduct.setRawReceivedId(rawReceivedPojo.getId());
			rawProductDao.updatedRawReceivedProduct(rawReceivedProduct);
		}
		return true;
	}

	@Override
	public List<String> getSalesPersons() {
		
		return rawProductDao.getSalesPersons();
	}

	@Override
	public List<String> getCustomerGroup() {
		// TODO Auto-generated method stub
		return rawProductDao.getCustomerGroup();
	}

	@Override
	public GstReceivedBean getGstReceivedDetail(Integer id) {
		GstReceivedBean gstReceivedObj = new GstReceivedBean();
		GstReceivedPojo gstReceived = rawProductDao.getGstReceivedDetailData(id);
		List<GstReceivedProductPojo> gstReceivedProductList = rawProductDao.getGstReceivedProducts(gstReceived.getId());
		gstReceivedObj.setGstReceived(gstReceived);
		gstReceivedObj.setGstReceivedProduct(gstReceivedProductList);
		
		return gstReceivedObj;
	}

	@Override
	public boolean updateGstReceivedProduct(GstReceivedPojo gstReceivedPojo,
			GstReceivedProductPojo[] gstReceivedProductPojo) {
		GstReceivedPojo gr = new GstReceivedPojo();
		gr = rawProductDao.getGstReceivedDetailData(gstReceivedPojo.getId());
		gr.setSupplierName(gstReceivedPojo.getSupplierName());
		gr.setShippingAddress(gstReceivedPojo.getShippingAddress());
		gr.setShipBy(gstReceivedPojo.getShipBy());
		gr.setTrackNo(gstReceivedPojo.getTrackNo());
		gr.setInvoiceDate(gstReceivedPojo.getInvoiceDate());
		gr.setPaymentTerm(gstReceivedPojo.getPaymentTerm());
		gr.setPaymentDays(gstReceivedPojo.getPaymentDays());
		gr.setSalesPerson(gstReceivedPojo.getSalesPerson());
		gr.setInvoiceNo(gstReceivedPojo.getInvoiceNo());
		gr.setVehicleNo(gstReceivedPojo.getVehicleNo());
		gr.setDriverName(gstReceivedPojo.getDriverName());
		gr.setDriverNo(gstReceivedPojo.getDriverNo());
		gr.setShippingCost(gstReceivedPojo.getShippingCost());
		gr.setShippingGstPer(gstReceivedPojo.getShippingGstPer());
		gr.setAdditionalNote1(gstReceivedPojo.getAdditionalNote1());
		gr.setAdditonalChg1Per(gstReceivedPojo.getAdditonalChg1Per());
		gr.setAdditonalChg1(gstReceivedPojo.getAdditonalChg1());
		gr.setAdditonalNote2(gstReceivedPojo.getAdditonalNote2());
		gr.setAdditonalChg2Per(gstReceivedPojo.getAdditonalChg2Per());
		gr.setAdditonalChg2(gstReceivedPojo.getAdditonalChg2());
		gr.setSubtotal(gstReceivedPojo.getSubtotal());
		gr.setShippingGstAmt(gstReceivedPojo.getShippingGstAmt());
		gr.setTotalAdditionChg(gstReceivedPojo.getTotalAdditionChg());
		gr.setTotalSGSTAmt(gstReceivedPojo.getTotalSGSTAmt());
		gr.setTotalCGSTAmt(gstReceivedPojo.getTotalCGSTAmt());
		gr.setGrandTotal(gstReceivedPojo.getGrandTotal());
		gr.setComments(gstReceivedPojo.getComments());
		gr.setPrivateComments(gstReceivedPojo.getPrivateComments());
		gr.setNoteComments(gstReceivedPojo.getNoteComments());
		gr.setFooterComments(gstReceivedPojo.getFooterComments());
		rawProductDao.updateGstReceivedData(gr);
		rawProductDao.deleteGstProduct(gstReceivedPojo.getId());
		for(GstReceivedProductPojo gstReceivedProduct : gstReceivedProductPojo){
			gstReceivedProduct.setGstReceivedId(gstReceivedPojo.getId());
			rawProductDao.updatedGstReceivedProduct(gstReceivedProduct);
		}
		return true;
	}

	@Override
	public List<DispatchRawProductPojo> getdispatchRawProductList() {
		
		return rawProductDao.getdispatchRawProductList();
	}

	@Override
	public DispatchRawProductPojo getDispatchRawProduct(Integer id) {
		return rawProductDao.getDispatchRawProduct(id);
	}

	@Override
	public boolean updateDispatchProduct(DispatchRawProductPojo dispatchRawProductPojo,
			DispatchesRawProductPojo dispatchesRawProductPojo) {
		
		Integer rawProductId = dispatchRawProductPojo.getRawProductId();
		Double inventoryQty = rawProductDao.getInventoryQuantity(rawProductId);
		double newDispatchQty = dispatchRawProductPojo.getDispatchQty();
		Double oldDispatchQty = rawProductDao.getDispatchQuantity(dispatchRawProductPojo.getId());
		Double updInventoryQty = inventoryQty+oldDispatchQty-newDispatchQty;
		rawProductDao.updateInventoryQty(dispatchRawProductPojo.getRawProductId(), updInventoryQty);
		Double oldDispatchesQty = rawProductDao.getDispatchesQuantity(rawProductId);
		Double updDispatchesQty = oldDispatchesQty-oldDispatchQty+newDispatchQty;
		rawProductDao.updateDispatchesQty(updDispatchesQty, rawProductId);
		dispatchRawProductPojo.setInventoryQty(updInventoryQty);
		rawProductDao.updateDispatchRawProduct(dispatchRawProductPojo);
		//rawProductDao.updateDispatchesRawProduct(dispatchesRawProductPojo);
		return true;
	}

	@Override
	public void deleteDispatchProduct(Integer id) {
		
		Integer rawProductId = rawProductDao.getRawProductId(id);
		Double oldDispatchQty = rawProductDao.getDispatchQuantity(id);
		Double oldDispatchesQty = rawProductDao.getDispatchesQuantity(rawProductId);
		Double updDispatchesQty = oldDispatchesQty+oldDispatchQty;
		rawProductDao.updateDispatchesQty(updDispatchesQty, rawProductId);
		Double inventoryQty = rawProductDao.getInventoryQuantity(rawProductId);
		Double updInventoryQty = inventoryQty+oldDispatchQty;
		rawProductDao.updateInventoryQty(rawProductId, updInventoryQty);
		rawProductDao.deleteDispatchProduct(id);
		
	}

	@Override
	public boolean addNewSupplierGroup(SupplierGroupPojo supplierGroupPojo) {
		
		return rawProductDao.addNewSupplierGroup(supplierGroupPojo);
	}

	@Override
	public List<SupplierGroupPojo> getSupplierGroupList() {
		
		return rawProductDao.getSupplierGroupList();
	}

	@Override
	public SupplierGroupPojo getSupplierGroup(Integer id) {
		return rawProductDao.getSupplierGroupData(id);
	}

	@Override
	public boolean updateSupplierGroupData(SupplierGroupPojo supplierGroupPojo) {
		return rawProductDao.updateSupplierGroupData(supplierGroupPojo);
	}

	@Override
	public boolean deleteSupplierGroup(Integer id) {
		
		return rawProductDao.deleteSupplierGroup(id);
	}

	@Override
	public boolean addPayments(PaymentsPojo paymentsPojo) {
		
		rawProductDao.addPaymentsInfo(paymentsPojo);
		BankEntryPojo bankEntry = new BankEntryPojo();
		bankEntry.setBankName(paymentsPojo.getPaymentMethod());
		bankEntry.setParticulars(paymentsPojo.getSupplierName());
		bankEntry.setPaymentMode(paymentsPojo.getPaymentMode());
		bankEntry.setCheckOrddno(paymentsPojo.getCheckOrddno());
		bankEntry.setDigitalModeType(paymentsPojo.getDigitalModeType());
		bankEntry.setTransactionNo(paymentsPojo.getTransactionNo());
		bankEntry.setAmount(paymentsPojo.getAmount());
		bankEntry.setDate(paymentsPojo.getPaymentDate());
		rawProductDao.addBankEntry(bankEntry);
		Object[] supplierData = rawProductDao.getSupplierData(paymentsPojo.getSupplierName());
		if(supplierData[0] != null){
			double updTotalBilling = paymentsPojo.getTotalBilling();
			double updTotalPaid = paymentsPojo.getTotalPaid() + paymentsPojo.getAmount();
			double updBalanceAmount = updTotalBilling - updTotalPaid;
			rawProductDao.updateRawSupplierData(updTotalBilling,updTotalPaid,updBalanceAmount,paymentsPojo.getSupplierName());
		}
		return true;
		
	}

}
