package com.gsitm.projectcrm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CustomerController {
	@GetMapping("/cust")
	public String customView() {
		return "customerView";
	}
}
