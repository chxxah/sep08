package com.movie.web.mselect;

import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MselectController {
	@Autowired
	private MselectService mselectService;

	@GetMapping("/mselect")
	public String mselect(Model model) {
		// 영화 제목 뽑아내기
		List<String> movielist = mselectService.movie();
		model.addAttribute("movielist", movielist);
//		System.out.println(movielist);
//[{mv_name=오펜하이머}, {mv_name=타겟}, {mv_name=콘크리트 유토피아}, {mv_name=달짝지근해: 7510}, {mv_name=엘리멘탈}, {mv_name=밀수}, {mv_name=신체모음.zip}, {mv_name=스파이 코드명 포춘}, {mv_name=마야 3: 숲속 왕국의 위기}, {mv_name=일주일간 친구}]
		
		// 극장 뽑아내기
		List<Map<String, Object>> theaterlist = mselectService.theater();
		model.addAttribute("theaterlist", theaterlist);
//		System.out.println(theaterlist);
//[{th_city=강남, th_idx=1, th_area=서울, th_phone=01012341234, th_location=xx, th_name=poro, th_addr=xx}]
		return "mselect";
	}
	
	@PostMapping("/mselect")
	public String mselect(@RequestParam("selecity") String selecity) {
		System.out.println(selecity);
		return "redirect:/mselect";
	}
	
	@ResponseBody
	@PostMapping("/aa")
	public String mselect(@RequestParam("area") String area, @RequestParam("selectmovie") String selectmovie) {
		System.out.println(selectmovie+" :: " + area);
		List<Map<String, Object>> city = mselectService.city(area);
		JSONObject json = new JSONObject();
		json.put("city", city);
		System.out.println(json.toString());
		
		return json.toString();
	}


}
