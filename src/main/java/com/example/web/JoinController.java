package com.example.web;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.CEOVO;
import com.example.domain.MenuVO;
import com.example.domain.StoreVO;
import com.example.domain.UserVO;
import com.example.persistence.CEODAO;
import com.example.persistence.StoreDAO;
import com.example.persistence.UserDAO;

@Controller
public class JoinController {

	@Inject
	StoreDAO sdao;

	@Inject
	UserDAO dao;

	@Inject
	CEODAO cdao;

	// 리스트
	@RequestMapping("list")
	public String list(String email, HttpSession session) {
		if (email != null) {
			session.setAttribute("uid", email);
			session.setAttribute("user.image", "#");
		}
		return "main/main";
	}

	// 로그인
	@RequestMapping("login")
	public String login() {
		return "login/login";
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

	// 추가

	@RequestMapping("insertS")
	public String insertS(StoreVO vo) throws Exception {
		return "main/roo/insertS";
	}

	@RequestMapping(value = "insertS", method = RequestMethod.POST)
	public String insertSPost(StoreVO vo) throws Exception {
		cdao.insertS(vo);
		return "redirect:mainPage";
	}

	@RequestMapping(value = "deleteS", method = RequestMethod.POST)
	public @ResponseBody void delete(String sid) {
		try {
			cdao.deleteS(sid);

		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	@RequestMapping("rpage")
	public String rpage(Model model, String sid) throws Exception {
		model.addAttribute("csvo", cdao.readS(sid));
		return "login/rpage";
	}

	@ResponseBody
	@RequestMapping("listU.json")
	public List<UserVO> listU() throws Exception {
		List<UserVO> list = dao.listU();
		return list;
	}

	@RequestMapping(value = "insertU", method = RequestMethod.POST)
	public String insertUPost(UserVO vo) throws Exception {
		dao.insertU(vo);
		return "redirect:mainPage";
	}

	@RequestMapping(value = "deleteU", method = RequestMethod.POST)
	public @ResponseBody void deleteU(String uid) {
		try {
			dao.deleteU(uid);

		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	@RequestMapping("menu")
	public String menu(Model model, String sid) throws Exception {
		return "main/roo/menu";
	}
	
	@RequestMapping("menu2")
	public String menu2(Model model, String sid) throws Exception {
		model.addAttribute("mvo", cdao.readM(sid));
		return "main/roo/menu2";
	}


	@ResponseBody
	@RequestMapping("listRS.json")
	public List<StoreVO> listS() throws Exception {
		List<StoreVO> list = cdao.listS();
		return list;
	}

	@ResponseBody
	@RequestMapping("listM.json")
	public List<MenuVO> listM(String sid) throws Exception {
		return cdao.listM(sid);
	}

	@RequestMapping("insertM")
	public String insertM(MenuVO mvo) throws Exception {
		return "main/roo/insertM";
	}

	@RequestMapping(value = "insertM", method = RequestMethod.POST)
	public String insertMPost(MenuVO mvo) throws Exception {
		cdao.insertM(mvo);
		return "redirect:menu";
	}

	@RequestMapping(value = "deleteM", method = RequestMethod.POST)
	public @ResponseBody void deleteM(String sid, int mcount) {
		try {
			cdao.deleteM(sid, mcount);

		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
}
