package com.lims.manage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manage/")
public class MPageController {
	@RequestMapping("loginUI.shtml")
	public String loginUI() {
		return "manage/login";
	}

	@RequestMapping("indexUI.shtml")
	public String indexUI() {
		return "manage/index";
	}

	@RequestMapping("mainUI.shtml")
	public String mainUI() {
		return "manage/main";
	}
}
