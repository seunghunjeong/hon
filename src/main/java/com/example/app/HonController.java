package com.example.app;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HonController {

	@RequestMapping("mainPage")
	public String mMainPage() {
		return "main";
	}
}
