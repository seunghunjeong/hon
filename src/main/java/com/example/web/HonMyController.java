package com.example.web;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.NaverAPI;
import com.example.domain.StoreVO;
import com.example.domain.UserVO;
import com.example.persistence.CEODAO;
import com.example.persistence.UserDAO;
import com.example.service.ReplyService;

@Controller
public class HonMyController {

	@Inject
	UserDAO udao;

	@Inject
	CEODAO cdao;

	@Inject
	ReplyService service;

	@RequestMapping("myPage")
	public String mMyPage() {
		return "main/mypage/myPage";
	}

	// 내정보

	@RequestMapping("modifi")
	public String mModifi() {
		return "main/mypage/modifi";
	}

	// 수정

	@RequestMapping(value = "upU", method = RequestMethod.POST)
	public String mUpU(UserVO vo) throws Exception {
		udao.upU(vo);
		return "redirect:myPage";
	}

	// 탈퇴

	@RequestMapping("delU")
	public String mDelU(String uid, HttpSession session) throws Exception {
		service.deleteUser(uid);

		session.removeAttribute("uid");
		session.removeAttribute("cid");
		return "redirect:mainPage";
	}

	// 유저 즐겨찾기 리스트

	@ResponseBody
	@RequestMapping("listUFL.json")
	public List<Map<String, Object>> UFLjson(String uid) throws Exception {
		return udao.listUFL(uid);
	}

	@ResponseBody
	@RequestMapping("listURL.json")
	public List<Map<String, Object>> URLjson(String uid) throws Exception {
		return udao.listURL(uid);
	}

	@RequestMapping("userReview")
	public String mUserReview() {
		return "main/mypage/userReview";
	}

	@ResponseBody
	@RequestMapping(value = "deleteUR", method = RequestMethod.POST)
	public void rdeletePost(String uid, int rid) throws Exception {
		udao.deleteUR(uid, rid);
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

	@RequestMapping(value = "updateS", method = RequestMethod.POST)
	public String updateSPost(StoreVO vo) throws Exception {
		cdao.updateS(vo);
		return "redirect:ceoMyPage";
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
