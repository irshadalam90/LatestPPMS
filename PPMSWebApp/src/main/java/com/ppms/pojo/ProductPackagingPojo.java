package com.ppms.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="packetings")
public class ProductPackagingPojo implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7957695482491895637L;
	@Id
	@GeneratedValue
	@Column(name="id")
	private Integer id;
	@Column(name="productMfgId")
	private Integer productMfgId;
	@Column(name="rawProductId")
	private Integer rawProductId;
	@Column(name="qtyPerPacket")
	private double qtyPerPacket;
	@Column(name="packetWeight")
	private double packetWeight;
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
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getProductMfgId() {
		return productMfgId;
	}
	public void setProductMfgId(Integer productMfgId) {
		this.productMfgId = productMfgId;
	}
	public Integer getRawProductId() {
		return rawProductId;
	}
	public void setRawProductId(Integer rawProductId) {
		this.rawProductId = rawProductId;
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
	
	
}
