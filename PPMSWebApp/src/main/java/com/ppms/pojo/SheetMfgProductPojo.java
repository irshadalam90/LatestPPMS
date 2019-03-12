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
@Table(name="sheet_mfg_product")
public class SheetMfgProductPojo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7164123590927348332L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	@Column(name="productName")
	private String productName;
	@Column(name="usedQty")
	private Integer usedQty;
	@Column(name="scrapUsedQty")
	private Integer scrapUsedQty;
	@Column(name="scrapAvlQty")
	private Integer scrapAvlQty;
	@Column(name="avlQty")
	private Integer avlQty;
	@Column(name="mfgId")
	private Integer mfgId;
	@Column(name="productId")
	private Integer productId;
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
	public Integer getUsedQty() {
		return usedQty;
	}
	public void setUsedQty(Integer usedQty) {
		this.usedQty = usedQty;
	}
	public Integer getScrapUsedQty() {
		return scrapUsedQty;
	}
	public void setScrapUsedQty(Integer scrapUsedQty) {
		this.scrapUsedQty = scrapUsedQty;
	}
	public Integer getScrapAvlQty() {
		return scrapAvlQty;
	}
	public void setScrapAvlQty(Integer scrapAvlQty) {
		this.scrapAvlQty = scrapAvlQty;
	}
	public Integer getAvlQty() {
		return avlQty;
	}
	public void setAvlQty(Integer avlQty) {
		this.avlQty = avlQty;
	}
	public Integer getMfgId() {
		return mfgId;
	}
	public void setMfgId(Integer mfgId) {
		this.mfgId = mfgId;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	
	
	
}
