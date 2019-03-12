package com.ppms.beans;

import java.util.List;

import com.ppms.pojo.GstReceivedPojo;
import com.ppms.pojo.GstReceivedProductPojo;

public class GstReceivedBean {
	
	private GstReceivedPojo gstReceived;
	private List<GstReceivedProductPojo> gstReceivedProduct;
	public GstReceivedPojo getGstReceived() {
		return gstReceived;
	}
	public void setGstReceived(GstReceivedPojo gstReceived) {
		this.gstReceived = gstReceived;
	}
	public List<GstReceivedProductPojo> getGstReceivedProduct() {
		return gstReceivedProduct;
	}
	public void setGstReceivedProduct(List<GstReceivedProductPojo> gstReceivedProduct) {
		this.gstReceivedProduct = gstReceivedProduct;
	}
	
	
}
