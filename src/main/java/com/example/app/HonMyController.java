package com.example.app;

import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.NaverAPI;

@Controller
@RequestMapping("main")
public class HonMyController {

	@RequestMapping("myPage")
	public String mMyPage() {
		return "main/mypage/myPage";
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
