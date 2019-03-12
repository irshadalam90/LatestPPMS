package com.ppms.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.ppms.pojo.ManufactureProductPojo;
import com.ppms.pojo.ProductMfgDetailsPojo;
import com.ppms.pojo.ProductMfgPojo;
import com.ppms.pojo.RawReceivedPojo;
import com.ppms.pojo.RawReceivedProductPojo;
import com.ppms.pojo.SheetMfgDetailsPojo;
import com.ppms.pojo.SheetMfgProductPojo;
import com.ppms.pojo.SheetMfgsPojo;
import com.ppms.pojo.UserPojo;
import com.ppms.service.ManufactureService;

@Controller
public class ManufactureController {

	@Autowired
	ManufactureService manufactureService;
	
	public static final String VIEW = "manufacture";
	
	/*Manufacture Product*/
	
	@RequestMapping(value="/manufacture-products")
	public String manufactureProductPage(HttpServletRequest req, HttpSession session, ModelMap map){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			List<ManufactureProductPojo> manufactureProductList = manufactureService.getManufactureProducts();
			map.addAttribute("manufactureProductList", manufactureProductList);
			map.put("action", "manufacture-products");
			map.put("manufacture", "#");
			return VIEW+"/ViewManufactureProduct";
		}
		else {
			return "redirect:/";
		}	
	} 
	
	@RequestMapping(value="/add-mfg-product")
	public String addManufactureProduct(HttpServletRequest req, HttpSession session, ModelMap map){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			map.put("action", "manufacture-products");
			map.put("manufacture", "#");
			return VIEW+"/AddManufactureProduct";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/submit-mfg-product")
	public @ResponseBody String submitManufactureProduct(HttpServletRequest req, HttpSession session, ModelMap map, @ModelAttribute ManufactureProductPojo manufactureProductPojo ){
		
		double unitWeightGm = manufactureProductPojo.getUnitWeight();
		double unitWeightKg = unitWeightGm/1000;
		manufactureProductPojo.setUnitWeight(unitWeightKg);
		boolean addMfgProduct = manufactureService.addMfgProduct(manufactureProductPojo);
		if(addMfgProduct){
			return "success";
		}
		else {
			return "failed";
		}
		
	} 
	
	@RequestMapping(value="/view-detail-mfgproduct")
	public String viewDetailProductPage(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			ManufactureProductPojo mfgProduct = manufactureService.getManufactureProductById(id);
			map.addAttribute("mfgProduct", mfgProduct);
			map.put("action", "manufacture-products");
			map.put("manufacture", "#");
			return VIEW+"/ViewDetailMfgProduct";
		}
		else {
			return "redirect:/";
		}	
	} 
	
	@RequestMapping(value="/edit-mfgproduct")
	public String editMfgProductPage(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			ManufactureProductPojo mfgProduct = manufactureService.getManufactureProductById(id);
			map.addAttribute("mfgProduct", mfgProduct);
			map.put("action", "manufacture-products");
			map.put("manufacture", "#");
			return VIEW+"/EditMfgProduct";
		}
		else {
			return "redirect:/";
		}	
	} 
	
	@RequestMapping(value="/update-mfgproduct", method=RequestMethod.POST)
	public @ResponseBody boolean updateMfgProductPage(HttpServletRequest req, HttpSession session, ModelMap map, @ModelAttribute ManufactureProductPojo manufactureProductPojo){
		
		boolean updateMfgProduct = manufactureService.updateManufactureProductById(manufactureProductPojo);
		return updateMfgProduct;		
	} 
	
	@RequestMapping(value="/delete-mfgproduct")
	public String deleteMfgProductPage(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			boolean deleteProduct = manufactureService.deleteManufactureProductById(id);
			map.put("action", "manufacture-products");
			map.put("manufacture", "#");
			return "redirect:/manufacture-products";
		}
		else {
			return "redirect:/";
		}

	}
	
	@RequestMapping(value="/add-sheet-mfg-details")
	public String addSheetManufactureDetails(HttpServletRequest req, HttpSession session, ModelMap map){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			List<Object[]> productData = manufactureService.getRawProductNames();
			map.addAttribute("productData", productData);
			map.put("action", "view-sheet-mfg");
			map.put("manufacture", "#");
			return VIEW+"/SheetManufacture";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/get-product-avlqty", method=RequestMethod.POST)
	public @ResponseBody Object[] getProductAvlqty(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam String productName){
		
		Object[] avlQty= manufactureService.getDispatchProductAvlqty(productName);
		return avlQty;		
	} 
	
	@RequestMapping(value="/get-product-name/{rawProductId}", method=RequestMethod.POST)
	public @ResponseBody String getProductName(HttpServletRequest req, HttpSession session, ModelMap map, @PathVariable Integer rawProductId){
		
		String productName = manufactureService.getRawProductName(rawProductId);
		return productName;		
	} 
	
	@RequestMapping(value="/submit-sheet-mfg-details", method=RequestMethod.POST)
	public @ResponseBody String sheetMfgDetails(HttpServletRequest req, HttpSession session, String productData, ModelMap map, String sheetMfgData){
		
		    SheetMfgDetailsPojo sheetMfgDetailsPojo  = new Gson().fromJson(sheetMfgData, SheetMfgDetailsPojo.class);
			SheetMfgsPojo sheetMfgsPojo  = new Gson().fromJson(sheetMfgData, SheetMfgsPojo.class);
			SheetMfgProductPojo []sheetMfgProductPojo = new Gson().fromJson(productData, SheetMfgProductPojo[].class);
			boolean addSheetMfg = manufactureService.addManufactureDetails(sheetMfgDetailsPojo,sheetMfgsPojo,sheetMfgProductPojo);
			
			if(addSheetMfg){
				return "success";
			}
			else {
				return "redirect:/";
			}
		
	}
	
	
	@RequestMapping(value="/view-sheet-mfg")
	public String viewSheetManufactureDetails(HttpServletRequest req, HttpSession session, ModelMap map){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			List<SheetMfgDetailsPojo> sheetMfgDetailsList = new ArrayList<SheetMfgDetailsPojo>();
			sheetMfgDetailsList = manufactureService.getMfgDetailList();
			//System.out.println(sheetMfgDetailsList.size());
			map.addAttribute("sheetMfgDetailsList", sheetMfgDetailsList);
			map.put("action", "view-sheet-mfg");
			map.put("manufacture", "#");
			return VIEW+"/ViewSheetManufacture";
		}
		else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/view-detail-sheetMfg")
	public String viewDetailSheetMfgPage(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			SheetMfgDetailsPojo sheetMfgData = manufactureService.getSheetManufactureById(id);
			List<SheetMfgProductPojo> sheetMfgProductList = manufactureService.getSheetMfgProducts(id);
			map.addAttribute("sheetMfgData", sheetMfgData);
			map.addAttribute("sheetMfgProductList", sheetMfgProductList);
			map.put("action", "view-sheet-mfg");
			map.put("manufacture", "#");
			return VIEW+"/ViewDetailSheetManufacture";
		}
		else {
			return "redirect:/";
		}	
	} 
	
	@RequestMapping(value="/edit-sheetMfg")
	public String editSheetMfgPage(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			List<Object[]> productData = manufactureService.getRawProductNames();
			map.addAttribute("productData", productData);
			SheetMfgDetailsPojo sheetMfgData = manufactureService.getSheetManufactureById(id);
			List<SheetMfgProductPojo> sheetMfgProductList = manufactureService.getSheetMfgProducts(id);
			map.addAttribute("sheetMfgData", sheetMfgData);
			map.addAttribute("sheetMfgProductList", sheetMfgProductList);
			map.put("action", "view-sheet-mfg");
			map.put("manufacture", "#");
			return VIEW+"/EditSheetManufacture";
		}
		else {
			return "redirect:/";
		}	
	} 
	
	@RequestMapping(value="/update-sheetMfg", method=RequestMethod.POST)
	public @ResponseBody boolean updateSheetMfg(HttpServletRequest req, HttpSession session, ModelMap map, @ModelAttribute ManufactureProductPojo manufactureProductPojo){
		
		boolean updateMfgProduct = manufactureService.updateManufactureProductById(manufactureProductPojo);
		return updateMfgProduct;		
	} 
	
	@RequestMapping(value="/delete-sheetMfg")
	public String deleteSheetMfg(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			boolean deleteSheetMfg = manufactureService.deleteSheetManufactureById(id);
			return "redirect:/view-sheet-mfg";
		}
		else {
			return "redirect:/";
		}
	}
	
	/*End Sheet Manufacture*/
	
	/*Start Product Manufacture*/
	
	@RequestMapping(value="/add-product-mfg")
	public String addProductManufacture(HttpServletRequest req, HttpSession session, ModelMap map){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			List<String> sheetMfgSheetName = new ArrayList<String>();
			sheetMfgSheetName = manufactureService.getSheetMfgSheetName();
			map.addAttribute("sheetMfgSheetName", sheetMfgSheetName);
			List<String> mfgProductName = manufactureService.getMfgProductName();
			map.addAttribute("mfgProductName", mfgProductName);
			map.put("action", "view-product-mfg");
			map.put("manufacture", "#");
			return VIEW+"/AddProductManufacture";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/get-sheetmfg-size")
	public @ResponseBody List<String> getSheetMfgSize(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam String sheetName){
		List<String> sheetMfgSize =  manufactureService.getSheetMfgSize(sheetName);
		return sheetMfgSize;
		
	} 
	
	@RequestMapping(value="/get-sheetmfg-gage")
	public @ResponseBody List<String> getSheetMfgGage(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam String sheetName,@RequestParam String sheetSize){
		List<String> sheetMfgGage =  manufactureService.getSheetMfgGage(sheetName,sheetSize);
		return sheetMfgGage;
		
	} 
	
	@RequestMapping(value="/get-sheetmfg-available-qty")
	public @ResponseBody Double getSheetMfgData(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam String sheetName, @RequestParam String sheetSize, @RequestParam String sheetGage){
		Double sheetAvlQty =  manufactureService.getSheetAvlQty(sheetName,sheetSize,sheetGage);
		return sheetAvlQty;
		
	} 
	
	@RequestMapping(value="/get-mfgproduct-size")
	public @ResponseBody List<String> getProductMfgSize(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam String productName){
		List<String> productMfgSize =  manufactureService.getProductMfgSize(productName);
		return productMfgSize;
		
	} 
	
	@RequestMapping(value="/get-mfgproduct-gage")
	public @ResponseBody List<String> getProductMfgGage(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam String productName,@RequestParam String productSize){
		List<String> productMfgGage =  manufactureService.getProductMfgGage(productName,productSize);
		return productMfgGage;
		
	}
	
	@RequestMapping(value="/get-mfgproduct-unitwt")
	public @ResponseBody Double getProductMfgunitWt(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam String productName,@RequestParam String productSize,@RequestParam String productGage){
		Double productMfgunitWt =  manufactureService.getProductMfgunitWt(productName,productSize,productGage);
		return productMfgunitWt;
		
	} 
	
	@RequestMapping(value="/submit-product-mfg-details", method=RequestMethod.POST)
	public @ResponseBody String productMfgDetails(HttpServletRequest req, HttpSession session, @ModelAttribute ProductMfgDetailsPojo productMfgDetailsPojo, @ModelAttribute ProductMfgPojo productMfgPojo){
		boolean addProductMfg = manufactureService.addProductMfgDetails(productMfgDetailsPojo,productMfgPojo);
		System.out.println(addProductMfg);
		if(addProductMfg){
			return "success";
		}
		else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/view-product-mfg")
	public String viewProductManufacture(HttpServletRequest req, HttpSession session, ModelMap map){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			List<ProductMfgDetailsPojo> productMfgList = new ArrayList<ProductMfgDetailsPojo>();
			productMfgList = manufactureService.getProductMfgList();
			map.addAttribute("productMfgList", productMfgList);
			map.put("action", "view-product-mfg");
			map.put("manufacture", "#");
			return VIEW+"/ViewProductManufacture";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/view-detail-productmfg")
	public String viewDetailProductMfgPage(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			ProductMfgDetailsPojo productMfgData = manufactureService.getProductMfgById(id);
			map.addAttribute("productMfgData", productMfgData);
			map.put("action", "view-product-mfg");
			map.put("manufacture", "#");
			return VIEW+"/ViewDetailProductMfg";
		}
		else {
			return "redirect:/";
		}	
	} 
	
	@RequestMapping(value="/edit-productmfg")
	public String editProductMfgPage(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			ProductMfgDetailsPojo productMfgData = manufactureService.getProductMfgById(id);
			map.addAttribute("productMfgData", productMfgData);
			List<String> sheetMfgSheetName = new ArrayList<String>();
			sheetMfgSheetName = manufactureService.getSheetMfgSheetName();
			map.addAttribute("sheetMfgSheetName", sheetMfgSheetName);
			List<String> mfgProductName = manufactureService.getMfgProductName();
			map.addAttribute("mfgProductName", mfgProductName);
			map.put("action", "view-product-mfg");
			map.put("manufacture", "#");
			return VIEW+"/EditProductMfg";
		}
		else {
			return "redirect:/";
		}	
	} 
	
	@RequestMapping(value="/update-product-mfg-details", method=RequestMethod.POST)
	public @ResponseBody String updateProductMfg(HttpServletRequest req, HttpSession session, ModelMap map, @ModelAttribute ProductMfgDetailsPojo productMfgPojo){
		
		boolean updateProductMfg = manufactureService.updateProductMfg(productMfgPojo);
		if(updateProductMfg){
			return "success";	
		}
		else {
			return "failed";
		}
	} 
	
	@RequestMapping(value="/delete-productmfg")
	public String deleteProductMfg(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			boolean deleteProductMfg = manufactureService.deleteProductMfgById(id);

			return "redirect:/view-product-mfg";
		}
		else {
			return "redirect:/";
		}

	}
	
	@RequestMapping(value="/add-electric-uses")
	public String addElectricUsesPage(HttpServletRequest req, HttpSession session, ModelMap map){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			map.put("action", "view-electric-uses");
			map.put("manufacture", "#");
			return VIEW+"/AddElectricUses";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/view-electric-uses")
	public String viewElectricUsesPage(HttpServletRequest req, HttpSession session, ModelMap map){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			map.put("action", "view-electric-uses");
			map.put("manufacture", "#");
			return VIEW+"/ViewElectricUses";
		}
		else {
			return "redirect:/";
		}
	} 
	
	
}
