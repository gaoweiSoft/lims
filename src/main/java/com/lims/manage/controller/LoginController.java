package com.lims.manage.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lims.core.pojo.Manager;
import com.lims.manage.service.LoginService;

@Controller
@RequestMapping("/manage/login/")
public class LoginController {
	@Autowired
	private LoginService loginService;

	@RequestMapping("checkUser.shtml")
	@ResponseBody
	public Integer checkUser(Manager manager, HttpServletRequest request) {
		// 0：用户不存在 1：密码错误 2：用户名密码正确
		Integer result = loginService.checkUser(manager, request);
		return result;
	}
}
