package com.ppms.pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name="gst_invoice")
public class GstInvoicePojo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7255113696053972930L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	@Column(name="customerName")
	private String customerName;
	@Column(name="shipAddress")
	private String shipAddress;
	@Column(name="referance")
	private String referance;
	@Column(name="invoiceNo")
	private String invoiceNo;
	@Column(name="invoiceDate")
	private String invoiceDate;
	@Column(name="dueDate")
	private String dueDate;
	@Column(name="shippingCost")
	private double shippingCost;
	@Column(name="shippingGstPer")
	private double shippingGstPer;
	@Column(name="shippingGstAmt")
	private double shippingGstAmt;
	@Column(name="shippingCGSTPer")
	private double shippingCGSTPer;
	@Column(name="shippingSGSTPer")
	private double shippingSGSTPer;
	@Column(name="shippingCGSTAmt")
	private double shippingCGSTAmt;
	@Column(name="shippingSGSTAmt")
	private double shippingSGSTAmt;
	@Column(name="subtotal")
	private double subtotal;
	@Column(name="totalDiscount")
	private double totalDiscount;
	@Column(name="additonalChg1")
	private double additonalChg1;
	@Column(name="additonalChg1Per")
	private String additonalChg1Per;
	@Column(name="additionalNote1")
	private String additionalNote1;
	@Column(name="additonalChg2")
	private double additonalChg2;
	@Column(name="additonalChg2Per")
	private double additonalChg2Per;
	@Column(name="additonalNote2")
	private String additionalNote2;
	@Column(name="discount1")
	private String discount1;
	@Column(name="discount1Amt")
	private double discount1Amt;
	@Column(name="discount2")
	private String discount2;
	@Column(name="discount2Amt")
	private double discount2Amt;
	@Column(name="totalAdditionChg")
	private double totalAdditionChg;
	@Column(name="totalDiscountAmount")
	private double totalDiscountAmount;
	@Column(name="totalGSTAmt")
	private double totalGSTAmt;
	@Column(name="totalSGSTAmt")
	private double totalSGSTAmt;
	@Column(name="totalCGSTAmt")
	private double totalCGSTAmt;
	@Column(name="grandTotal")
	private double grandTotal;
	@Column(name="balanceAmount")
	private double balanceAmount;
	@Column(name="paidStatus")
	private double paidStatus;
	@Column(name="grandTotalText")
	private double grandTotalText;
	@Column(name="status")
	private String status;
	@Column(name="productType")
	private String productType;
	@Column(name="financialYear")
	private String financialYear;
	@Column(name="rememberToken")
	private String rememberToken;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getShipAddress() {
		return shipAddress;
	}
	public void setShipAddress(String shipAddress) {
		this.shipAddress = shipAddress;
	}
	public String getReferance() {
		return referance;
	}
	public void setReferance(String referance) {
		this.referance = referance;
	}
	public String getInvoiceNo() {
		return invoiceNo;
	}
	public void setInvoiceNo(String invoiceNo) {
		this.invoiceNo = invoiceNo;
	}
	public String getInvoiceDate() {
		return invoiceDate;
	}
	public void setInvoiceDate(String invoiceDate) {
		this.invoiceDate = invoiceDate;
	}
	public String getDueDate() {
		return dueDate;
	}
	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}
	public double getShippingCost() {
		return shippingCost;
	}
	public void setShippingCost(double shippingCost) {
		this.shippingCost = shippingCost;
	}
	public double getShippingGstPer() {
		return shippingGstPer;
	}
	public void setShippingGstPer(double shippingGstPer) {
		this.shippingGstPer = shippingGstPer;
	}
	public double getShippingGstAmt() {
		return shippingGstAmt;
	}
	public void setShippingGstAmt(double shippingGstAmt) {
		this.shippingGstAmt = shippingGstAmt;
	}
	public double getShippingCGSTPer() {
		return shippingCGSTPer;
	}
	public void setShippingCGSTPer(double shippingCGSTPer) {
		this.shippingCGSTPer = shippingCGSTPer;
	}
	public double getShippingSGSTPer() {
		return shippingSGSTPer;
	}
	public void setShippingSGSTPer(double shippingSGSTPer) {
		this.shippingSGSTPer = shippingSGSTPer;
	}
	public double getShippingCGSTAmt() {
		return shippingCGSTAmt;
	}
	public void setShippingCGSTAmt(double shippingCGSTAmt) {
		this.shippingCGSTAmt = shippingCGSTAmt;
	}
	public double getShippingSGSTAmt() {
		return shippingSGSTAmt;
	}
	public void setShippingSGSTAmt(double shippingSGSTAmt) {
		this.shippingSGSTAmt = shippingSGSTAmt;
	}
	public double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}
	public double getTotalDiscount() {
		return totalDiscount;
	}
	public void setTotalDiscount(double totalDiscount) {
		this.totalDiscount = totalDiscount;
	}
	public double getAdditonalChg1() {
		return additonalChg1;
	}
	public void setAdditonalChg1(double additonalChg1) {
		this.additonalChg1 = additonalChg1;
	}
	public String getAdditonalChg1Per() {
		return additonalChg1Per;
	}
	public void setAdditonalChg1Per(String additonalChg1Per) {
		this.additonalChg1Per = additonalChg1Per;
	}
	public String getAdditionalNote1() {
		return additionalNote1;
	}
	public void setAdditionalNote1(String additionalNote1) {
		this.additionalNote1 = additionalNote1;
	}
	public double getAdditonalChg2() {
		return additonalChg2;
	}
	public void setAdditonalChg2(double additonalChg2) {
		this.additonalChg2 = additonalChg2;
	}
	public double getAdditonalChg2Per() {
		return additonalChg2Per;
	}
	public void setAdditonalChg2Per(double additonalChg2Per) {
		this.additonalChg2Per = additonalChg2Per;
	}
	public String getAdditionalNote2() {
		return additionalNote2;
	}
	public void setAdditionalNote2(String additionalNote2) {
		this.additionalNote2 = additionalNote2;
	}
	public String getDiscount1() {
		return discount1;
	}
	public void setDiscount1(String discount1) {
		this.discount1 = discount1;
	}
	public double getDiscount1Amt() {
		return discount1Amt;
	}
	public void setDiscount1Amt(double discount1Amt) {
		this.discount1Amt = discount1Amt;
	}
	public String getDiscount2() {
		return discount2;
	}
	public void setDiscount2(String discount2) {
		this.discount2 = discount2;
	}
	public double getDiscount2Amt() {
		return discount2Amt;
	}
	public void setDiscount2Amt(double discount2Amt) {
		this.discount2Amt = discount2Amt;
	}
	public double getTotalAdditionChg() {
		return totalAdditionChg;
	}
	public void setTotalAdditionChg(double totalAdditionChg) {
		this.totalAdditionChg = totalAdditionChg;
	}
	public double getTotalDiscountAmount() {
		return totalDiscountAmount;
	}
	public void setTotalDiscountAmount(double totalDiscountAmount) {
		this.totalDiscountAmount = totalDiscountAmount;
	}
	public double getTotalGSTAmt() {
		return totalGSTAmt;
	}
	public void setTotalGSTAmt(double totalGSTAmt) {
		this.totalGSTAmt = totalGSTAmt;
	}
	public double getTotalSGSTAmt() {
		return totalSGSTAmt;
	}
	public void setTotalSGSTAmt(double totalSGSTAmt) {
		this.totalSGSTAmt = totalSGSTAmt;
	}
	public double getTotalCGSTAmt() {
		return totalCGSTAmt;
	}
	public void setTotalCGSTAmt(double totalCGSTAmt) {
		this.totalCGSTAmt = totalCGSTAmt;
	}
	public double getGrandTotal() {
		return grandTotal;
	}
	public void setGrandTotal(double grandTotal) {
		this.grandTotal = grandTotal;
	}
	public double getBalanceAmount() {
		return balanceAmount;
	}
	public void setBalanceAmount(double balanceAmount) {
		this.balanceAmount = balanceAmount;
	}
	public double getPaidStatus() {
		return paidStatus;
	}
	public void setPaidStatus(double paidStatus) {
		this.paidStatus = paidStatus;
	}
	public double getGrandTotalText() {
		return grandTotalText;
	}
	public void setGrandTotalText(double grandTotalText) {
		this.grandTotalText = grandTotalText;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getProductType() {
		return productType;
	}
	public void setProductType(String productType) {
		this.productType = productType;
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
	
	
}
