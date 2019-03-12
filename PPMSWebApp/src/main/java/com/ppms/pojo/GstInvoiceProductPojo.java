package com.ppms.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CascadeType;

@Entity
@Table(name="gst_invoice_product")
public class GstInvoiceProductPojo implements Serializable{
	
	private static final long serialVersionUID = 8786794179668254742L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	@Column(name="productName")
	private String productName;
	@Column(name="productSize")
	private String productSize;
	@Column(name="productGage")
	private String productGage;
	@Column(name="qtyPerPkt")
	private double qtyPerPkt;
	@Column(name="pktPerBox")
	private String pktPerBox;
	@Column(name="totalBox")
	private double totalBox;
	@Column(name="boxQtyKg")
	private double boxQtyKg;
	@Column(name="rate")
	private double rate;
	@Column(name="tax")
	private String tax;
	@Column(name="gstPer")
	private int gstPer;
	@Column(name="gstRate")
	private double gstRate;
	@Column(name="discountPer1")
	private int discountPer1;
	@Column(name="discount1")
	private double discount1;
	@Column(name="discountPer2")
	private int discountPer2;
	@Column(name="discount2")
	private double discount2;
	@Column(name="totalDiscount")
	private double totalDiscount;
	@Column(name="singleBoxWeight")
	private double singleBoxWeight;
	@Column(name="productUnitWeight")
	private double productUnitWeight;
	@Column(name="amount")
	private double amount;
	@Column(name="discountDesc1")
	private String discountDesc1;
	@Column(name="discountDesc2")
	private String discountDesc2;
    @Column(name="discountDesc3")
	private String discountDesc3;
    @Column(name="discountKg")
	private double discountKg;
    @Column(name="discount3")
	private double discount3;
	@Column(name="financialYear")
	private String financialYear;
	@Column(name="rememberToken")
	private String rememberToken;
	@Column(name="gstInvoiceId")
	private Integer gstInvoiceId;
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
	public double getQtyPerPkt() {
		return qtyPerPkt;
	}
	public void setQtyPerPkt(double qtyPerPkt) {
		this.qtyPerPkt = qtyPerPkt;
	}
	public String getPktPerBox() {
		return pktPerBox;
	}
	public void setPktPerBox(String pktPerBox) {
		this.pktPerBox = pktPerBox;
	}
	public double getTotalBox() {
		return totalBox;
	}
	public void setTotalBox(double totalBox) {
		this.totalBox = totalBox;
	}
	public double getBoxQtyKg() {
		return boxQtyKg;
	}
	public void setBoxQtyKg(double boxQtyKg) {
		this.boxQtyKg = boxQtyKg;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	public String getTax() {
		return tax;
	}
	public void setTax(String tax) {
		this.tax = tax;
	}
	public int getGstPer() {
		return gstPer;
	}
	public void setGstPer(int gstPer) {
		this.gstPer = gstPer;
	}
	public double getGstRate() {
		return gstRate;
	}
	public void setGstRate(double gstRate) {
		this.gstRate = gstRate;
	}
	public int getDiscountPer1() {
		return discountPer1;
	}
	public void setDiscountPer1(int discountPer1) {
		this.discountPer1 = discountPer1;
	}
	public double getDiscount1() {
		return discount1;
	}
	public void setDiscount1(double discount1) {
		this.discount1 = discount1;
	}
	public int getDiscountPer2() {
		return discountPer2;
	}
	public void setDiscountPer2(int discountPer2) {
		this.discountPer2 = discountPer2;
	}
	public double getDiscount2() {
		return discount2;
	}
	public void setDiscount2(double discount2) {
		this.discount2 = discount2;
	}
	public double getTotalDiscount() {
		return totalDiscount;
	}
	public void setTotalDiscount(double totalDiscount) {
		this.totalDiscount = totalDiscount;
	}
	public double getSingleBoxWeight() {
		return singleBoxWeight;
	}
	public void setSingleBoxWeight(double singleBoxWeight) {
		this.singleBoxWeight = singleBoxWeight;
	}
	public double getProductUnitWeight() {
		return productUnitWeight;
	}
	public void setProductUnitWeight(double productUnitWeight) {
		this.productUnitWeight = productUnitWeight;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getDiscountDesc1() {
		return discountDesc1;
	}
	public void setDiscountDesc1(String discountDesc1) {
		this.discountDesc1 = discountDesc1;
	}
	public String getDiscountDesc2() {
		return discountDesc2;
	}
	public void setDiscountDesc2(String discountDesc2) {
		this.discountDesc2 = discountDesc2;
	}
	public String getDiscountDesc3() {
		return discountDesc3;
	}
	public void setDiscountDesc3(String discountDesc3) {
		this.discountDesc3 = discountDesc3;
	}
	public double getDiscountKg() {
		return discountKg;
	}
	public void setDiscountKg(double discountKg) {
		this.discountKg = discountKg;
	}
	public double getDiscount3() {
		return discount3;
	}
	public void setDiscount3(double discount3) {
		this.discount3 = discount3;
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
	public Integer getGstInvoiceId() {
		return gstInvoiceId;
	}
	public void setGstInvoiceId(Integer gstInvoiceId) {
		this.gstInvoiceId = gstInvoiceId;
	}
	
}
