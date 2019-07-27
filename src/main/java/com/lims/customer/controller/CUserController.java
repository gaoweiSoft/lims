package com.lims.customer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lims.core.dto.ResultType;
import com.lims.core.dto.server.UserDto;
import com.lims.customer.service.CUserService;

@Controller
@RequestMapping("/customer/user/")
public class CUserController {
	@Autowired
	private CUserService cUserService;

	// 注册页
	@RequestMapping("userAddUI.shtml")
	public String userAddUI(Model model, HttpServletRequest request) {
		return "customer/user/add";
	}

	// 编辑页
	@RequestMapping("userEditUI.shtml")
	public String userEditUI(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		// 从session中获取用户id
		Object number = session.getAttribute("number");
		UserDto userDto = new UserDto();
		userDto = cUserService.getUser((String) number);
		model.addAttribute("user", userDto);
		return "customer/user/edit";
	}

	// 修改密码页
	@RequestMapping("changePasswordUI.shtml")
	public String changePasswordUI(Model model, HttpServletRequest request) {
		return "customer/user/changePassword";
	}

	// 修改密码
	@RequestMapping("changePassword.shtml")
	@ResponseBody
	public String changePassword(UserDto userDto, HttpServletRequest request) {
		Integer result = cUserService.changePassword(userDto, request);
		return ResultType.success(result);
	}

	// 保存
	@RequestMapping("saveUser.shtml")
	@ResponseBody
	public String saveUser(UserDto userDto) {
		cUserService.saveUser(userDto);
		return ResultType.success();
	}

	// 根据id获取
	@RequestMapping("getUser.shtml")
	@ResponseBody
	public String getUser(String number) {
		UserDto userDto = cUserService.getUser(number);
		return ResultType.success(userDto);
	}

	// 删除：注销用户
	@RequestMapping("deleteUser.shtml")
	@ResponseBody
	public String deleteUser(HttpServletRequest request) {
		cUserService.deleteUser(request);
		return ResultType.success();
	}

}
