package com.ppms.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="mfg_products")
public class ManufactureProductPojo implements Serializable {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6492086270284516105L;
	@Id
	@GeneratedValue
	@Column(name="id")
	private Integer id;
	@Column(name="productName")
	private String productName;
	@Column(name="productSize")
	private String productSize;
	@Column(name="productGage")
	private String productGage;
	@Column(name="unitWeight")
	private double unitWeight;
	@Column(name="hsnCode")
	private String hsnCode;
	@Column(name="status")
	private String status;
	@Column(name="warningQty")
	private double warningQty;
	@Column(name="inventoryQty")
	private double inventoryQty;
	@Column(name="openingBalance")
	private Integer openingBalance;
	@Column(name="closingBalance")
	private String closingBalance;
	@Column(name="financialYear")
	private String financialYear;
	@Column(name="remember_token")
	private String remember_token;
	@Column(name="updated_at")
	private String updated_at;
	@Column(name="created_at")
	private String created_at;
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
	public String getProductGage() {
		return productGage;
	}
	public void setProductGage(String productGage) {
		this.productGage = productGage;
	}
	public double getUnitWeight() {
		return unitWeight;
	}
	public void setUnitWeight(double unitWeight) {
		this.unitWeight = unitWeight;
	}
	public String getHsnCode() {
		return hsnCode;
	}
	public void setHsnCode(String hsnCode) {
		this.hsnCode = hsnCode;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public double getWarningQty() {
		return warningQty;
	}
	public void setWarningQty(double warningQty) {
		this.warningQty = warningQty;
	}
	public double getInventoryQty() {
		return inventoryQty;
	}
	public void setInventoryQty(double inventoryQty) {
		this.inventoryQty = inventoryQty;
	}
	public Integer getOpeningBalance() {
		return openingBalance;
	}
	public void setOpeningBalance(Integer openingBalance) {
		this.openingBalance = openingBalance;
	}
	public String getClosingBalance() {
		return closingBalance;
	}
	public void setClosingBalance(String closingBalance) {
		this.closingBalance = closingBalance;
	}
	public String getFinancialYear() {
		return financialYear;
	}
	public void setFinancialYear(String financialYear) {
		this.financialYear = financialYear;
	}
	public String getRemember_token() {
		return remember_token;
	}
	public void setRemember_token(String remember_token) {
		this.remember_token = remember_token;
	}
	public String getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(String updated_at) {
		this.updated_at = updated_at;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	
	
}
