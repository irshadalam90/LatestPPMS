package com.ppms.dao;

import java.util.List;

import com.ppms.pojo.BankAccountPojo;
import com.ppms.pojo.BankEntryPojo;
import com.ppms.pojo.PaymentsPojo;
public interface BankAccountDao {

	boolean submitBankAccountData(BankAccountPojo bankAccountPojo);

	List<BankAccountPojo> getBankAccountList();

	BankAccountPojo getBankAccountData(Integer id);

	void updateBankAccount(BankAccountPojo bankAccount);

	boolean deleteBankAccount(Integer id);

	boolean submitBankEntryData(BankEntryPojo bankEntryPojo);

	List<String> getBankNames();

	List<BankEntryPojo> getbankEntryList();

	BankEntryPojo getbankEntryData(Integer id);

	List<PaymentsPojo> getPayments();

	PaymentsPojo getPaymentData(Integer id);

	void addPaymentsInfo(PaymentsPojo payment);


}
