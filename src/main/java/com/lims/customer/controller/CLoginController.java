package com.lims.customer.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lims.core.pojo.User;
import com.lims.customer.service.CLoginService;

@Controller
@RequestMapping("/customer/login/")
public class CLoginController {
	@Autowired
	private CLoginService cLoginService;

	@RequestMapping("checkUser.shtml")
	@ResponseBody
	public Integer checkUser(User user, HttpServletRequest request) {
		// 0：用户不存在 1：密码错误 2：用户名密码正确
		Integer result = cLoginService.checkUser(user, request);
		return result;
	}
}
