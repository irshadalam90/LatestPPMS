package com.ppms.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="product_mfgs")
public class ProductMfgPojo implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4637530085788003480L;
	@Id
	@GeneratedValue
	@Column(name="id")
	private Integer id;
	@Column(name="sheetName")
	private String sheetName;
	@Column(name="sheetSize")
	private String sheetSize;
	@Column(name="sheetGage")
	private String sheetGage;
	@Column(name="productName")
	private String productName;
	@Column(name="productSize")
	private String productSize;
	@Column(name="productGage")
	private String productGage;
	@Column(name="usedQty")
	private double usedQty;
	@Column(name="batchNo")
	private String batchNo;
	@Column(name="mfgQtyPiece")
	private double mfgQtyPiece;
	@Column(name="mfgQtyKg")
	private double mfgQtyKg;
	@Column(name="availableQty")
	private double availableQty;
	@Column(name="financialYear")
	private String financialYear;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSheetName() {
		return sheetName;
	}
	public void setSheetName(String sheetName) {
		this.sheetName = sheetName;
	}
	public String getSheetSize() {
		return sheetSize;
	}
	public void setSheetSize(String sheetSize) {
		this.sheetSize = sheetSize;
	}
	public String getSheetGage() {
		return sheetGage;
	}
	public void setSheetGage(String sheetGage) {
		this.sheetGage = sheetGage;
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
	public String getProductGage() {
		return productGage;
	}
	public void setProductGage(String productGage) {
		this.productGage = productGage;
	}
	public double getUsedQty() {
		return usedQty;
	}
	public void setUsedQty(double usedQty) {
		this.usedQty = usedQty;
	}
	public String getBatchNo() {
		return batchNo;
	}
	public void setBatchNo(String batchNo) {
		this.batchNo = batchNo;
	}
	public double getMfgQtyPiece() {
		return mfgQtyPiece;
	}
	public void setMfgQtyPiece(double mfgQtyPiece) {
		this.mfgQtyPiece = mfgQtyPiece;
	}
	public double getMfgQtyKg() {
		return mfgQtyKg;
	}
	public void setMfgQtyKg(double mfgQtyKg) {
		this.mfgQtyKg = mfgQtyKg;
	}
	public double getAvailableQty() {
		return availableQty;
	}
	public void setAvailableQty(double availableQty) {
		this.availableQty = availableQty;
	}
	public String getFinancialYear() {
		return financialYear;
	}
	public void setFinancialYear(String financialYear) {
		this.financialYear = financialYear;
	}
	
	
}
