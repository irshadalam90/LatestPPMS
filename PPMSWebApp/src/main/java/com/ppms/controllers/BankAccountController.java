package com.ppms.controllers;

import java.io.File;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ppms.pojo.BankAccountPojo;
import com.ppms.pojo.BankEntryPojo;
import com.ppms.pojo.UserPojo;
import com.ppms.service.BankAccountService;
import com.ppms.service.HomeService;
import com.ppms.service.RawProductService;
import com.ppms.service.SaleService;

@Controller
public class BankAccountController {
	
	@Autowired
	BankAccountService bankAccountService;
	
	@Autowired
	RawProductService rawProductService;

	@Autowired
	SaleService saleService;

	public static final String VIEW = "bank_account";
	
	@RequestMapping("/create-bank-account")
	public String createBanAccount(HttpServletRequest req, HttpSession session, ModelMap map){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			return VIEW+"/BankAccount";
		}
		else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/submit-bank-account", method=RequestMethod.POST)
	public @ResponseBody String submitBankAccount(HttpServletRequest req, HttpSession session, ModelMap map, @ModelAttribute BankAccountPojo bankAccountPojo){
		
		boolean addBankAccount = bankAccountService.submitBankAccountData(bankAccountPojo);
		if(addBankAccount){
			return "success";
		}
		else {
			return "failed";
		}
		
	}
	
	@RequestMapping("/bank-account-list")
	public String BankAccountList(HttpServletRequest req, HttpSession session, ModelMap map){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			List<BankAccountPojo> bankAccountList = new ArrayList<BankAccountPojo>();
			bankAccountList = bankAccountService.getBankAccountList();
			map.addAttribute("bankAccountList", bankAccountList);
			map.put("action", "bank-account-list");
			map.put("bankacc", "#");
			return VIEW+"/ViewBankAccount";
		}
		else {
			return "redirect:/";
		}
	}
	
	@RequestMapping("/view-bank-account")
	public String viewBankAccount(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			BankAccountPojo bankAccount = new BankAccountPojo();
			bankAccount = bankAccountService.getBankAccountData(id);
			map.addAttribute("bankAccount", bankAccount);
			return VIEW+"/ViewDetailBankAccount";
		}
		else {
			return "redirect:/";
		}
	}
	
	@RequestMapping("/edit-bank-account")
	public String editBanAccount(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			BankAccountPojo bankAccount = new BankAccountPojo();
			bankAccount = bankAccountService.getBankAccountData(id);
			map.addAttribute("bankAccount", bankAccount);
			return VIEW+"/EditBankAccount";
		}
		else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/update-bank-account", method=RequestMethod.POST)
	public @ResponseBody String updateBankAccount(HttpServletRequest req, HttpSession session, ModelMap map, @ModelAttribute BankAccountPojo bankAccountPojo){
		
		boolean updateBankAccount = bankAccountService.updateBankAccountData(bankAccountPojo);
		if(updateBankAccount){
			return "success";
		}
		else {
			return "failed";
		}
	}
	
	@RequestMapping("/delete-bank-account")
	public String deleteBanAccount(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			boolean deleteBankAccount = bankAccountService.deleteBankAccount(id);
			return "redirect:/bank-account-list";
		}
		else {
			return "redirect:/";
		}
	}
	
	@RequestMapping("/add-bank-entry")
	public String addBankEntry(HttpServletRequest req, HttpSession session, ModelMap map){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			List<String> bankNames = bankAccountService.getBankNames();
			map.addAttribute("bankNames", bankNames);
			List<String> supplierNames = new ArrayList<String>();
			supplierNames = rawProductService.getSuppliersName();
			map.addAttribute("supplierNames", supplierNames);
			List<String> customerNamesList = saleService.getCustomerNamesList();
			map.addAttribute("customerNames", customerNamesList);
			return VIEW+"/AddBankEntry";
		}
		else {
			return "redirect:/";
		}
	}

	@RequestMapping(value="/submit-bank-entry", method=RequestMethod.POST)
	public @ResponseBody String submitBankEntry(HttpServletRequest req, HttpSession session, ModelMap map, @ModelAttribute BankEntryPojo bankEntryPojo){
		
		boolean addBankEntry = bankAccountService.submitBankEntry(bankEntryPojo);
		if(addBankEntry){
			return "success";
		}
		else {
			return "failed";
		}
		
	}
	
	@RequestMapping("/bank-entry-list")
	public String bankEntryList(HttpServletRequest req, HttpSession session, ModelMap map){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			List<BankEntryPojo> bankEntryList = bankAccountService.getbankEntryList();
			map.addAttribute("bankEntryList", bankEntryList);
			map.put("action", "bank-entry-list");
			map.put("bankacc", "#");
			return VIEW+"/BankEntryList";
		}
		else {
			return "redirect:/";
		}
	}
	
	@RequestMapping("/view-bank-entry")
	public String viewBankEntry(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			BankEntryPojo bankEntry = bankAccountService.getbankEntryData(id);
			map.addAttribute("bankEntry", bankEntry);
			return VIEW+"/ViewBankEntry";
		}
		else {
			return "redirect:/";
		}
	}

	@RequestMapping("/edit-bank-entry")
	public String editBankEntry(HttpServletRequest req, HttpSession session, ModelMap map, @RequestParam Integer id){
		UserPojo user = (UserPojo)session.getAttribute("user");
		if(user != null){
			BankEntryPojo bankEntry = bankAccountService.getbankEntryData(id);
			map.addAttribute("bankEntry", bankEntry);
			return VIEW+"/EditBankEntry";
		}
		else {
			return "redirect:/";
		}
	}

}


