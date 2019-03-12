package com.ppms.controllers;

import java.util.ArrayList;
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
import com.ppms.pojo.CustomerPojo;
import com.ppms.pojo.GstInvoicePojo;
import com.ppms.pojo.GstInvoiceProductPojo;
import com.ppms.pojo.RawReceivedPojo;
import com.ppms.pojo.RawReceivedProductPojo;
import com.ppms.pojo.ReferencesPojo;
import com.ppms.pojo.SaleOrderPojo;
import com.ppms.pojo.SaleOrderProductPojo;
import com.ppms.pojo.UserPojo;
import com.ppms.service.SaleService;

@Controller
public class SaleController {

	@Autowired
	SaleService saleService;
	
	public static final String VIEW = "salebook";
	
	@RequestMapping(value="/add-customer")
	public String addCustomerPage(HttpServletRequest req, HttpSession session, ModelMap map){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			return VIEW+"/AddCustomer";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/add-customer-details")
	public @ResponseBody String addCustomerDetails(HttpServletRequest req, HttpSession session, ModelMap map, @ModelAttribute CustomerPojo custmerPojo){
		
		boolean addCustmer = saleService.addCustomerDetails(custmerPojo);
		if(addCustmer){
			return "success";
		}
		else{
			return "failed";
		}
	} 
	
	@RequestMapping(value="/view-customers")
	public String viewCustomerPage(HttpServletRequest req, HttpSession session, ModelMap map){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			List<CustomerPojo> customerList = new ArrayList<CustomerPojo>();
			customerList = saleService.getCustomers();
			map.addAttribute("customerList", customerList);
			map.put("action", "view-customers");
			map.put("sale", "#");
			return VIEW+"/ViewCustomers";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/view-detail-customer")
	public String viewDetailCustomerPage(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			CustomerPojo customer = new CustomerPojo();
			customer = saleService.getCustomer(id);
			map.addAttribute("customer", customer);
			return VIEW+"/ViewDetailCustomer";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/edit-customer")
	public String editCustomerPage(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			CustomerPojo customer = new CustomerPojo();
			customer = saleService.getCustomer(id);
			map.addAttribute("customer", customer);
			return VIEW+"/EditCustomer";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/update-customer-details")
	public @ResponseBody String updateCustomerDetails(HttpServletRequest req, HttpSession session, ModelMap map, @ModelAttribute CustomerPojo custmerPojo){
		
		boolean updateCustomer = saleService.updateCustomerDetails(custmerPojo);
		if(updateCustomer){
			return "success";
		}
		else{
			return "failed";
		}
	} 
	
	@RequestMapping(value="/delete-customer")
	public String deleteCustomerDetails(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			boolean deleteCustomer = saleService.deleteCustomerDetails(id);
			return "redirect:/view-customers";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/add-sale-order")
	public String addSaleOrderPage(HttpServletRequest req, HttpSession session, ModelMap map){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			List<String> customerNamesList = saleService.getCustomerNamesList();
			map.addAttribute("customerNamesList", customerNamesList);
			List<String> productNameList = saleService.getProductNameList();
			map.addAttribute("productNameList", productNameList);
			return VIEW+"/AddSaleOrder";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/get-shipping-address")
	public @ResponseBody Object[] getCustomerShipAddress(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam String customerName){
		
		Object[] shipAddress = saleService.getCustomerShipAddress(customerName);
		map.addAttribute("shipAddress", shipAddress);
		//System.out.println(shipAddress);
		return shipAddress;
		
	} 
	
	@RequestMapping(value="/get-product-size")
	public @ResponseBody List<String> getProductSize(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam String productName){
		List<String> productSizeList = saleService.getProductSizeList(productName);
		map.addAttribute("productSizeList", productSizeList);
		return productSizeList;
	}
	
	@RequestMapping(value="/get-product-gage")
	public @ResponseBody List<String> getProductGage(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam String productName, @RequestParam String productSize){
		List<String> productGageList = saleService.getProductGageList(productName, productSize);
		map.addAttribute("productGageList", productGageList);
		return productGageList;
	} 
	
	@RequestMapping(value="/get-product-qty")
	public @ResponseBody Object[] getProductQty(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam String productName, @RequestParam String productSize, @RequestParam String productGage){
		Object[] obj = new Object[]{"qtyNotFound"} ;
		
		Object[] productQty = saleService.getProductQtyList(productName,productSize,productGage);
		map.addAttribute("productQty", productQty);
		if(productQty != null){
			return productQty;
		}
		else {
			return obj;
		}
	} 
	
	@RequestMapping(value="/get-product-unit-weight")
	public @ResponseBody Double getProductUnitWt(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam String productName, @RequestParam String productSize, @RequestParam String productGage){
		Double productunitWt = saleService.getProductUnitWeight(productName,productSize,productGage);
		map.addAttribute("productQty", productunitWt);
		return productunitWt;
	} 
	
	@RequestMapping(value="/submit-sale-order", method=RequestMethod.POST)
	public @ResponseBody String submitSaleOrder(HttpServletRequest req, HttpSession session, String productData, ModelMap map, String saleOrderForm){
		
		SaleOrderPojo saleOrderPojo = new Gson().fromJson(saleOrderForm, SaleOrderPojo.class);
		SaleOrderProductPojo []saleOrderProductPojo = new Gson().fromJson(productData, SaleOrderProductPojo[].class);
		boolean addSaleOrder = saleService.addSaleOrder(saleOrderPojo,saleOrderProductPojo);
		if(addSaleOrder){
			return "success";
		}
		else{
			return "failed";
		}
		
	}
	
	@RequestMapping(value="/sale-orders")
	public String viewSaleOrderPage(HttpServletRequest req, HttpSession session, ModelMap map){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			List<SaleOrderPojo> saleOrders = saleService.getSaleOrdersList();
			map.addAttribute("saleOrders", saleOrders);
			map.put("action", "sale-orders");
			map.put("sale", "#");
			return VIEW+"/ViewSaleOrder";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/add-references")
	public String addReferencesPage(HttpServletRequest req, HttpSession session, ModelMap map){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			map.put("action", "add-references");
			map.put("sale", "#");
			return VIEW+"/AddReferences";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/submit-references")
	public @ResponseBody String submitReferences(HttpServletRequest req, HttpSession session, ModelMap map, @ModelAttribute ReferencesPojo referencesPojo){
		boolean addReferences = saleService.addReferences(referencesPojo);
		if(addReferences){
			return "success";
		}
		else {
			return "failed";
		}
	} 
	
	@RequestMapping(value="/references")
	public String viewReferencesPage(HttpServletRequest req, HttpSession session, ModelMap map){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			List<ReferencesPojo> references = saleService.getReferencesList();
			map.addAttribute("references", references);
			return VIEW+"/ViewReferences";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/add-gst-invoice")
	public String addGstInvoicePage(HttpServletRequest req, HttpSession session, ModelMap map){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			List<String> customerNamesList = saleService.getCustomerNamesList();
			map.addAttribute("customerNamesList", customerNamesList);
			List<String> productNameList = saleService.getProductNameList();
			map.addAttribute("productNameList", productNameList);
			return VIEW+"/AddGstInvoice";
		}
		else {
			return "redirect:/";
		}
	} 
	
	@RequestMapping(value="/submit-gst-invoice", method=RequestMethod.POST)
	public @ResponseBody String submitGstInvoice(HttpServletRequest req, HttpSession session, String productData, ModelMap map, String gstInvoiceForm){
		
		GstInvoicePojo gstInvoicePojo = new Gson().fromJson(gstInvoiceForm, GstInvoicePojo.class);
		GstInvoiceProductPojo []gstInvoiceProductPojo = new Gson().fromJson(productData, GstInvoiceProductPojo[].class);
		boolean addGstInvoice = saleService.addGstInvoice(gstInvoicePojo,gstInvoiceProductPojo);
		if(addGstInvoice){
			return "success";
		}
		else{
			return "failed";
		}
		
	}
	
	@RequestMapping(value="/gst-invoice")
	public String viewGstInvoicePage(HttpServletRequest req, HttpSession session, ModelMap map){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			List<GstInvoicePojo> gstInvoice = saleService.getGstInvoiceList();
			map.addAttribute("gstInvoice", gstInvoice);
			map.put("action", "gst-invoice");
			map.put("sale", "#");
			return VIEW+"/ViewGstInvoice";
		}
		else {
			return "redirect:/";
		}
	} 
}
