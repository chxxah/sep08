package com.movie.web.mselect;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MselectDAO {

	List<String> movie();

	List<Map<String, Object>> theater();

	List<Map<String, Object>> city(String area);

}
