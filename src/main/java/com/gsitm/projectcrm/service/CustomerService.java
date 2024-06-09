package com.gsitm.projectcrm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gsitm.projectcrm.dto.CustomerDto;
import com.gsitm.projectcrm.dto.TextLogDto;
import com.gsitm.projectcrm.mapper.CustomerMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CustomerService {
	@Autowired 
	CustomerMapper customerMapper;

	public List<TextLogDto> getDTOInfo(String keyword){
		return customerMapper.getDTOInfo(keyword);
	}
}
