package com.movie.web.mselect;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MselectService {
	@Autowired
	private MselectDAO mselectDAO;

	public List<String> movie() {
		return mselectDAO.movie();
	}

	public List<Map<String, Object>> theater() {
		return mselectDAO.theater();
	}

	public List<Map<String, Object>> city(String area) {
		return mselectDAO.city(area);
	}

}
