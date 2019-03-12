package com.ppms.service;

import java.util.List;

import com.ppms.pojo.BankAccountPojo;
import com.ppms.pojo.BankEntryPojo;
import com.ppms.pojo.PaymentsPojo;

public interface BankAccountService {

	boolean submitBankAccountData(BankAccountPojo bankAccountPojo);

	List<BankAccountPojo> getBankAccountList();

	BankAccountPojo getBankAccountData(Integer id);

	boolean updateBankAccountData(BankAccountPojo bankAccountPojo);

	boolean deleteBankAccount(Integer id);

	boolean submitBankEntry(BankEntryPojo bankEntryPojo);

	List<String> getBankNames();

	List<BankEntryPojo> getbankEntryList();

	BankEntryPojo getbankEntryData(Integer id);

	List<PaymentsPojo> getPayments();

	PaymentsPojo getPayment(Integer id);

}
