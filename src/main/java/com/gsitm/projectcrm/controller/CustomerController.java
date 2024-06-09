package com.gsitm.projectcrm.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gsitm.projectcrm.dto.CustomerDto;
import com.gsitm.projectcrm.dto.TextLogDto;
import com.gsitm.projectcrm.service.CustomerService;

import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class CustomerController {
	@Autowired
	CustomerService customerService;
	
	
	@GetMapping("/cust")
	public String customView() {
		return "customerView";
	}

	@PostMapping("/TextLogAjax")
	@ResponseBody
	public List<TextLogDto> TextLog(@RequestBody Map<String, String> body) {
		String keyword = body.get("keyword");
		System.out.println("keyword = " + keyword);
	
		List<TextLogDto> textLogDtos = customerService.getDTOInfo(keyword);
		System.out.println(textLogDtos.toString());
		return textLogDtos;
	}
	@PostMapping("/searchAjax")
	@ResponseBody
	public List<CustomerDto> getListAdmin(@RequestBody Map<String, String> body) {
		String keyword = body.get("keyword");
		System.out.println("keyword = " + keyword);
//		List<AdminDto> adminDtos = adminService.searchAdminOne(keyword);
		List<CustomerDto> dtos = new ArrayList<>();
		dtos = customerService.listFind(keyword);
		System.out.println(dtos.toString());

		return dtos;
	}
	@PostMapping("/searchAllAjax")
	@ResponseBody
	public List<CustomerDto> getListAllAdmin(@RequestBody Map<String, String> body) {
//		List<AdminDto> adminDtos = adminService.searchAdminOne(keyword);
		List<CustomerDto> dtos = new ArrayList<>();
//		dtos = service.list();
//		System.out.println(dtos.toString());
//		body.put("a_id", "admin");
		dtos = customerService.list();
		
		return dtos;
	}

	@PostMapping("/searchOneAjax")
	@ResponseBody
	public CustomerDto getOneListAdmin(@RequestBody Map<String, String> body) {
		String keyword = body.get("keyword");
		System.out.println("keyword = " + keyword);
	
		CustomerDto dto = new CustomerDto(); dto =
		customerService.searchAdminOne(keyword); System.out.println(dto.toString());
		 
		return dto;
	}
	
}
 