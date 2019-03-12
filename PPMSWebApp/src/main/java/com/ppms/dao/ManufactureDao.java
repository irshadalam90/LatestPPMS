package com.ppms.dao;

import java.util.List;
import com.ppms.pojo.ManufactureProductPojo;
import com.ppms.pojo.ProductMfgDetailsPojo;
import com.ppms.pojo.ProductMfgPojo;
import com.ppms.pojo.SheetMfgDetailsPojo;
import com.ppms.pojo.SheetMfgProductPojo;
import com.ppms.pojo.SheetMfgsPojo;


public interface ManufactureDao {

	boolean addMfgProductData(ManufactureProductPojo manufactureProductPojo);

	List<ManufactureProductPojo> getAllManufactureProsucts();

	ManufactureProductPojo getManufactureDataById(Integer id);

	boolean updateMfgProductData(ManufactureProductPojo manufactureProduct);

	boolean deleteMfgProduct(Integer id);

	void addManufactureData(SheetMfgDetailsPojo sheetMfgDetailsPojo);

	void addMfgCartProduct(SheetMfgProductPojo sheetMfgProduct);

	List<SheetMfgDetailsPojo> getAllManufactureList();

	SheetMfgDetailsPojo getSheetManufactureDataById(Integer id);

	List<SheetMfgProductPojo> getSheetMfgProductsList(Integer id);

	boolean deleSheetMfgDetails(Integer id);

	//List<Object[]> getSheetMfgData(String sheetName);

	Double getSheetAvlQty(String sheetName, String sheetSize, String sheetGage);

	List<String> getSheetMfgSizeList(String sheetName);

	List<String> getSheetMfgGageList(String sheetName, String sheetSize);

	List<String> getProductMfgSizeList(String productName);

	List<String> getProductMfgGageList(String productName, String productSize);

	List<String> getSheetMfgSheetNameList();

	List<String> getMfgProductNameList();

	boolean addProductMfgData(ProductMfgDetailsPojo productMfgDetailsPojo);

	List<ProductMfgDetailsPojo> getProductMfgListData();

	ProductMfgDetailsPojo getProductMfgDataById(Integer id);

	boolean deleteProductMfgById(Integer id);

	boolean updateProductMfgData(ProductMfgDetailsPojo productMfgData);

	List<Object[]> getRawProductNameList();

	Object[] getDispatchProductAvlblqty(String productName);

	String getRawProductName(Integer rawProductId);

	void updateDispatchQty(double updDispatchQty, Integer productId);

	SheetMfgsPojo getSheetMfgsData(String sheetName, String sheetSize, String sheetGage);

	void updateSheetMfgQty(double updSheetMfgQty, Integer id);

	void addSheetMfgsData(SheetMfgsPojo sheetMfgsPojo);

	ProductMfgPojo getProductMfgData(ProductMfgPojo productMfgPojo);

	void updateProductMfgQty(double updProductMfgQtyKg, double updProductMfgQtyPieces, Integer id);

	void addProductMfg(ProductMfgPojo productMfgPojo);

	void updatesSheetMfgQty(double updSheetMfgQty, String sheetName, String sheetSize, String sheetGage);

	Double getProductMfgunitWeight(String productName, String productSize, String productGage);

	
}
