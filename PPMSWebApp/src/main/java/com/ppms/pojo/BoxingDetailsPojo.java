package com.ppms.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="boxing_details")
public class BoxingDetailsPojo implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4922422701349467968L;
	@Id
	@GeneratedValue
	@Column(name="id")
	private Integer id;
	@Column(name="rawProductId")
	private Integer rawProductId;
	@Column(name="boxingDate")
	private String boxingDate;
	@Column(name="plasticBag")
	private String plasticBag;
	@Column(name="bagSize")
	private String bagSize;
	@Column(name="productName")
	private String productName;
	@Column(name="productSize")
	private String productSize;
	@Column(name="productGage")
	private String productGage;
	@Column(name="qtyPerPkt")
	private double qtyPerPkt;
	@Column(name="noOfPkts")
	private double noOfPkts;
	@Column(name="boxWeight")
	private double boxWeight;
	@Column(name="avlPkgWeight")
	private double avlPkgWeight;
	@Column(name="singlePktWt")
	private double singlePktWt;
	@Column(name="boxName")
	private String boxName;
	@Column(name="boxSize")
	private String boxSize;
	@Column(name="createdBoxQty")
	private double createdBoxQty;
	@Column(name="totalWeight")
	private double totalWeight;
	@Column(name="availableBoxQty")
	private double availableBoxQty;
	@Column(name="availableWeight")
	private double availableWeight;
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
	public String getBoxingDate() {
		return boxingDate;
	}
	public void setBoxingDate(String boxingDate) {
		this.boxingDate = boxingDate;
	}
	public String getPlasticBag() {
		return plasticBag;
	}
	public void setPlasticBag(String plasticBag) {
		this.plasticBag = plasticBag;
	}
	public String getBagSize() {
		return bagSize;
	}
	public void setBagSize(String bagSize) {
		this.bagSize = bagSize;
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
	public double getQtyPerPkt() {
		return qtyPerPkt;
	}
	public void setQtyPerPkt(double qtyPerPkt) {
		this.qtyPerPkt = qtyPerPkt;
	}
	public double getNoOfPkts() {
		return noOfPkts;
	}
	public void setNoOfPkts(double noOfPkts) {
		this.noOfPkts = noOfPkts;
	}
	public double getBoxWeight() {
		return boxWeight;
	}
	public void setBoxWeight(double boxWeight) {
		this.boxWeight = boxWeight;
	}
	public double getAvlPkgWeight() {
		return avlPkgWeight;
	}
	public void setAvlPkgWeight(double avlPkgWeight) {
		this.avlPkgWeight = avlPkgWeight;
	}
	public double getSinglePktWt() {
		return singlePktWt;
	}
	public void setSinglePktWt(double singlePktWt) {
		this.singlePktWt = singlePktWt;
	}
	public String getBoxName() {
		return boxName;
	}
	public void setBoxName(String boxName) {
		this.boxName = boxName;
	}
	public String getBoxSize() {
		return boxSize;
	}
	public void setBoxSize(String boxSize) {
		this.boxSize = boxSize;
	}
	public double getCreatedBoxQty() {
		return createdBoxQty;
	}
	public void setCreatedBoxQty(double createdBoxQty) {
		this.createdBoxQty = createdBoxQty;
	}
	public double getTotalWeight() {
		return totalWeight;
	}
	public void setTotalWeight(double totalWeight) {
		this.totalWeight = totalWeight;
	}
	public double getAvailableBoxQty() {
		return availableBoxQty;
	}
	public void setAvailableBoxQty(double availableBoxQty) {
		this.availableBoxQty = availableBoxQty;
	}
	public double getAvailableWeight() {
		return availableWeight;
	}
	public void setAvailableWeight(double availableWeight) {
		this.availableWeight = availableWeight;
	}
	public String getFinancialYear() {
		return financialYear;
	}
	public void setFinancialYear(String financialYear) {
		this.financialYear = financialYear;
	}
	
	
}
