package com.ppms.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="supplier_group")
public class SupplierGroupPojo implements Serializable {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5804645919643800543L;
	@Id
	@GeneratedValue
	@Column(name="id")
	private Integer id;
	@Column(name="supplierGroup")
	private String supplierGroup;
	@Column(name="description")
	private String description;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSupplierGroup() {
		return supplierGroup;
	}
	public void setSupplierGroup(String supplierGroup) {
		this.supplierGroup = supplierGroup;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
