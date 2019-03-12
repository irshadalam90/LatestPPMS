package com.ppms.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="raw_products")
public class RawProductPojo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3214951988641695790L;
	@Id
	@GeneratedValue
	@Column(name="id")
	private Integer id;
	@Column(name="productGroup")
	private String productGroup;
	@Column(name="productName")
	private String productName;
	@Column(name="productSize")
	private String productSize;
	@Column(name="measurmentUnit")
	private String measurmentUnit;
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
	@Column(name="dispatchQty")
	private String dispatchQty;
	@Column(name="scrapQty")
	private String scrapQty;
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
	public String getProductGroup() {
		return productGroup;
	}
	public void setProductGroup(String productGroup) {
		this.productGroup = productGroup;
	}
	public String getProductSize() {
		return productSize;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public void setProductSize(String productSize) {
		this.productSize = productSize;
	}
	public String getMeasurmentUnit() {
		return measurmentUnit;
	}
	public void setMeasurmentUnit(String measurmentUnit) {
		this.measurmentUnit = measurmentUnit;
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
	public String getDispatchQty() {
		return dispatchQty;
	}
	public void setDispatchQty(String dispatchQty) {
		this.dispatchQty = dispatchQty;
	}
	public String getScrapQty() {
		return scrapQty;
	}
	public void setScrapQty(String scrapQty) {
		this.scrapQty = scrapQty;
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
