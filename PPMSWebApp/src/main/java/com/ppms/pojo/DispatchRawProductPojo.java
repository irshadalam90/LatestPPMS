package com.ppms.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="dispatch_raw_product")
public class DispatchRawProductPojo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2531598969141085460L;
	@Id
	@GeneratedValue
	@Column(name="id")
	private Integer id;
	@Column(name="rawProductId")
	private Integer rawProductId;
	@Column(name="productGroup")
	private String productGroup;
	@Column(name="productName")
	private String productName;
	@Column(name="productSize")
	private String productSize;
	@Column(name="measurmentUnit")
	private String measurmentUnit;
	@Column(name="dispatchDate")
	private String dispatchDate;
	@Column(name="diapatchTime")
	private String diapatchTime;
	@Column(name="dispatchBy")
	private String dispatchBy;
	@Column(name="inventoryQty")
	private double inventoryQty;
	@Column(name="warningQty")
	private double warningQty;
	@Column(name="dispatchQty")
	private double dispatchQty;
	@Column(name="remember_token")
	private String remember_token;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getRawProductId() {
		return rawProductId;
	}
	public void setRawProductId(Integer rawProductId) {
		this.rawProductId = rawProductId;
	}
	public String getProductGroup() {
		return productGroup;
	}
	public void setProductGroup(String productGroup) {
		this.productGroup = productGroup;
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
	public String getMeasurmentUnit() {
		return measurmentUnit;
	}
	public void setMeasurmentUnit(String measurmentUnit) {
		this.measurmentUnit = measurmentUnit;
	}
	public String getDispatchDate() {
		return dispatchDate;
	}
	public void setDispatchDate(String dispatchDate) {
		this.dispatchDate = dispatchDate;
	}
	public String getDiapatchTime() {
		return diapatchTime;
	}
	public void setDiapatchTime(String diapatchTime) {
		this.diapatchTime = diapatchTime;
	}
	public String getDispatchBy() {
		return dispatchBy;
	}
	public void setDispatchBy(String dispatchBy) {
		this.dispatchBy = dispatchBy;
	}
	public double getInventoryQty() {
		return inventoryQty;
	}
	public void setInventoryQty(double inventoryQty) {
		this.inventoryQty = inventoryQty;
	}
	public double getWarningQty() {
		return warningQty;
	}
	public void setWarningQty(double warningQty) {
		this.warningQty = warningQty;
	}
	public double getDispatchQty() {
		return dispatchQty;
	}
	public void setDispatchQty(double dispatchQty) {
		this.dispatchQty = dispatchQty;
	}
	public String getRemember_token() {
		return remember_token;
	}
	public void setRemember_token(String remember_token) {
		this.remember_token = remember_token;
	}
	
}
