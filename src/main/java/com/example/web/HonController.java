package com.example.web;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.NaverAPI;
import com.example.domain.PageMaker;
import com.example.domain.ReplyVO;
import com.example.domain.SearchCriteria;
import com.example.domain.StoreVO;
import com.example.persistence.StoreDAO;
import com.example.persistence.UserDAO;
import com.example.service.ReplyService;

@Controller
public class HonController {

	@Inject
	StoreDAO sdao;

	@Inject
	UserDAO udao;

	@Inject
	ReplyService rService;

	@RequestMapping("mainPage")
	public String mMainPage() throws Exception {
		return "main/main";
	}

	@ResponseBody
	@RequestMapping("listS.json")
	public List<StoreVO> listS() throws Exception {
		List<StoreVO> list = sdao.listS();
		return list;
	}

	@RequestMapping("nav")
	public String mNav() {
		return "main/nav";
	}

	@RequestMapping("search")
	public String mSearch(Model model, SearchCriteria cri) throws Exception {
		cri.setPerPageNum(9);

		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(sdao.searchTOT(cri));

		model.addAttribute("list", sdao.searchS(cri));
		model.addAttribute("pm", pm);
		return "main/search";
	}

	@ResponseBody
	@RequestMapping(value = "searchS.json")
	public Map<String, Object> searchJson(SearchCriteria cri) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		cri.setPerPageNum(9);
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(sdao.searchTOT(cri));
		map.put("pm", pm);
		map.put("list", sdao.searchS(cri));
		return map;
	}

	// 다음 날씨 크롤링

	@ResponseBody
	@RequestMapping("weather.json")
	public List<HashMap<String, Object>> weather() throws IOException {
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();

		Document doc = Jsoup.connect("https://www.daum.net/").get();
		Elements es = doc.select("#minitoday .list_weather");

		for (Element e : es.select(".hide")) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("area", e.select(".txt_part").text());
			map.put("temper", e.select(".screen_out").text());
			map.put("w", e.select("strong").text());

			list.add(map);
		}
		return list;
	}

	@RequestMapping("read")
	public String mRead(Model model, String sid) throws Exception {
		model.addAttribute("vo", sdao.readS(sid));
		return "main/read/read";
	}

	@RequestMapping("help")
	public String mHelp() {
		return "main/read/help";
	}

	@ResponseBody
	@RequestMapping(value = "rService")
	public String replyUPost(ReplyVO vo) throws Exception {
		rService.insertRp(vo);
		return "1";
	}

	@RequestMapping("read2")
	public String mRead2(Model model, String sid) throws Exception {
		model.addAttribute("vo", sdao.readS(sid));
		model.addAttribute("RpsTOT", sdao.listRpsTOT(sid));
		return "main/read/read2";
	}

	// 덧글 리스트

	@ResponseBody
	@RequestMapping("listRpS.json")
	public List<Map<String, Object>> replyRpSJson(int page, String sid) throws Exception {
		return sdao.listRpS(page, sid);
	}

	// 즐겨찾기

	@ResponseBody
	@RequestMapping("FChk")
	public String FChk(String uid, String sid) throws Exception {
		return sdao.FChk(sid, uid);
	}

	@ResponseBody
	@RequestMapping("userFI")
	public void userFI(String uid, String sid) throws Exception {
		udao.userFI(uid, sid);
	}

	@ResponseBody
	@RequestMapping("userFU")
	public void userFU(String uid, int favor) throws Exception {
		udao.userFU(uid, favor);
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
