package com.ppms.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ppms.dao.ManufactureDao;
import com.ppms.pojo.ManufactureProductPojo;
import com.ppms.pojo.ProductMfgDetailsPojo;
import com.ppms.pojo.ProductMfgPojo;
import com.ppms.pojo.SheetMfgDetailsPojo;
import com.ppms.pojo.SheetMfgProductPojo;
import com.ppms.pojo.SheetMfgsPojo;
import com.ppms.service.ManufactureService;


@Service
public class ManufactureServiceImpl implements ManufactureService {

	@Autowired
	ManufactureDao manufactureDao;

	@Override
	public boolean addMfgProduct(ManufactureProductPojo manufactureProductPojo) {
		
		return manufactureDao.addMfgProductData(manufactureProductPojo);
	}

	@Override
	public List<ManufactureProductPojo> getManufactureProducts() {
		
		return manufactureDao.getAllManufactureProsucts();
	}

	@Override
	public ManufactureProductPojo getManufactureProductById(Integer id) {
		
		return manufactureDao.getManufactureDataById(id);
	}

	@Override
	public boolean updateManufactureProductById(ManufactureProductPojo manufactureProductPojo) {
		ManufactureProductPojo manufactureProduct = new ManufactureProductPojo();
		manufactureProduct = manufactureDao.getManufactureDataById(manufactureProductPojo.getId());
		manufactureProduct.setProductName(manufactureProductPojo.getProductName());
		manufactureProduct.setProductSize(manufactureProductPojo.getProductSize());
		manufactureProduct.setProductGage(manufactureProductPojo.getProductGage());
		manufactureProduct.setUnitWeight(manufactureProductPojo.getUnitWeight());
		manufactureProduct.setHsnCode(manufactureProductPojo.getHsnCode());
		boolean updateMfgProduct = manufactureDao.updateMfgProductData(manufactureProduct);
		
		return updateMfgProduct;
	}

	@Override
	public boolean deleteManufactureProductById(Integer id) {
		
		return manufactureDao.deleteMfgProduct(id);
	}

	@Override
	public boolean addManufactureDetails(SheetMfgDetailsPojo sheetMfgDetailsPojo, SheetMfgsPojo sheetMfgsPojo,
			SheetMfgProductPojo[] sheetMfgProductPojo) {
	
		manufactureDao.addManufactureData(sheetMfgDetailsPojo);
		
		for(SheetMfgProductPojo sheetMfgProduct : sheetMfgProductPojo){
			sheetMfgProduct.setMfgId(sheetMfgDetailsPojo.getId());
			manufactureDao.addMfgCartProduct(sheetMfgProduct);
			double  updDispatchQty = sheetMfgProduct.getAvlQty()-sheetMfgProduct.getUsedQty();
			manufactureDao.updateDispatchQty(updDispatchQty,sheetMfgProduct.getProductId());
		}
		SheetMfgsPojo sheetMfgs = new SheetMfgsPojo();
		sheetMfgs = manufactureDao.getSheetMfgsData(sheetMfgsPojo.getSheetName(),sheetMfgsPojo.getSheetSize(), sheetMfgsPojo.getSheetGage());
		if(sheetMfgs != null){
			double updSheetMfgQty = sheetMfgs.getMfgQty() + sheetMfgDetailsPojo.getMfgQty();
			manufactureDao.updateSheetMfgQty(updSheetMfgQty,sheetMfgs.getId());
		}
		else {
			manufactureDao.addSheetMfgsData(sheetMfgsPojo);
		}
		return true;
	}

	@Override
	public List<SheetMfgDetailsPojo> getMfgDetailList() {
		
		return manufactureDao.getAllManufactureList();
	}

	@Override
	public SheetMfgDetailsPojo getSheetManufactureById(Integer id) {
		
		return manufactureDao.getSheetManufactureDataById(id);
	}

	@Override
	public List<SheetMfgProductPojo> getSheetMfgProducts(Integer id) {
		
		return manufactureDao.getSheetMfgProductsList(id);
	}

	@Override
	public boolean deleteSheetManufactureById(Integer id) {
		
		return manufactureDao.deleSheetMfgDetails(id);
	}

	/*@Override
	public List<Object[]> getSheetMfg(String sheetName) {
		
		return manufactureDao.getSheetMfgData(sheetName);
	}*/

	@Override
	public Double getSheetAvlQty(String sheetName, String sheetSize, String sheetGage) {
		
		return manufactureDao.getSheetAvlQty(sheetName, sheetSize, sheetGage);
	}

	@Override
	public List<String> getSheetMfgSize(String sheetName) {
		
		return manufactureDao.getSheetMfgSizeList(sheetName);
	}

	@Override
	public List<String> getSheetMfgGage(String sheetName, String sheetSize) {
		
		return manufactureDao.getSheetMfgGageList(sheetName,sheetSize);
	}

	@Override
	public List<String> getProductMfgSize(String productName) {
		
		return manufactureDao.getProductMfgSizeList(productName);
	}

	@Override
	public List<String> getProductMfgGage(String productName, String productSize) {
		return manufactureDao.getProductMfgGageList(productName,productSize);
	}

	@Override
	public List<String> getSheetMfgSheetName() {
		
		return manufactureDao.getSheetMfgSheetNameList();
	}

	@Override
	public List<String> getMfgProductName() {
		
		return manufactureDao.getMfgProductNameList();
	}

	@Override
	public boolean addProductMfgDetails(ProductMfgDetailsPojo productMfgDetailsPojo, ProductMfgPojo productMfgPojo) {
		
		manufactureDao.addProductMfgData(productMfgDetailsPojo);
		ProductMfgPojo productMfg = new ProductMfgPojo();
		productMfg = manufactureDao.getProductMfgData(productMfgPojo);
		if(productMfg != null){
			double updProductMfgQtyKg = productMfg.getMfgQtyKg() + productMfgPojo.getMfgQtyKg();
			double updProductMfgQtyPieces = productMfg.getMfgQtyKg() + productMfgPojo.getMfgQtyKg();
			manufactureDao.updateProductMfgQty(updProductMfgQtyKg,updProductMfgQtyPieces,productMfg.getId());
		}
		else{
			manufactureDao.addProductMfg(productMfgPojo);
		}
		
		double updSheetMfgQty = productMfgDetailsPojo.getAvailableQty() - productMfgDetailsPojo.getUsedQty();
		manufactureDao.updatesSheetMfgQty(updSheetMfgQty,productMfgDetailsPojo.getSheetName(),productMfgDetailsPojo.getSheetSize(),productMfgDetailsPojo.getSheetGage());
		return true;
	}

	@Override
	public List<ProductMfgDetailsPojo> getProductMfgList() {
		
		return manufactureDao.getProductMfgListData();
	}

	@Override
	public ProductMfgDetailsPojo getProductMfgById(Integer id) {
		
		return manufactureDao.getProductMfgDataById(id);
	}

	@Override
	public boolean deleteProductMfgById(Integer id) {
	
		return manufactureDao.deleteProductMfgById(id);
	}

	@Override
	public boolean updateProductMfg(ProductMfgDetailsPojo productMfgPojo) {
		ProductMfgDetailsPojo productMfgData = new ProductMfgDetailsPojo();
		productMfgData = manufactureDao.getProductMfgDataById(productMfgPojo.getId());
		productMfgData.setProductMfgdate(productMfgPojo.getProductMfgdate());
		productMfgData.setStartTime(productMfgPojo.getStartTime());
		productMfgData.setEndTime(productMfgPojo.getEndTime());
		productMfgData.setSheetName(productMfgPojo.getSheetName());
		productMfgData.setSheetSize(productMfgPojo.getSheetSize());
		productMfgData.setSheetGage(productMfgPojo.getSheetGage());
		productMfgData.setAvailableQty(productMfgPojo.getAvailableQty());
		productMfgData.setUsedQty(productMfgPojo.getUsedQty());
		productMfgData.setBatchNo(productMfgPojo.getBatchNo());
		productMfgData.setProductName(productMfgPojo.getProductName());
		productMfgData.setProductSize(productMfgPojo.getProductSize());
		productMfgData.setProductGage(productMfgPojo.getProductGage());
		productMfgData.setMfgQtyKg(productMfgPojo.getMfgQtyKg());
		productMfgData.setMfgQtyPiece(productMfgPojo.getMfgQtyPiece());
		
		return manufactureDao.updateProductMfgData(productMfgData);
	}

	@Override
	public List<Object[]> getRawProductNames() {
		
		return manufactureDao.getRawProductNameList();
	}

	@Override
	public Object[] getDispatchProductAvlqty(String productName) {
		
		return manufactureDao.getDispatchProductAvlblqty(productName);
	}

	@Override
	public String getRawProductName(Integer rawProductId) {
		
		return manufactureDao.getRawProductName(rawProductId);
	}

	@Override
	public Double getProductMfgunitWt(String productName, String productSize,String productGage) {
		
		return manufactureDao.getProductMfgunitWeight(productName, productSize, productGage);
	}


}
