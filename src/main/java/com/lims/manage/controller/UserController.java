package com.lims.manage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lims.core.dto.BaseQuery;
import com.lims.core.dto.BootTablePage;
import com.lims.core.dto.ResultType;
import com.lims.core.dto.server.UserDto;
import com.lims.core.utils.JsonUtils;
import com.lims.manage.service.UserService;

@Controller
@RequestMapping("/manage/user/")
public class UserController {
	@Autowired
	private UserService userService;

	// 主页
	@RequestMapping("userListUI.shtml")
	public String userSettingUI() {
		return "manage/user/list";
	}

	// 列表页
	@RequestMapping("getUserList.shtml")
	@ResponseBody
	public String getUserList(BaseQuery BaseQuery) {
		BootTablePage userList = userService.getUserList(BaseQuery);
		return JsonUtils.objectToJson(userList);
	}

	// 查看所有用户主页
	@RequestMapping("allUserListUI.shtml")
	public String allUserSettingUI() {
		return "manage/user/allList";
	}

	// 查看所有用户
	@RequestMapping("getAllUserList.shtml")
	@ResponseBody
	public String getAllUserList(BaseQuery BaseQuery) {
		BootTablePage userALLList = userService.getAllUserList(BaseQuery);
		return JsonUtils.objectToJson(userALLList);
	}

	// 根据id获取数据， 查看详情
	@RequestMapping("viewUserUI.shtml")
	public String viewUserUI(String number, Model model) {
		UserDto userDto = userService.viewUser(number);
		model.addAttribute("user", userDto);
		return "manage/user/view";
	}

	// 同意
	@RequestMapping("agreeUser.shtml")
	@ResponseBody
	public String agreeUser(String number) {
		userService.agreeUser(number);
		return ResultType.success();
	}

	// 拒绝
	@RequestMapping("refuseUser.shtml")
	@ResponseBody
	public String refuseUser(String number) {
		userService.refuseUser(number);
		return ResultType.success();
	}
	// 拒绝
		@RequestMapping("resetUser.shtml")
		@ResponseBody
		public String resetUser(String number) {
			userService.resetUser(number);
			return ResultType.success();
		}
}
