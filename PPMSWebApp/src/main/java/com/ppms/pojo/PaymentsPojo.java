package com.ppms.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="payments")
public class PaymentsPojo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -9098772883620977568L;
	@Id
	@GeneratedValue
	@Column(name="id")
	private Integer id;
	@Column(name="paymentDate")
	private String paymentDate;
	@Column(name="supplierName")
	private String supplierName;
	@Column(name="address")
	private String address;
	private double totalBilling;
	private double totalPaid;
	private double balanceAmount;
	@Column(name="paymentMethod")
	private String paymentMethod;
	@Column(name="transactionType")
	private String transactionType;
	@Column(name="paymentMode")
	private String paymentMode;
	@Column(name="checkOrddno")
	private String checkOrddno;
	@Column(name="digitalModeType")
	private String digitalModeType;
	@Column(name="transactionNo")
	private String transactionNo;
	@Column(name="amount")
	private double amount;
	@Column(name="notes")
	private String notes;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public double getBalanceAmount() {
		return balanceAmount;
	}
	public void setBalanceAmount(double balanceAmount) {
		this.balanceAmount = balanceAmount;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public String getPaymentMode() {
		return paymentMode;
	}
	public String getTransactionType() {
		return transactionType;
	}
	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}
	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}
	public String getCheckOrddno() {
		return checkOrddno;
	}
	public void setCheckOrddno(String checkOrddno) {
		this.checkOrddno = checkOrddno;
	}
	public String getDigitalModeType() {
		return digitalModeType;
	}
	public void setDigitalModeType(String digitalModeType) {
		this.digitalModeType = digitalModeType;
	}
	public String getTransactionNo() {
		return transactionNo;
	}
	public void setTransactionNo(String transactionNo) {
		this.transactionNo = transactionNo;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	
}
