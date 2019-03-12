package com.ppms.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="bank_account")
public class BankAccountPojo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6900706366060032230L;
	@Id
	@GeneratedValue
	@Column(name="id")
	private Integer id;
	@Column(name="bankName")
	private String bankName;
	@Column(name="accountName")
	private String accountName;
	@Column(name="accHolderName")
	private String accHolderName;
	@Column(name="accNumber")
	private String accNumber;
	@Column(name="ifscCode")
	private String ifscCode;
	@Column(name="branch")
	private String branch;
	@Column(name="openingBalanceDate")
	private String openingBalanceDate;
	@Column(name="openingBalance")
	private String openingBalance;
	@Column(name="openingBalMode")
	private String openingBalMode;
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
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public String getAccHolderName() {
		return accHolderName;
	}
	public void setAccHolderName(String accHolderName) {
		this.accHolderName = accHolderName;
	}
	public String getAccNumber() {
		return accNumber;
	}
	public void setAccNumber(String accNumber) {
		this.accNumber = accNumber;
	}
	public String getIfscCode() {
		return ifscCode;
	}
	public void setIfscCode(String ifscCode) {
		this.ifscCode = ifscCode;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
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
	
	
}
