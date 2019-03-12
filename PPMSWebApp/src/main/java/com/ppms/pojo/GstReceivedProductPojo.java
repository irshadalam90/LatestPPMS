package com.ppms.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="gst_received_product")
public class GstReceivedProductPojo implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8936416350131017402L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	@Column(name="productName")
	private String productName;
	@Column(name="productSize")
	private String productSize;
	@Column(name="batchNo")
	private String batchNo;
	@Column(name="quantity")
	private double quantity;
	@Column(name="unit")
	private String unit;
	@Column(name="rate")
	private double rate;
	@Column(name="gstPer")
	private int gstPer;
	@Column(name="gstRate")
	private double gstRate;
	@Column(name="discDesc1")
	private String discDesc1;
	@Column(name="discPer1")
	private int discPer1;
	@Column(name="discount1")
	private double discount1;
	@Column(name="discDesc2")
	private String discDesc2;
	@Column(name="discPer2")
	private int discPer2;
	@Column(name="discount2")
	private double discount2;
	@Column(name="totalDiscount")
	private double totalDiscount;
	@Column(name="amount")
	private double amount;
	@Column(name="financialYear")
	private String financialYear;
	@Column(name="rememberToken")
	private String rememberToken;
	@Column(name="updatedAt")
	private String updatedAt;
	@Column(name="createdAt")
	private String createdAt;
	@Column(name="gstReceivedId")
	private Integer gstReceivedId;
	
	/*@ManyToOne(cascade=javax.persistence.CascadeType.ALL)
	//@JoinColumn(name="rawReceivedId",insertable=false, updatable=false)
	private RawReceivedPojo rawReceivedPojo;*/

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductSize() {
		return productSize;
	}

	public void setProductSize(String productSize) {
		this.productSize = productSize;
	}

	public String getBatchNo() {
		return batchNo;
	}

	public void setBatchNo(String batchNo) {
		this.batchNo = batchNo;
	}

	public double getQuantity() {
		return quantity;
	}

	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

	public int getGstPer() {
		return gstPer;
	}

	public void setGstPer(int gstPer) {
		this.gstPer = gstPer;
	}

	public double getGstRate() {
		return gstRate;
	}

	public void setGstRate(double gstRate) {
		this.gstRate = gstRate;
	}

	public String getDiscDesc1() {
		return discDesc1;
	}

	public void setDiscDesc1(String discDesc1) {
		this.discDesc1 = discDesc1;
	}

	public int getDiscPer1() {
		return discPer1;
	}

	public void setDiscPer1(int discPer1) {
		this.discPer1 = discPer1;
	}

	public double getDiscount1() {
		return discount1;
	}

	public void setDiscount1(double discount1) {
		this.discount1 = discount1;
	}

	public String getDiscDesc2() {
		return discDesc2;
	}

	public void setDiscDesc2(String discDesc2) {
		this.discDesc2 = discDesc2;
	}

	public int getDiscPer2() {
		return discPer2;
	}

	public void setDiscPer2(int discPer2) {
		this.discPer2 = discPer2;
	}

	public double getDiscount2() {
		return discount2;
	}

	public void setDiscount2(double discount2) {
		this.discount2 = discount2;
	}

	public double getTotalDiscount() {
		return totalDiscount;
	}

	public void setTotalDiscount(double totalDiscount) {
		this.totalDiscount = totalDiscount;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
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

	public Integer getGstReceivedId() {
		return gstReceivedId;
	}

	public void setGstReceivedId(Integer gstReceivedId) {
		this.gstReceivedId = gstReceivedId;
	}
	
	
	/*public RawReceivedPojo getRawReceivedPojo() {
		return rawReceivedPojo;
	}

	public void setRawReceivedPojo(RawReceivedPojo rawReceivedPojo) {
		this.rawReceivedPojo = rawReceivedPojo;
	}*/


}
