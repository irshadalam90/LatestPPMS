package com.ppms.pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name="boxing_products")
public class BoxingProductPojo implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -142681506256303735L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	@Column(name="boxingId")
	private Integer boxingId;
	@Column(name="productId")
	private Integer productId;
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
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getBoxingId() {
		return boxingId;
	}
	public void setBoxingId(Integer boxingId) {
		this.boxingId = boxingId;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
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
	
	
}
