package com.ppms.service;

import java.util.List;
import com.ppms.pojo.ManufactureProductPojo;
import com.ppms.pojo.ProductMfgDetailsPojo;
import com.ppms.pojo.ProductMfgPojo;
import com.ppms.pojo.SheetMfgDetailsPojo;
import com.ppms.pojo.SheetMfgProductPojo;
import com.ppms.pojo.SheetMfgsPojo;

public interface ManufactureService {

	boolean addMfgProduct(ManufactureProductPojo manufactureProductPojo);

	List<ManufactureProductPojo> getManufactureProducts();

	ManufactureProductPojo getManufactureProductById(Integer id);

	boolean updateManufactureProductById(ManufactureProductPojo manufactureProductPojo);

	boolean deleteManufactureProductById(Integer id);

	boolean addManufactureDetails(SheetMfgDetailsPojo sheetMfgDetailsPojo, SheetMfgsPojo sheetMfgsPojo, SheetMfgProductPojo[] sheetMfgProductPojo);

	List<SheetMfgDetailsPojo> getMfgDetailList();

	SheetMfgDetailsPojo getSheetManufactureById(Integer id);

	List<SheetMfgProductPojo> getSheetMfgProducts(Integer id);

	boolean deleteSheetManufactureById(Integer id);

	//List<String> getSheetMfg(String sheetName);

	Double getSheetAvlQty(String sheetName, String sheetSize, String sheetGage);

	List<String> getSheetMfgSize(String sheetName);

	List<String> getSheetMfgGage(String sheetName, String sheetSize);

	List<String> getProductMfgSize(String productName);

	List<String> getProductMfgGage(String productName, String productSize);

	List<String> getSheetMfgSheetName();

	List<String> getMfgProductName();

	boolean addProductMfgDetails(ProductMfgDetailsPojo productMfgDetailsPojo, ProductMfgPojo productMfgPojo);

	List<ProductMfgDetailsPojo> getProductMfgList();

	ProductMfgDetailsPojo getProductMfgById(Integer id);

	boolean deleteProductMfgById(Integer id);

	boolean updateProductMfg(ProductMfgDetailsPojo productMfgPojo);

	List<Object[]> getRawProductNames();

	Object[] getDispatchProductAvlqty(String productName);

	String getRawProductName(Integer rawProductId);

	Double getProductMfgunitWt(String productName, String productSize, String productGage);

	

	
}
