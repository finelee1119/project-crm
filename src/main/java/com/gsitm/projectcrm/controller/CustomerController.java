package com.gsitm.projectcrm.controller;


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

	@PostMapping("/searchOneAjax")
	@ResponseBody
	public List<TextLogDto> getOneListAdmin(@RequestBody Map<String, String> body) {
		String keyword = body.get("keyword");
		System.out.println("keyword = " + keyword);
	
		List<TextLogDto> textLogDtos = customerService.getDTOInfo(keyword);
		System.out.println(textLogDtos.toString());
		return textLogDtos;
	}
	
}
 