package com.ppms.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="bank_entries")
public class BankEntryPojo implements Serializable {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4768165553304698019L;
	@Id
	@GeneratedValue
	@Column(name="id")
	private Integer id;
	@Column(name="date")
	private String date;
	@Column(name="bankName")
	private String bankName;
	@Column(name="transactionType")
	private String transactionType;
	@Column(name="particulars")
	private String particulars;
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getTransactionType() {
		return transactionType;
	}
	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}
	public String getParticulars() {
		return particulars;
	}
	public void setParticulars(String particulars) {
		this.particulars = particulars;
	}
	public String getPaymentMode() {
		return paymentMode;
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
