package com.ppms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ppms.dao.BankAccountDao;
import com.ppms.dao.HomeDao;
import com.ppms.dao.RawProductDao;
import com.ppms.pojo.BankAccountPojo;
import com.ppms.pojo.BankEntryPojo;
import com.ppms.pojo.PaymentsPojo;
import com.ppms.pojo.UserPojo;
import com.ppms.service.BankAccountService;
import com.ppms.service.HomeService;

@Service
public class BankAccountServiceImpl implements BankAccountService{

	@Autowired
	BankAccountDao bankAccountDao;

	@Autowired
	RawProductDao rawProductDao;
	
	@Override
	public boolean submitBankAccountData(BankAccountPojo bankAccountPojo) {
		
		return bankAccountDao.submitBankAccountData(bankAccountPojo);
	}

	@Override
	public List<BankAccountPojo> getBankAccountList() {
		
		return bankAccountDao.getBankAccountList();
	}

	@Override
	public BankAccountPojo getBankAccountData(Integer id) {
		
		return bankAccountDao.getBankAccountData(id);
	}

	@Override
	public boolean updateBankAccountData(BankAccountPojo bankAccountPojo) {
		BankAccountPojo bankAccount = new BankAccountPojo();
		bankAccount = bankAccountDao.getBankAccountData(bankAccountPojo.getId());
		bankAccount.setBankName(bankAccountPojo.getBankName());
		bankAccount.setAccountName(bankAccountPojo.getAccountName());
		bankAccount.setAccHolderName(bankAccountPojo.getAccHolderName());
		bankAccount.setAccNumber(bankAccountPojo.getAccNumber());
		bankAccount.setIfscCode(bankAccountPojo.getIfscCode());
		bankAccount.setBranch(bankAccountPojo.getBranch());
		bankAccount.setOpeningBalance(bankAccountPojo.getOpeningBalance());
		bankAccount.setOpeningBalMode(bankAccountPojo.getOpeningBalMode());
		bankAccount.setOpeningBalanceDate(bankAccountPojo.getOpeningBalanceDate());
		bankAccount.setAddress(bankAccountPojo.getAddress());
		bankAccount.setCity(bankAccountPojo.getCity());
		bankAccount.setPinCode(bankAccountPojo.getPinCode());
		bankAccount.setState(bankAccountPojo.getState());
		bankAccount.setCountry(bankAccountPojo.getCountry());
		bankAccountDao.updateBankAccount(bankAccount);
		return true;
	}

	@Override
	public boolean deleteBankAccount(Integer id) {
		
		return bankAccountDao.deleteBankAccount(id);
	}

	@Override
	public boolean submitBankEntry(BankEntryPojo bankEntryPojo) {
		
		bankAccountDao.submitBankEntryData(bankEntryPojo);
		PaymentsPojo payment = new PaymentsPojo();
		payment.setPaymentMethod(bankEntryPojo.getBankName());
		payment.setSupplierName(bankEntryPojo.getParticulars());
		payment.setPaymentMode(bankEntryPojo.getPaymentMode());
		payment.setCheckOrddno(bankEntryPojo.getCheckOrddno());
		payment.setDigitalModeType(bankEntryPojo.getDigitalModeType());
		payment.setTransactionNo(bankEntryPojo.getTransactionNo());
		payment.setAmount(bankEntryPojo.getAmount());
		payment.setPaymentDate(bankEntryPojo.getDate());
		bankAccountDao.addPaymentsInfo(payment);
		Object[] supplierData = rawProductDao.getSupplierData(bankEntryPojo.getParticulars());
		if(supplierData[0] != null){
			double updTotalBilling = (Double) supplierData[1];
			double updTotalPaid = (Double) supplierData[2] + bankEntryPojo.getAmount();
			double updBalanceAmount = updTotalBilling - updTotalPaid;
			rawProductDao.updateRawSupplierData(updTotalBilling,updTotalPaid,updBalanceAmount,bankEntryPojo.getParticulars());
		}
				
		return true;
	}

	@Override
	public List<String> getBankNames() {
		
		return bankAccountDao.getBankNames();
	}

	@Override
	public List<BankEntryPojo> getbankEntryList() {
		return bankAccountDao.getbankEntryList();
	}

	@Override
	public BankEntryPojo getbankEntryData(Integer id) {
		return bankAccountDao.getbankEntryData(id);
	}

	@Override
	public List<PaymentsPojo> getPayments() {
		
		return bankAccountDao.getPayments();
	}

	@Override
	public PaymentsPojo getPayment(Integer id) {
		
		return bankAccountDao.getPaymentData(id);
	}

	

}
