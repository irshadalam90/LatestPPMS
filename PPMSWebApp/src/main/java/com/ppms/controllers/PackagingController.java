package com.ppms.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.ppms.pojo.BoxingDetailsPojo;
import com.ppms.pojo.BoxingProductPojo;
import com.ppms.pojo.BoxingsPojo;
import com.ppms.pojo.ProductMfgDetailsPojo;
import com.ppms.pojo.ProductPackagingDetailsPojo;
import com.ppms.pojo.ProductPackagingPojo;
import com.ppms.pojo.RawProductPojo;
import com.ppms.pojo.SheetMfgDetailsPojo;
import com.ppms.pojo.SheetMfgProductPojo;
import com.ppms.pojo.SheetMfgsPojo;
import com.ppms.pojo.UserPojo;
import com.ppms.service.PackagingService;

@Controller
public class PackagingController {

	@Autowired
	PackagingService packagingService; 
	
	public static final String VIEW = "packaging";
	
	@RequestMapping(value="/add-packging-details")
	public String addPackagingPage(HttpServletRequest req, HttpSession session, ModelMap map){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			List<String> productNames = packagingService.getProductMfgName();
			map.addAttribute("productNames", productNames);
			List<String> dispatchedprodNames = packagingService.getDispatchedprodNames();
			map.addAttribute("dispatchedprodNames", dispatchedprodNames);
			map.put("action", "view-packaging-details");
			map.put("packaging", "#");
			return VIEW+"/AddProductPackaging";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/get-productmfg-size")
	public @ResponseBody List<String> getProductpkgSize(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam String productmfgName){
		List<String> productmfgSize =  packagingService.getProductpkgSize(productmfgName);
		return productmfgSize;
		
	} 
	
	@RequestMapping(value="/get-productmfg-gage")
	public @ResponseBody List<String> getProductpkgGage(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam String productmfgName,@RequestParam String productmfgSize){
		List<String> productmfgGage =  packagingService.getProductpkgGage(productmfgName,productmfgSize);
		return productmfgGage;
		
	} 
	
	@RequestMapping(value="/get-productmfg-qty")
	public @ResponseBody Object[] getProductmfgQty(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam String productmfgName,@RequestParam String productmfgSize,@RequestParam String productmfgGage){
		Object[] productMfgQty =  packagingService.getProductmfgQty(productmfgName,productmfgSize,productmfgGage);
		return productMfgQty;
		
	} 
	
	@RequestMapping(value="/get-productmfg-pktwt")
	public @ResponseBody Double getProductmfgPktwt(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam String productmfgName,@RequestParam String productmfgSize,@RequestParam String productmfgGage){
		Double productMfgPktwt =  packagingService.getProductmfgPktwt(productmfgName,productmfgSize,productmfgGage);
		return productMfgPktwt;
		
	} 
	
	@RequestMapping(value="/get-plasticbag-prod-size")
	public @ResponseBody List<String> plasticbagProductSize(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam String plasticBagProdName){
		List<String> pbProductSize =  packagingService.getPlasticbagProductSize(plasticBagProdName);
		return pbProductSize;
		
	} 
	
	@RequestMapping(value="/get-plasticbag-prod-avlqty")
	public @ResponseBody Object[] plasticbagProductAvlQty(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam String plasticBagProdName, @RequestParam String plasticBagProdSize){
		Object[] pbAvlQtye =  packagingService.getPlasticbagProductAvlQty(plasticBagProdName,plasticBagProdSize);
		return pbAvlQtye;
		
	} 
	
	@RequestMapping(value="/submit-packaging-details", method=RequestMethod.POST)
	public @ResponseBody String submitPackagingDetails(HttpServletRequest req, HttpSession session, ModelMap map, @ModelAttribute ProductPackagingDetailsPojo productPackaginDetailsgPojo, ProductPackagingPojo productPackagingPojo){
		boolean addPackagingDetails = packagingService.addPackagingDetails(productPackaginDetailsgPojo,productPackagingPojo);
		if(addPackagingDetails){
			return "success";
		}
		else{
			return "failed";
		}
	} 
	
	@RequestMapping(value="/view-packaging-details")
	public String viewPackagingPage(HttpServletRequest req, HttpSession session, ModelMap map){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			List<Object[]> packagingList = packagingService.getPackagingList();
			map.addAttribute("packagingList", packagingList);
			map.put("action", "view-packaging-details");
			map.put("packaging", "#");
			return VIEW+"/ViewProductPackaging";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/view-detail-packaging")
	public String viewDetailPackagingPage(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			ProductPackagingDetailsPojo packaging = packagingService.getPackaging(id);
			map.addAttribute("packaging", packaging);
			map.put("action", "view-packaging-details");
			map.put("packaging", "#");
			return VIEW+"/ViewDetailProductPackaging";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/edit-packaging")
	public String editPackagingPage(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			ProductPackagingDetailsPojo packaging = packagingService.getPackaging(id);
			map.addAttribute("packaging", packaging);
			List<String> dispatchedprodNames = packagingService.getDispatchedprodNames();
			map.addAttribute("dispatchedprodNames", dispatchedprodNames);
			map.put("action", "view-packaging-details");
			map.put("packaging", "#");
			return VIEW+"/EditProductPackaging";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/update-packaging-details", method=RequestMethod.POST)
	public @ResponseBody String plasticbagProductSize(HttpServletRequest req, HttpSession session, ModelMap map, @ModelAttribute ProductPackagingDetailsPojo productPackaginDetailsgPojo, ProductPackagingPojo productPackagingPojo){
		boolean updatePackagingDetails = packagingService.updatePackagingDetails(productPackaginDetailsgPojo,productPackagingPojo);
		if(updatePackagingDetails){
			return "success";
		}
		else{
			return "failed";
		}
	} 
	
	@RequestMapping(value="/delete-packaging")
	public String deletePackaging(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			
		    packagingService.deletePackagingData(id);
			
			return "redirect:/view-packaging-details";
		}
		else {
			return "redirect:/";
		}
	} 
	
	/*End Packaging Details*/

	
	/*Start Boxing Details*/
	
	@RequestMapping(value="/add-boxing-details")
	public String addBoxingPage(HttpServletRequest req, HttpSession session, ModelMap map){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			List<String> plasticBagList = packagingService.getPlasticBags();
			map.addAttribute("plasticBagList", plasticBagList);
			List<String> boxList = packagingService.getBoxes();
			System.out.println(boxList.size());
			map.addAttribute("boxList", boxList);
			map.put("action", "view-boxing-details");
			map.put("packaging", "#");
			return VIEW+"/AddProductBoxing";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/get-plasticbag-size")
	public @ResponseBody List<String> plasticbagSize(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam String plasticBagName){
		List<String> pbProductSize =  packagingService.getPlasticbagSize(plasticBagName);
		return pbProductSize;
	} 
	
	@RequestMapping(value="/get-plasticbag-id")
	public @ResponseBody Integer getPlasticBagId(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam String plasticBagName,@RequestParam String plasticBagSize){
		Integer plasticBagId =  packagingService.getPlasticBagId(plasticBagName,plasticBagSize);
		return plasticBagId;
		
	} 
	
	@RequestMapping(value="/get-productmfgpkg-name")
	public @ResponseBody List<String> getProductmfgpkgName(HttpServletRequest req, HttpSession session, ModelMap map, /*@RequestParam Integer plasticBagId*/ @RequestParam String plasticBagName, @RequestParam String plasticBagSize){
		List<String> productmfgpkgName =  packagingService.getMfgpkgProductName(plasticBagName, plasticBagSize);
		return productmfgpkgName;
		
	} 
	
	/*@RequestMapping(value="/get-productmfgpkg-name")
	public @ResponseBody List<String> getProductmfgpkgName(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam String plasticBagName, String plasticBagSize){
		List<String> productmfgpkgName =  packagingService.getProductmfgpkgName(plasticBagName,plasticBagSize);
		return productmfgpkgName;
		
	} */
	
	@RequestMapping(value="/get-productmfgpkg-size")
	public @ResponseBody List<String> getProductmfgpkgSize(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam String productmfgName, @RequestParam String plasticBagName, @RequestParam String plasticBagSize){
		List<String> productmfgpkgSize =  packagingService.getProductmfgpkgSize(productmfgName, plasticBagName, plasticBagSize);
		return productmfgpkgSize;
	} 
	
	@RequestMapping(value="/get-productmfgpkg-gage")
	public @ResponseBody List<String> getProductmfgpkgGage(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam String productmfgName,@RequestParam String productmfgSize, @RequestParam String plasticBagName, @RequestParam String plasticBagSize){
		List<String> productmfgpkgGage =  packagingService.getProductmfgpkgGage(productmfgName,productmfgSize,plasticBagName, plasticBagSize);
		return productmfgpkgGage;	
	} 
	
	@RequestMapping(value="/get-productpkg-qty")
	public @ResponseBody Object[] getProductmfgpkgQty(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam String productmfgName,@RequestParam String productmfgSize, @RequestParam String productmfgGage, @RequestParam String plasticBagName, @RequestParam String plasticBagSize){
		Object[] productmfgpkgQty =  packagingService.getProductmfgpkgQty(productmfgName,productmfgSize,productmfgGage,plasticBagName,plasticBagSize);
		
		return productmfgpkgQty;	
	}
	
	@RequestMapping(value="/get-box-size")
	public @ResponseBody List<String> boxSize(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam String boxName){
		List<String> boxSize =  packagingService.boxSizes(boxName);
		return boxSize;
	} 
	
	@RequestMapping(value="/get-box-avlqty")
	public @ResponseBody Object[] boxAvlQty(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam String boxName, @RequestParam String boxSize){
		Object[] boxAvlqty =  packagingService.boxAvlQty(boxName,boxSize);
		return boxAvlqty;
	} 
	
	@RequestMapping(value="/submit-bxing-details", method=RequestMethod.POST)
	public @ResponseBody String boxingDetails(HttpServletRequest req, HttpSession session, @ModelAttribute BoxingDetailsPojo boxingDetailsPojo, @ModelAttribute BoxingsPojo boxingsPojo /*String productData, ModelMap map, String boxingData*/){
		
		//BoxingDetailsPojo boxingDetailsPojo  = new Gson().fromJson(boxingData, BoxingDetailsPojo.class);
		//BoxingProductPojo []boxingProductPojo = new Gson().fromJson(productData, BoxingProductPojo[].class);
		//boolean addBoxing = packagingService.addBoxingDetails(boxingDetailsPojo,boxingProductPojo);
		boolean addBoxing = packagingService.addBoxings(boxingDetailsPojo,boxingsPojo);
		if(addBoxing){
			return "success";
		}
		else {
			return "failed";
		}
		
	}
	
	@RequestMapping(value="/view-boxing-details")
	public String viewBoxingPage(HttpServletRequest req, HttpSession session, ModelMap map){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			List<Object[]> boxingDataList = packagingService.getBoxingDataList();
			map.addAttribute("boxingDataList", boxingDataList);
			map.put("action", "view-boxing-details");
			map.put("packaging", "#");
			return VIEW+"/ViewProductBoxing";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/view-detail-boxing")
	public String viewDtailBoxingPage(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			BoxingDetailsPojo boxingData = packagingService.getBoxingData(id);
			List<BoxingProductPojo> boxingProducts = packagingService.getBoxingProducts(id);
			map.addAttribute("boxingData", boxingData);
			map.addAttribute("boxingProducts", boxingProducts);
			map.put("action", "view-boxing-details");
			map.put("packaging", "#");
			return VIEW+"/ViewDetailProductBoxing";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/edit-boxing")
	public String editBoxingPage(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			BoxingDetailsPojo boxingData = packagingService.getBoxingData(id);
			List<BoxingProductPojo> boxingProducts = packagingService.getBoxingProducts(id);
			map.addAttribute("boxingData", boxingData);
			map.addAttribute("boxingProducts", boxingProducts);
			map.put("action", "view-boxing-details");
			map.put("packaging", "#");
			return VIEW+"/EditProductBoxing";
		}
		else {
			return "redirect:/";
		}
	} 
	
	/*End Boxing Details*/
}
