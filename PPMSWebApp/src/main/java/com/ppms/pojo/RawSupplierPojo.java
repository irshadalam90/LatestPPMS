package com.ppms.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="raw_suppliers")
public class RawSupplierPojo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 886934783234351412L;
	@Id
	@GeneratedValue
	@Column(name="id")
	private Integer id;
	@Column(name="firmName")
	private String firmName;
	@Column(name="panNo")
	private String panNo;
	@Column(name="contactPerson")
	private String contactPerson;
	@Column(name="personDob")
	private String personDob;
	@Column(name="address")
	private String address;
	@Column(name="city")
	private String city;
	@Column(name="state")
	private String state;
	@Column(name="country")
	private String country;
	@Column(name="pinCode")
	private Integer pinCode;
	@Column(name="contactNo")
	private String contactNo;
	@Column(name="mobileNo")
	private String mobileNo;
	@Column(name="emailId")
	private String emailId;
	@Column(name="website")
	private String website;
	@Column(name="balanceAmount")
	private double balanceAmount;
	@Column(name="advancePayment")
	private String advancePayment;
	@Column(name="totalBilling")
	private double totalBilling;
	@Column(name="totalPaid")
	private double totalPaid;
	@Column(name="roughTotalBill")
	private double roughTotalBill;
	@Column(name="roughTotalPaid")
	private double roughTotalPaid;
	@Column(name="roughTotalBalance")
	private double roughTotalBalance;
	@Column(name="gstNo")
	private String gstNo;
	@Column(name="paymentTerms")
	private String paymentTerms;
	@Column(name="paymentDays")
	private String paymentDays;
	@Column(name="salesPersons")
	private String salesPersons;
	@Column(name="customerNote")
	private String customerNote;
	@Column(name="customerGroup")
	private String customerGroup;
	@Column(name="shipAddress")
	private String shipAddress;
	@Column(name="shipCity")
	private String shipCity;
	@Column(name="shipState")
	private String shipState;
	@Column(name="shipCountry")
	private String shipCountry;
	@Column(name="shipPinCode")
	private String shipPinCode;
	@Column(name="openingBalanceDate")
	private String openingBalanceDate;
	@Column(name="openingBalance")
	private String openingBalance;
	@Column(name="openingBalMode")
	private String openingBalMode;
	@Column(name="closingBalance")
	private String closingBalance;
	@Column(name="status")
	private String status;
	@Column(name="financialYear")
	private String financialYear;
	@Column(name="rememberToken")
	private String rememberToken;
	@Column(name="updatedAt")
	private String updatedAt;
	@Column(name="createdAt")
	private String createdAt;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getFirmName() {
		return firmName;
	}
	public void setFirmName(String firmName) {
		this.firmName = firmName;
	}
	public String getPanNo() {
		return panNo;
	}
	public void setPanNo(String panNo) {
		this.panNo = panNo;
	}
	public String getContactPerson() {
		return contactPerson;
	}
	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}
	public String getPersonDob() {
		return personDob;
	}
	public void setPersonDob(String personDob) {
		this.personDob = personDob;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public Integer getPinCode() {
		return pinCode;
	}
	public void setPinCode(Integer pinCode) {
		this.pinCode = pinCode;
	}
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public double getBalanceAmount() {
		return balanceAmount;
	}
	public void setBalanceAmount(double balanceAmount) {
		this.balanceAmount = balanceAmount;
	}
	public String getAdvancePayment() {
		return advancePayment;
	}
	public void setAdvancePayment(String advancePayment) {
		this.advancePayment = advancePayment;
	}
	public double getTotalBilling() {
		return totalBilling;
	}
	public void setTotalBilling(double totalBilling) {
		this.totalBilling = totalBilling;
	}
	public double getTotalPaid() {
		return totalPaid;
	}
	public void setTotalPaid(double totalPaid) {
		this.totalPaid = totalPaid;
	}
	public double getRoughTotalBill() {
		return roughTotalBill;
	}
	public void setRoughTotalBill(double roughTotalBill) {
		this.roughTotalBill = roughTotalBill;
	}
	public double getRoughTotalPaid() {
		return roughTotalPaid;
	}
	public void setRoughTotalPaid(double roughTotalPaid) {
		this.roughTotalPaid = roughTotalPaid;
	}
	public double getRoughTotalBalance() {
		return roughTotalBalance;
	}
	public void setRoughTotalBalance(double roughTotalBalance) {
		this.roughTotalBalance = roughTotalBalance;
	}
	public String getGstNo() {
		return gstNo;
	}
	public void setGstNo(String gstNo) {
		this.gstNo = gstNo;
	}
	public String getPaymentTerms() {
		return paymentTerms;
	}
	public void setPaymentTerms(String paymentTerms) {
		this.paymentTerms = paymentTerms;
	}
	public String getPaymentDays() {
		return paymentDays;
	}
	public void setPaymentDays(String paymentDays) {
		this.paymentDays = paymentDays;
	}
	public String getSalesPersons() {
		return salesPersons;
	}
	public void setSalesPersons(String salesPersons) {
		this.salesPersons = salesPersons;
	}
	public String getCustomerNote() {
		return customerNote;
	}
	public void setCustomerNote(String customerNote) {
		this.customerNote = customerNote;
	}
	public String getCustomerGroup() {
		return customerGroup;
	}
	public void setCustomerGroup(String customerGroup) {
		this.customerGroup = customerGroup;
	}
	public String getShipAddress() {
		return shipAddress;
	}
	public void setShipAddress(String shipAddress) {
		this.shipAddress = shipAddress;
	}
	public String getShipCity() {
		return shipCity;
	}
	public void setShipCity(String shipCity) {
		this.shipCity = shipCity;
	}
	public String getShipState() {
		return shipState;
	}
	public void setShipState(String shipState) {
		this.shipState = shipState;
	}
	public String getShipCountry() {
		return shipCountry;
	}
	public void setShipCountry(String shipCountry) {
		this.shipCountry = shipCountry;
	}
	public String getShipPinCode() {
		return shipPinCode;
	}
	public void setShipPinCode(String shipPinCode) {
		this.shipPinCode = shipPinCode;
	}
	public String getOpeningBalanceDate() {
		return openingBalanceDate;
	}
	public void setOpeningBalanceDate(String openingBalanceDate) {
		this.openingBalanceDate = openingBalanceDate;
	}
	public String getOpeningBalance() {
		return openingBalance;
	}
	public void setOpeningBalance(String openingBalance) {
		this.openingBalance = openingBalance;
	}
	public String getOpeningBalMode() {
		return openingBalMode;
	}
	public void setOpeningBalMode(String openingBalMode) {
		this.openingBalMode = openingBalMode;
	}
	public String getClosingBalance() {
		return closingBalance;
	}
	public void setClosingBalance(String closingBalance) {
		this.closingBalance = closingBalance;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getFinancialYear() {
		return financialYear;
	}
	public void setFinancialYear(String financialYear) {
		this.financialYear = financialYear;
	}
	public String getRememberToken() {
		return rememberToken;
	}
	public void setRememberToken(String rememberToken) {
		this.rememberToken = rememberToken;
	}
	public String getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(String updatedAt) {
		this.updatedAt = updatedAt;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	
}
