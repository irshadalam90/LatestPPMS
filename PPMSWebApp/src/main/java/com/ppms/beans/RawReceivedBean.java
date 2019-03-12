package com.ppms.beans;

import java.util.List;

import com.ppms.pojo.RawReceivedPojo;
import com.ppms.pojo.RawReceivedProductPojo;

public class RawReceivedBean {
	
	private RawReceivedPojo rawReceived;
	private List<RawReceivedProductPojo> rawReceivedProduct;
	public RawReceivedPojo getRawReceived() {
		return rawReceived;
	}
	public void setRawReceived(RawReceivedPojo rawReceived) {
		this.rawReceived = rawReceived;
	}
	public List<RawReceivedProductPojo> getRawReceivedProduct() {
		return rawReceivedProduct;
	}
	public void setRawReceivedProduct(List<RawReceivedProductPojo> rawReceivedProduct) {
		this.rawReceivedProduct = rawReceivedProduct;
	}
	

}
