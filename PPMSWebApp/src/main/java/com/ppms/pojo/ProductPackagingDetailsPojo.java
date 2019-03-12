package com.ppms.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="packeting_details")
public class ProductPackagingDetailsPojo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2558477024752620921L;
	@Id
	@GeneratedValue
	@Column(name="id")
	private Integer id;
	@Column(name="rawProductId")
	private Integer rawProductId;
	@Column(name="productMfgId")
	private Integer productMfgId;
	@Column(name="packagingDate")
	private String packagingDate;
	@Column(name="productName")
	private String productName;
	@Column(name="productSize")
	private String productSize;
	@Column(name="productGage")
	private String productGage;
	@Column(name="batchNo")
	private String batchNo;
	@Column(name="plasticBag")
	private String plasticBag;
	@Column(name="bagSize")
	private String bagSize;
	@Column(name="qtyPerPacket")
	private double qtyPerPacket;
	@Column(name="packetWeight")
	private double packetWeight;
	@Column(name="singlePktWtKg")
	private double singlePktWtKg;
	@Column(name="bagweight")
	private double bagweight;
	@Column(name="weightWithBag")
	private double weightWithBag;
	@Column(name="usedPlasticBagQty")
	private double usedPlasticBagQty;
	@Column(name="noOfPacketsCreated")
	private double noOfPacketsCreated;
	@Column(name="totalPacketing")
	private double totalPacketing;
	@Column(name="availablePacketQty")
	private double availablePacketQty;
	@Column(name="availableBagQty")
	private double availableBagQty;
	@Column(name="availablePacketweight")
	private double availablePacketweight;
	@Column(name="financialYear")
	private String financialYear;
	@Column(name="packetingId")
	private Integer packetingId;
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
	public Integer getProductMfgId() {
		return productMfgId;
	}
	public void setProductMfgId(Integer productMfgId) {
		this.productMfgId = productMfgId;
	}
	public String getPackagingDate() {
		return packagingDate;
	}
	public void setPackagingDate(String packagingDate) {
		this.packagingDate = packagingDate;
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
	public String getBatchNo() {
		return batchNo;
	}
	public void setBatchNo(String batchNo) {
		this.batchNo = batchNo;
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
	public double getQtyPerPacket() {
		return qtyPerPacket;
	}
	public void setQtyPerPacket(double qtyPerPacket) {
		this.qtyPerPacket = qtyPerPacket;
	}
	public double getPacketWeight() {
		return packetWeight;
	}
	public void setPacketWeight(double packetWeight) {
		this.packetWeight = packetWeight;
	}
	public double getSinglePktWtKg() {
		return singlePktWtKg;
	}
	public void setSinglePktWtKg(double singlePktWtKg) {
		this.singlePktWtKg = singlePktWtKg;
	}
	public double getBagweight() {
		return bagweight;
	}
	public void setBagweight(double bagweight) {
		this.bagweight = bagweight;
	}
	public double getWeightWithBag() {
		return weightWithBag;
	}
	public void setWeightWithBag(double weightWithBag) {
		this.weightWithBag = weightWithBag;
	}
	public double getUsedPlasticBagQty() {
		return usedPlasticBagQty;
	}
	public void setUsedPlasticBagQty(double usedPlasticBagQty) {
		this.usedPlasticBagQty = usedPlasticBagQty;
	}
	public double getNoOfPacketsCreated() {
		return noOfPacketsCreated;
	}
	public void setNoOfPacketsCreated(double noOfPacketsCreated) {
		this.noOfPacketsCreated = noOfPacketsCreated;
	}
	public double getTotalPacketing() {
		return totalPacketing;
	}
	public void setTotalPacketing(double totalPacketing) {
		this.totalPacketing = totalPacketing;
	}
	public double getAvailablePacketQty() {
		return availablePacketQty;
	}
	public void setAvailablePacketQty(double availablePacketQty) {
		this.availablePacketQty = availablePacketQty;
	}
	public double getAvailableBagQty() {
		return availableBagQty;
	}
	public void setAvailableBagQty(double availableBagQty) {
		this.availableBagQty = availableBagQty;
	}
	public double getAvailablePacketweight() {
		return availablePacketweight;
	}
	public void setAvailablePacketweight(double availablePacketweight) {
		this.availablePacketweight = availablePacketweight;
	}
	public String getFinancialYear() {
		return financialYear;
	}
	public void setFinancialYear(String financialYear) {
		this.financialYear = financialYear;
	}
	public Integer getPacketingId() {
		return packetingId;
	}
	public void setPacketingId(Integer packetingId) {
		this.packetingId = packetingId;
	}
	
	
}
