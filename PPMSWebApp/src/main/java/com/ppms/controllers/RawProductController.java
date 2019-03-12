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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.RequestScope;

import com.google.gson.Gson;
import com.ppms.beans.GstReceivedBean;
import com.ppms.beans.RawReceivedBean;
import com.ppms.beans.RawReceivedProductBean;
import com.ppms.pojo.DispatchRawProductPojo;
import com.ppms.pojo.DispatchesRawProductPojo;
import com.ppms.pojo.GstReceivedPojo;
import com.ppms.pojo.GstReceivedProductPojo;
import com.ppms.pojo.PaymentsPojo;
import com.ppms.pojo.RawProductPojo;
import com.ppms.pojo.RawReceivedPojo;
import com.ppms.pojo.RawReceivedProductPojo;
import com.ppms.pojo.RawSupplierPojo;
import com.ppms.pojo.SupplierGroupPojo;
import com.ppms.pojo.UserPojo;
import com.ppms.service.BankAccountService;
import com.ppms.service.RawProductService;

@Controller
public class RawProductController {
	
	@Autowired
	RawProductService rawProductService;
	public static final String VIEW = "rawproduct";
	
	@Autowired
	BankAccountService bankAccountService;
	
	/*Start Raw product*/
	
	@RequestMapping(value="/raw-product")
	public String rawProductPage(HttpServletRequest req, HttpSession session, ModelMap map){
		
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			List<RawProductPojo> rawProductList = new ArrayList<RawProductPojo>();
			rawProductList = rawProductService.getRawProductList();
			map.addAttribute("rawProductList", rawProductList);
			map.put("raw", "#");
			map.put("action", "raw-product");
			return VIEW+"/ProductList";	
		}
		else {
			return "redirect:/";
		}
	}
		
	@RequestMapping(value="/add-raw-product")
	public String addProductPage(HttpServletRequest req, HttpSession session, ModelMap map){
		
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			map.put("raw", "#");
			map.put("action", "raw-product");
			return VIEW+"/Product";	
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/submit-raw-product", method=RequestMethod.POST)
	public String submitRawProduct(HttpServletRequest req, HttpSession session, ModelMap map,@ModelAttribute("rawProductPojo") RawProductPojo rawProductPojo){
		
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			rawProductService.addRawProduct(rawProductPojo);
			List<RawProductPojo> rawProductList = new ArrayList<RawProductPojo>();
			rawProductList = rawProductService.getRawProductList();
			map.addAttribute("rawProductList", rawProductList);
			return "redirect:/raw-product";	
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/view-detail-rawproduct")
	public String viewDetailProduct(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			RawProductPojo rawProduct = rawProductService.getRawProductById(id);
			map.addAttribute("rawProduct", rawProduct);
			return VIEW+"/ViewDetailRawProduct";	
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/edit-rawproduct")
	public String editProduct(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			RawProductPojo rawProduct = rawProductService.getRawProductById(id);
			map.addAttribute("rawProduct", rawProduct);
			map.put("raw", "#");
			map.put("action", "raw-product");
			return VIEW+"/EditRawProduct";	
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/update-raw-product", method=RequestMethod.POST)
	public String updateRawProduct(HttpServletRequest req, HttpSession session, ModelMap map,@ModelAttribute("rawProductPojo") RawProductPojo rawProductPojo){
		
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			boolean updateRawProdct = rawProductService.updateRawProduct(rawProductPojo);
			return "redirect:/raw-product";	
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/delete-rawproduct")
	public String deleteProduct(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			rawProductService.deleteRawProductById(id);
			return "redirect:/raw-product";	
		}
		else {
			return "redirect:/";
		}
	} 
	
	/*End Raw Product*/
	
	/*Start Raw Supplier*/
	
	@RequestMapping(value="/raw-supplier")
	public String viewSupplierPage(HttpServletRequest req, HttpSession session, ModelMap map){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			List<RawSupplierPojo> rawSupplierList = new ArrayList<RawSupplierPojo>();
			rawSupplierList = rawProductService.getSupplierList();
			map.addAttribute("rawSupplierList", rawSupplierList);
			map.put("action", "raw-supplier");
			map.put("raw", "#");
			map.put("supplier", "#");
			return VIEW+"/ViewSupplier";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/add-supplier")
	public String addSupplierPage(HttpServletRequest req, HttpSession session, ModelMap map){
		
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			List<String> salesPersons = rawProductService.getSalesPersons();
			map.addAttribute("salesPersons", salesPersons);
			List<String> customerGroup = rawProductService.getCustomerGroup();
			map.addAttribute("customerGroup", customerGroup);
			map.put("raw", "#");
			map.put("supplier", "#");
			return VIEW+"/Supplier";
		}
		else {
				return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/add-raw-supplier", method=RequestMethod.POST)
	public @ResponseBody String addRawSupplier(HttpServletRequest req, HttpSession session, ModelMap map,@ModelAttribute("rawSupplierPojo") RawSupplierPojo rawSupplierPojo){
		
			boolean addRawSupplier = rawProductService.addNewRawSupplier(rawSupplierPojo);
			if(addRawSupplier){
				return "success";
			}
			else{
				return "failed";
			}
		
	} 
	
	@RequestMapping(value="/view-raw-supplier")
	public String viewDetailSupplier(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			RawSupplierPojo rawSupplier = rawProductService.getRawSupplierById(id);
			map.addAttribute("rawSupplier", rawSupplier);
			map.put("raw", "#");
			map.put("supplier", "#");
			return VIEW+"/ViewDetailRawSupplier";	
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/edit-raw-supplier")
	public String editRawSupplier(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			RawSupplierPojo rawSupplier = rawProductService.getRawSupplierById(id);
			map.addAttribute("rawSupplier", rawSupplier);
			map.put("raw", "#");
			map.put("supplier", "#");
			return VIEW+"/EditRawSupplier";	
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/update-raw-supplier", method=RequestMethod.POST)
	public @ResponseBody String updateRawSupplier(HttpServletRequest req, HttpSession session, ModelMap map,@ModelAttribute("rawSupplierPojo") RawSupplierPojo rawSupplierPojo){
		
		boolean updRawSupplier = rawProductService.updateRawSupplier(rawSupplierPojo);
		if(updRawSupplier){
			return "success";	
		}
		else{
			return "failed";
		}
		
	}
	
	@RequestMapping(value="/delete-raw-supplier")
	public String deleteRawSupplier(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			boolean deleterawSupplier = rawProductService.deleteRawSupplierById(id);
		
			return "redirect:/raw-supplier";	
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/add-supplier-group")
	public String addSupplierGroup(HttpServletRequest req, HttpSession session, ModelMap map){
		
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			map.put("raw", "#");
			map.put("supplier", "#");
			return VIEW+"/SupplierGroup";
			
		}
		else {
				return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/submit-supplier-group", method=RequestMethod.POST)
	public @ResponseBody String submitSupplierGroup(HttpServletRequest req, HttpSession session, ModelMap map,@ModelAttribute("supplierGroupPojo") SupplierGroupPojo supplierGroupPojo){
		
		boolean addsupplierGroup = rawProductService.addNewSupplierGroup(supplierGroupPojo);
		if(addsupplierGroup){
			return "success";
		}
		else{
			return "failed";
		}
	} 
	
	@RequestMapping(value="/supplier-group-list")
	public String supplierGroupList(HttpServletRequest req, HttpSession session, ModelMap map){
		
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			List<SupplierGroupPojo> supplierGroupList = rawProductService.getSupplierGroupList();
			map.addAttribute("supplierGroupList", supplierGroupList);
			map.put("action", "supplier-group-list");
			map.put("raw", "#");
			map.put("supplier", "#");
			return VIEW+"/SupplierGroupList";
		}
		else {
				return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/edit-supplier-group")
	public String editSupplierGroup(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			SupplierGroupPojo supplierGroup = rawProductService.getSupplierGroup(id);
			map.addAttribute("supplierGroup", supplierGroup);
			map.put("raw", "#");
			map.put("supplier", "#");
			return VIEW+"/EditSupplierGroup";
		}
		else {
				return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/view-supplier-group")
	public String viewSupplierGroup(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			SupplierGroupPojo supplierGroup = rawProductService.getSupplierGroup(id);
			map.addAttribute("supplierGroup", supplierGroup);
			map.put("raw", "#");
			map.put("supplier", "#");
			return VIEW+"/ViewSupplierGroup";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/update-supplier-group", method=RequestMethod.POST)
	public @ResponseBody String updateSupplierGroup(HttpServletRequest req, HttpSession session, ModelMap map,@ModelAttribute("supplierGroupPojo") SupplierGroupPojo supplierGroupPojo){
		
		boolean updsupplierGroup = rawProductService.updateSupplierGroupData(supplierGroupPojo);
		if(updsupplierGroup){
			return "success";
		}
		else{
			return "failed";
		}
	} 
	
	@RequestMapping(value="/delete-supplier-group")
	public String deleteSupplierGroup(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			boolean deleteSupplierGroup = rawProductService.deleteSupplierGroup(id);
			return "redirect:/supplier-group-list";
		}
		else {
				return "redirect:/";
		}
	} 
	
	/*End Raw Supplier*/
	
	@RequestMapping(value="/view-stock")
	public String viewStockPage(HttpServletRequest req, HttpSession session, ModelMap map){
		
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			List<RawProductPojo> rawProductList = new ArrayList<RawProductPojo>();
			rawProductList = rawProductService.getRawProductList();
			
			/*List<RawProductPojo> rawProductListInStock = new ArrayList<RawProductPojo>();
			for(RawProductPojo inStock : rawProductList){
				RawProductPojo rawInstock = new RawProductPojo();
				if(inStock.getInventoryQty()>0){
					
				}
			}*/
			map.addAttribute("rawProductList", rawProductList);
			map.put("action", "view-stock");
			map.put("raw", "#");
			map.put("received", "#");
			return VIEW+"/StockAndView";
		}
		else {
			return "redirect:/";
		}
	} 
	
	/*Start Raw Received*/
	
	@RequestMapping(value="/add-raw-received")
	public String addRawReceivedPage(HttpServletRequest req, HttpSession session, ModelMap map){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			List<String> rawSuppliers = new ArrayList<String>();
			rawSuppliers = rawProductService.getSuppliersName();
			map.addAttribute("rawSuppliers", rawSuppliers);
			List<String> salesPersons = rawProductService.getSalesPersons();
			map.addAttribute("salesPersons", salesPersons);
			List<String> rawProductName = new ArrayList<String>();
			rawProductName = rawProductService.getRawProductName();
			map.addAttribute("rawProductName", rawProductName);
			map.put("raw", "#");
			map.put("received", "#");
			return VIEW+"/AddRawReceived";
		}
		else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/submit-raw-received", method=RequestMethod.POST)
	public @ResponseBody String addRawReceived(HttpServletRequest req, HttpSession session, String dataString, ModelMap map, String rawReceivedForm/*, @ModelAttribute("rawReceivedForm") RawReceivedPojo rawReceivedForm*/){
		RawReceivedPojo rawReceivedPojo = new Gson().fromJson(rawReceivedForm, RawReceivedPojo.class);
		RawReceivedProductPojo []rawReceivedProductPojo = new Gson().fromJson(dataString, RawReceivedProductPojo[].class);
		boolean addRawReceived = rawProductService.addRawReceivedProduct(rawReceivedPojo,rawReceivedProductPojo);
		if(addRawReceived){
			return "success";
		}
		else{
			return "failed";
		} 	
	}
	
	@RequestMapping(value="/view-raw-received")
	public String rawReceivedPage(HttpServletRequest req, HttpSession session, ModelMap map){
		
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			
			List<RawReceivedPojo> rawReceivedList = new ArrayList<RawReceivedPojo>();
			rawReceivedList = rawProductService.getRawReceived();
			map.addAttribute("rawReceivedList", rawReceivedList);
			map.put("action", "view-raw-received");
			map.put("raw", "#");
			map.put("received", "#");
			return VIEW+"/RawReceived";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/viewdetail-raw-received")
	public String viewDetailRawReceivedPage(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id ){
		
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			
			RawReceivedBean rawReceivedObj = new RawReceivedBean();
			rawReceivedObj = rawProductService.getRawReceivedDetail(id);
			List<RawReceivedProductPojo> rawReceivedProductList = rawReceivedObj.getRawReceivedProduct();
			map.addAttribute("rawReceivedProductList", rawReceivedProductList);
			map.addAttribute("rawReceivedObj", rawReceivedObj);
			List<String> rawSuppliers = new ArrayList<String>();
			rawSuppliers = rawProductService.getSuppliersName();
			map.addAttribute("rawSuppliers", rawSuppliers);
			List<String> rawProductName = new ArrayList<String>();
			rawProductName = rawProductService.getRawProductName();
			map.addAttribute("rawProductName", rawProductName);
			map.put("raw", "#");
			map.put("received", "#");
			return VIEW+"/ViewDetailRawReceived";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/get-raw-received-products")
	public @ResponseBody List<RawReceivedProductPojo> getRawReceivedProducts(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id ){
		
			RawReceivedBean rawReceivedObj = new RawReceivedBean();
			rawReceivedObj = rawProductService.getRawReceivedDetail(id);
			List<RawReceivedProductPojo> rawReceivedProductList = rawReceivedObj.getRawReceivedProduct();
			map.addAttribute("rawReceivedProductList", rawReceivedProductList);
			return rawReceivedProductList;
		
	} 
	
	
	@RequestMapping(value="/edit-raw-received")
	public String editRawReceivedPage(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id ){
		
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			
			RawReceivedBean rawReceivedObj = new RawReceivedBean();
			rawReceivedObj = rawProductService.getRawReceivedDetail(id);
			List<RawReceivedProductPojo> rawReceivedProductList = rawReceivedObj.getRawReceivedProduct();
			map.addAttribute("rawReceivedProductList", rawReceivedProductList);
			map.addAttribute("rawReceivedObj", rawReceivedObj);
			List<String> rawSuppliers = new ArrayList<String>();
			rawSuppliers = rawProductService.getSuppliersName();
			map.addAttribute("rawSuppliers", rawSuppliers);
			List<String> rawProductName = new ArrayList<String>();
			rawProductName = rawProductService.getRawProductName();
			map.addAttribute("rawProductName", rawProductName);
			List<String> salesPersons = rawProductService.getSalesPersons();
			map.addAttribute("salesPersons", salesPersons);
			return VIEW+"/EditRawReceived";
		}
		else {
			return "redirect:/";
		}
	} 
	
	/*@RequestMapping(value="/edit-raw-received-product/{id}")
	public @ResponseBody RawReceivedProductPojo editRawReceivedProduct(HttpServletRequest req, HttpSession session, ModelMap map, @PathVariable Integer id){
		
		RawReceivedProductPojo rawReceivedProductData = rawProductService.getRawReceivedProduct(id);
		
		return rawReceivedProductData;
	}*/
	
	@RequestMapping(value="/update-raw-received", method=RequestMethod.POST)
	public @ResponseBody String updateRawReceivedProduct(HttpServletRequest req, HttpSession session, ModelMap map, String rawReceivedForm, String dataString){
		
		RawReceivedPojo rawReceivedPojo = new Gson().fromJson(rawReceivedForm, RawReceivedPojo.class);
		RawReceivedProductPojo []rawReceivedProductPojo = new Gson().fromJson(dataString, RawReceivedProductPojo[].class);
		boolean updateRawReceived = rawProductService.updateRawReceivedProduct(rawReceivedPojo,rawReceivedProductPojo);
		if(updateRawReceived){
			return "success";
		}
		else{
			return "failed";
		}
	}
	
	@RequestMapping(value="/add-gst-received")
	public String addGstReceivedPage(HttpServletRequest req, HttpSession session, ModelMap map){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			List<String> rawSuppliers = new ArrayList<String>();
			rawSuppliers = rawProductService.getSuppliersName();
			map.addAttribute("rawSuppliers", rawSuppliers);
			List<String> rawProductName = new ArrayList<String>();
			rawProductName = rawProductService.getRawProductName();
			map.addAttribute("rawProductName", rawProductName);
			List<String> salesPersons = rawProductService.getSalesPersons();
			map.addAttribute("salesPersons", salesPersons);
			map.put("raw", "#");
			map.put("received", "#");
			return VIEW+"/AddGstReceived";
		}
		else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/submit-gst-received", method=RequestMethod.POST)
	public String addGstReceived(HttpServletRequest req, HttpSession session, String dataString, ModelMap map, String gstReceivedForm){
		UserPojo user = (UserPojo)session.getAttribute("user");
		
		if(user != null){
			GstReceivedPojo gstReceivedPojo = new Gson().fromJson(gstReceivedForm, GstReceivedPojo.class);
			GstReceivedProductPojo []gstReceivedProductPojo = new Gson().fromJson(dataString, GstReceivedProductPojo[].class);
			boolean addGstReceived = rawProductService.addGstReceivedProduct(gstReceivedPojo,gstReceivedProductPojo);
			map.put("raw", "#");
			map.put("received", "#");
			return VIEW+"/AddGstReceived";
		}
		else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/view-gst-received")
	public String gstReceivedPage(HttpServletRequest req, HttpSession session, ModelMap map){
		
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			List<GstReceivedPojo> gstReceivedList = new ArrayList<GstReceivedPojo>();
			gstReceivedList = rawProductService.getGstReceived();
			System.out.println(gstReceivedList.size());
			map.addAttribute("gstReceivedList", gstReceivedList);
			map.put("action", "view-gst-received");
			map.put("raw", "#");
			map.put("received", "#");
			return VIEW+"/GstRecieved";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/viewdetail-gst-received")
	public String viewDetailGstReceivedPage(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id ){
		
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			
			GstReceivedBean gstReceivedObj = new GstReceivedBean();
			gstReceivedObj = rawProductService.getGstReceivedDetail(id);
			List<GstReceivedProductPojo> gstReceivedProductList = gstReceivedObj.getGstReceivedProduct();
			map.addAttribute("rawReceivedProductList", gstReceivedProductList);
			map.addAttribute("rawReceivedObj", gstReceivedObj);
			List<String> rawSuppliers = new ArrayList<String>();
			rawSuppliers = rawProductService.getSuppliersName();
			map.addAttribute("rawSuppliers", rawSuppliers);
			List<String> rawProductName = new ArrayList<String>();
			rawProductName = rawProductService.getRawProductName();
			map.addAttribute("rawProductName", rawProductName);
			List<String> salesPersons = rawProductService.getSalesPersons();
			map.addAttribute("salesPersons", salesPersons);
			map.put("action", "view-gst-received");
			map.put("raw", "#");
			map.put("received", "#");
			return VIEW+"/ViewDetailGstReceived";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/get-gst-received-products")
	public @ResponseBody List<GstReceivedProductPojo> getGstReceivedProducts(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id ){
		
			GstReceivedBean gstReceivedObj = new GstReceivedBean();
			gstReceivedObj = rawProductService.getGstReceivedDetail(id);
			List<GstReceivedProductPojo> gstReceivedProductList = gstReceivedObj.getGstReceivedProduct();
			map.addAttribute("rawReceivedProductList", gstReceivedProductList);
			return gstReceivedProductList;
		
	} 
	
	@RequestMapping(value="/edit-gst-received")
	public String editGstReceivedPage(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id ){
		
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			
			GstReceivedBean gstReceivedObj = new GstReceivedBean();
			gstReceivedObj = rawProductService.getGstReceivedDetail(id);
			List<GstReceivedProductPojo> gstReceivedProductList = gstReceivedObj.getGstReceivedProduct();
			map.addAttribute("rawReceivedProductList", gstReceivedProductList);
			map.addAttribute("rawReceivedObj", gstReceivedObj);
			List<String> rawSuppliers = new ArrayList<String>();
			rawSuppliers = rawProductService.getSuppliersName();
			map.addAttribute("rawSuppliers", rawSuppliers);
			List<String> rawProductName = new ArrayList<String>();
			rawProductName = rawProductService.getRawProductName();
			map.addAttribute("rawProductName", rawProductName);
			List<String> salesPersons = rawProductService.getSalesPersons();
			map.addAttribute("salesPersons", salesPersons);
			map.put("raw", "#");
			map.put("received", "#");
			return VIEW+"/EditGstReceived";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/update-gst-received", method=RequestMethod.POST)
	public @ResponseBody String updateGstReceivedProduct(HttpServletRequest req, HttpSession session, ModelMap map, String gstReceivedForm, String dataString){
		
		GstReceivedPojo gstReceivedPojo = new Gson().fromJson(gstReceivedForm, GstReceivedPojo.class);
		GstReceivedProductPojo []gstReceivedProductPojo = new Gson().fromJson(dataString, GstReceivedProductPojo[].class);
		boolean updateGstReceived = rawProductService.updateGstReceivedProduct(gstReceivedPojo,gstReceivedProductPojo);
		if(updateGstReceived){
			return "success";
		}
		else{
			return "failed";
		}
	} 
	@RequestMapping(value="/get-supplier-address/{supplierName}", method=RequestMethod.GET)
	public @ResponseBody Object[] getSupplierAddress(HttpServletRequest req, HttpSession session, ModelMap map, @PathVariable("supplierName") String supplierName){
		
		Object[] supplierAddress = rawProductService.getSupplAddress(supplierName);
		//System.out.println(supplierAddress.getShipAddress());
		return supplierAddress;
	}
	
	@RequestMapping(value="/get-product-fields/{productName}", method=RequestMethod.GET)
	public @ResponseBody List<RawProductPojo> getProductFields(HttpServletRequest req, HttpSession session, ModelMap map, @PathVariable("productName") String productName){
		
		List<RawProductPojo> productFields = new ArrayList<RawProductPojo>();
		productFields = rawProductService.getProductFields(productName);
		return productFields;
	}
	
	@RequestMapping(value="/get-sales-person", method=RequestMethod.GET)
	public @ResponseBody List<String> getPaymentTerms(HttpServletRequest req, HttpSession session, ModelMap map){
		
		List<String> salesPersons = rawProductService.getSalesPersons();
		return salesPersons;
	}
	
	/*End Raw Received*/
	
	/*Begin Dispatch Raw Product*/
	
	@RequestMapping(value="/create-dispatch-product")
	public String dispatchProductPage(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			RawProductPojo rawProduct = rawProductService.getRawProductById(id);
			map.addAttribute("rawProduct", rawProduct);
			map.put("action", "dispatch-product");
			map.put("raw", "#");
			map.put("dispatch", "#");
			return VIEW+"/DispatchRawProduct";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/dispatch-product")
	public String dispatchProduct(HttpServletRequest req, HttpSession session, ModelMap map){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			List<RawProductPojo> rawProductList = new ArrayList<RawProductPojo>();
			rawProductList = rawProductService.getRawProductList();
			map.addAttribute("rawProductList", rawProductList);
			map.put("action", "dispatch-product");
			map.put("raw", "#");
			map.put("dispatch", "#");
			return VIEW+"/ViewDispatchProduct";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/dispatch-raw-product", method=RequestMethod.POST)
	public @ResponseBody String dispatchRawProduct(HttpServletRequest req, HttpSession session, ModelMap map, @ModelAttribute("dispatchRawProductPojo") DispatchRawProductPojo dispatchRawProductPojo, @ModelAttribute("dispatchesRawProductPojo") DispatchesRawProductPojo dispatchesRawProductPojo){
		
		boolean dispatchRawProduct = rawProductService.dispatchProduct(dispatchRawProductPojo,dispatchesRawProductPojo);
		if(dispatchRawProduct){
			return "success";
		}
		else{
			return "failed";
		}
		
	}
	
	@RequestMapping(value="/view-dispatch-product")
	public String viewDispatchProduct(HttpServletRequest req, HttpSession session, ModelMap map){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			List<DispatchRawProductPojo> dispatchRawProductList = new ArrayList<DispatchRawProductPojo>();
			dispatchRawProductList = rawProductService.getdispatchRawProductList();
			map.addAttribute("dispatchRawProductList", dispatchRawProductList);
			map.put("action", "view-dispatch-product");
			map.put("raw", "#");
			map.put("dispatch", "#");
			return VIEW+"/ViewDispatchProduct2";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/view-dispatched-product")
	public String viewdDispatchProductPage(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			DispatchRawProductPojo dispatchRawProduct = rawProductService.getDispatchRawProduct(id);
			map.addAttribute("dispatchRawProduct", dispatchRawProduct);
			map.put("action", "view-dispatch-product");
			map.put("raw", "#");
			map.put("dispatch", "#");
			return VIEW+"/ViewDetailDispatchProduct";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/edit-dispatched-product")
	public String editdDispatchProductPage(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			DispatchRawProductPojo dispatchRawProduct = rawProductService.getDispatchRawProduct(id);
			map.addAttribute("dispatchRawProduct", dispatchRawProduct);
			map.put("action", "view-dispatch-product");
			map.put("raw", "#");
			map.put("dispatch", "#");
			return VIEW+"/EditDispatchRawProduct";
		}
		else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/update-dispatched-product", method=RequestMethod.POST)
	public @ResponseBody String updateDispatchProduct(HttpServletRequest req, HttpSession session, ModelMap map, @ModelAttribute("dispatchRawProductPojo") DispatchRawProductPojo dispatchRawProductPojo, @ModelAttribute("dispatchesRawProductPojo") DispatchesRawProductPojo dispatchesRawProductPojo){
		
		boolean updateDispatchProduct = rawProductService.updateDispatchProduct(dispatchRawProductPojo,dispatchesRawProductPojo);
		if(updateDispatchProduct){
			return "success";
		}
		else{
			return "failed";
		}
	}
	
	@RequestMapping(value="/delete-dispatched-product")
	public String deleteDispatchProduct(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			rawProductService.deleteDispatchProduct(id);
			return "redirect:/view-dispatch-product";
		}
		else {
			return "redirect:/";
		}
	} 
	
	/*End Product Dispatch*/
	
	/*Payment Details*/
	
	@RequestMapping(value="/add-payment")
	public String addPaymentPage(HttpServletRequest req, HttpSession session, ModelMap map){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			List<String> rawSuppliers = new ArrayList<String>();
			rawSuppliers = rawProductService.getSuppliersName();
			map.addAttribute("rawSuppliers", rawSuppliers);
			List<String> bankNames = bankAccountService.getBankNames();
			map.addAttribute("bankNames", bankNames);
			map.put("action", "payments-list");
			map.put("raw", "#");
			map.put("payment", "#");
			return VIEW+"/AddPayment";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/submit-payment", method=RequestMethod.POST)
	public @ResponseBody String submitPayment(HttpServletRequest req, HttpSession session, ModelMap map, @ModelAttribute("paymentsPojo") PaymentsPojo paymentsPojo){
		boolean addPayments = rawProductService.addPayments(paymentsPojo);
		if(addPayments){
			return "success";
		}
		else{
			return "failed";
		}	
	}
	
	@RequestMapping(value="/payments-list")
	public String paymentsList(HttpServletRequest req, HttpSession session, ModelMap map){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			List<PaymentsPojo> paymentsList = bankAccountService.getPayments();
			map.addAttribute("paymentsList", paymentsList);
			map.put("action", "payments-list");
			map.put("raw", "#");
			map.put("payment", "#");
			return VIEW+"/PaymentsList";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/edit-payment")
	public String editpayments(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			PaymentsPojo payment = bankAccountService.getPayment(id);
			map.addAttribute("payment", payment);
			map.put("action", "payments-list");
			map.put("raw", "#");
			map.put("payment", "#");
			return VIEW+"/EditPayment";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping("/dashboard")
	public String dashboard(HttpServletRequest req, HttpSession session){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			return VIEW+"/DashBoard";
		}
		else {
			return "redirect:/";
		}
	}
	
	
}
