package com.ppms.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="dispatches")
public class DispatchesRawProductPojo implements Serializable {

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
	@Column(name="dispatchQty")
	private double dispatchQty;
	@Column(name="remember_token")
	private String remember_token;
	@Column(name="financialYear")
	private String financialYear;
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
	public String getFinancialYear() {
		return financialYear;
	}
	public void setFinancialYear(String financialYear) {
		this.financialYear = financialYear;
	}
	
}
