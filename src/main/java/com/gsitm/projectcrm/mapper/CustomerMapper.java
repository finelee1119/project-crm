package com.gsitm.projectcrm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gsitm.projectcrm.dto.CustomerDto;
import com.gsitm.projectcrm.dto.TextLogDto;

@Mapper

public interface CustomerMapper {

	List<TextLogDto> getDTOInfo(@Param("keyword")String keyword);

	List<CustomerDto> list();

	List<CustomerDto> listFind(String keyword);

	CustomerDto searchAdminOne(String keyword);
}
