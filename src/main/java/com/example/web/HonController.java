package com.example.web;

import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.NaverAPI;

@Controller
public class HonController {

	@RequestMapping("mainPage")
	public String mMainPage() {
		return "main/main";
	}

	@RequestMapping("nav")
	public String mNav() {
		return "main/nav";
	}

	@RequestMapping("search")
	public String mSearch() {
		return "main/search";
	}

	@RequestMapping("read")
	public String mRead() {
		return "main/read/read";
	}
	
	@RequestMapping("help")
	public String mHelp() {
		return "main/read/help";
	}

	@RequestMapping("read2")
	public String mRead2() {
		return "main/read/read2";
	}

	// blog 검색
	@ResponseBody
	@RequestMapping("blog.json")
	public String blogList(String keyword, String start) throws Exception {

		String text = URLEncoder.encode(keyword, "UTF-8");
		String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text; // json
		apiURL += "&start=" + start;
		apiURL += "&display=3";
		String rs = NaverAPI.search(apiURL);
		return rs;
	}

	// 추천음식점 검색
	@ResponseBody
	@RequestMapping("storeR.json")
	public String storeRList(String keyword, String start) throws Exception {

		String text = URLEncoder.encode(keyword, "UTF-8");
		String apiURL = "https://openapi.naver.com/v1/search/local.json?query=" + text; // json
		apiURL += "&start=" + start;
		apiURL += "&display=2";
		String rs = NaverAPI.search(apiURL);
		return rs;
	}


	@RequestMapping("dPage")
	public String mR2() {
		return "main/read/dPage";
	}
	
	@RequestMapping("RV")
	public String mRV() {
		return "main/read/RV/RV";
	}
}
