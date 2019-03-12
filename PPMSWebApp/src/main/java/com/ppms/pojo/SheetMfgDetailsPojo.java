package com.ppms.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="sheet_mfgs_details")
public class SheetMfgDetailsPojo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6503158515225472313L;
	@Id
	@GeneratedValue
	@Column(name="id")
	private Integer id;
	@Column(name="sheetMfgdate")
	private String sheetMfgdate;
	@Column(name="startTime")
	private String startTime;
	@Column(name="endTime")
	private String endTime;
	@Column(name="sheetName")
	private String sheetName;
	@Column(name="sheetSize")
	private String sheetSize;
	@Column(name="sheetGage")
	private String sheetGage;
	@Column(name="mfgQty")
	private double mfgQty;
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
	public String getSheetMfgdate() {
		return sheetMfgdate;
	}
	public void setSheetMfgdate(String sheetMfgdate) {
		this.sheetMfgdate = sheetMfgdate;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
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
	public double getMfgQty() {
		return mfgQty;
	}
	public void setMfgQty(double mfgQty) {
		this.mfgQty = mfgQty;
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
