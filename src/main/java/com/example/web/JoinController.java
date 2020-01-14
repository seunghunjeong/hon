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

	// ����Ʈ
	@RequestMapping("list")
	public String list(String email, HttpSession session) {
		if (email != null) {
			session.setAttribute("uid", email);
		}
		return "login/list";
	}

	// �α���
	@RequestMapping("login")
	public String login() {
		return "login/login";
	}

	// ������ ������
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

	// ���� ������
	@RequestMapping("cpage")
	public String cpage() {
		return "login/cpage";
	}

	// ���̵�ã��
	@RequestMapping("findId")
	public String findId() {
		return "login/findId";
	}

	// ��й�ȣ ã��
	@RequestMapping("findPw")
	public String findPw() {
		return "login/findPw";
	}

	@Inject
	UserDAO dao;

	@Inject
	CEODAO cdao;

	// �α���
	@RequestMapping("loginPost")
	public String loginPost(UserVO vo, CEOVO cvo, Model model, String uid, String upw, HttpSession session)
			throws Exception {
		UserVO user = dao.login(vo);
		CEOVO ceo = cdao.login(cvo);
		if (user != null) { // ȸ���α���
			model.addAttribute("user", user);
			return "main/main";
		} else if (ceo != null) { // ����α���
			model.addAttribute("ceo", ceo);
			return "main/mypage/ceoMyPage";
		} else if (uid.equals("root") && upw.equals("honkey")) { // �����ڷα���
			session.setAttribute("uid", uid);
			return "redirect:rpage";
		}
		return "redirect:login";
	}

	// �α׾ƿ�
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("uid");
		session.removeAttribute("cid");
		return "redirect:mainPage";
	}

	// ���̹�
	@RequestMapping("naverLogin")
	public String naverLogin() {
		return "login/naverLogin";
	}

	// īī��
	@RequestMapping("kakaoLogin")
	public String kakaoLogin() {
		return "login/kakaoLogin";
	}

	// ȸ������
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

	// ���̵� Ȯ��
	@ResponseBody
	@RequestMapping("idChk")
	public int mIdChk(String uid) throws Exception {
		return dao.idChk(uid);
	}

	// �г��� Ȯ��
	@ResponseBody
	@RequestMapping("nickChk")
	public int mNickChk(String nick) throws Exception {
		return dao.nickChk(nick);
	}

}
