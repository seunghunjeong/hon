package com.example.web;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.CEOVO;
import com.example.domain.StoreVO;
import com.example.domain.UserVO;
import com.example.persistence.CEODAO;
import com.example.persistence.StoreDAO;
import com.example.persistence.UserDAO;

@Controller
public class JoinController {

	// 리스트
	@RequestMapping("list")
	public String list(String email, HttpSession session) {
		if (email != null) {
			session.setAttribute("uid", email);
		}
		return "login/list";
	}

	// 로그인
	@RequestMapping("login")
	public String login() {
		return "login/login";
	}

	// 관리자 페이지
	@RequestMapping("rpage")
	public String rpage() {
		return "login/rpage";
	}

	@Inject
	StoreDAO sdao;

	@RequestMapping("insertS")
	public String insertS() {
		return "insertS";
	}

	@RequestMapping(value = "insertS", method = RequestMethod.POST)
	public String insertSPost(StoreVO vo) throws Exception {
		sdao.insert(vo);
		return "redirect:mainPage";
	}

	// 사장 페이지
	@RequestMapping("cpage")
	public String cpage() {
		return "login/cpage";
	}

	// 아이디찾기
	@RequestMapping("findId")
	public String findId() {
		return "login/findId";
	}

	// 비밀번호 찾기
	@RequestMapping("findPw")
	public String findPw() {
		return "login/findPw";
	}

	@Inject
	UserDAO dao;

	@Inject
	CEODAO cdao;

	// 로그인
	@RequestMapping("loginPost")
	public String loginPost(UserVO vo, CEOVO cvo, Model model, String uid, String upw, HttpSession session)
			throws Exception {
		UserVO user = dao.login(vo);
		CEOVO ceo = cdao.login(cvo);
		if (user != null) { // 회원로그인
			model.addAttribute("user", user);
			return "main/main";
		} else if (ceo != null) { // 사장로그인
			model.addAttribute("ceo", ceo);
			return "main/mypage/ceoMyPage";
		} else if (uid.equals("root") && upw.equals("honkey")) { // 관리자로그인
			session.setAttribute("uid", uid);
			return "redirect:rpage";
		}
		return "redirect:login";
	}

	// 로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("uid");
		session.removeAttribute("cid");
		return "redirect:mainPage";
	}

	// 네이버
	@RequestMapping("naverLogin")
	public String naverLogin() {
		return "login/naverLogin";
	}

	// 카카오
	@RequestMapping("kakaoLogin")
	public String kakaoLogin() {
		return "login/kakaoLogin";
	}

	// 회원가입
	@RequestMapping("join")
	public String join() {
		return "login/join/userInsert";
	}

	@RequestMapping("ceoInsert")
	public String mCeoInsert() {
		return "login/join/ceoInsert";
	}

	@RequestMapping(value = "joinU", method = RequestMethod.POST)
	public String joinU(UserVO vo, Model model, String uid, String upw, HttpSession session) throws Exception {
		dao.joinU(vo);
		return loginPost(vo, null, model, uid, upw, session);
	}

	// 아이디 확인
	@ResponseBody
	@RequestMapping("idChk")
	public int mIdChk(String uid) throws Exception {
		return dao.idChk(uid);
	}

	// 닉네임 확인
	@ResponseBody
	@RequestMapping("nickChk")
	public int mNickChk(String nick) throws Exception {
		return dao.nickChk(nick);
	}

}
