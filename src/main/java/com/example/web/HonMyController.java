package com.example.web;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.NaverAPI;
import com.example.persistence.UserDAO;

@Controller
public class HonMyController {

	@Inject
	UserDAO udao;

	@RequestMapping("myPage")
	public String mMyPage() {
		return "main/mypage/myPage";
	}

	// 유저 즐겨찾기 리스트

	@ResponseBody
	@RequestMapping("listUFL.json")
	public List<Map<String, Object>> UFLjson(String uid) throws Exception {
		return udao.listUFL(uid);
	}

	@RequestMapping("userReview")
	public String mUserReview() {
		return "main/mypage/userReview";
	}

	@RequestMapping("bookMark")
	public String mBookMark() {
		return "main/mypage/bookMark";
	}

	@RequestMapping("pay")
	public String mPay() {
		return "main/mypage/pay";
	}

	@RequestMapping("userDrop")
	public String mUserDrop() {
		return "main/mypage/userDrop";
	}

	@RequestMapping("ceoMyPage")
	public String mCeoMyPage() {
		return "main/mypage/ceoMyPage";
	}

	@RequestMapping("storeService")
	public String mStoreService() {
		return "main/mypage/storeService";
	}

	@RequestMapping("notice")
	public String mNotice() {
		return "main/mypage/notice";
	}

	@RequestMapping("customerCenter")
	public String mCustomerCenter() {
		return "main/mypage/customerCenter";
	}

	@RequestMapping("ceoDrop")
	public String mCeoDrop() {
		return "main/mypage/ceoDrop";
	}
}
