package com.lims.manage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.feilong.core.Validator;
import com.lims.core.dto.BootTablePage;
import com.lims.core.dto.ResultType;
import com.lims.core.dto.server.ManagerDto;
import com.lims.core.dto.server.ManagerQuery;
import com.lims.core.utils.JsonUtils;
import com.lims.manage.service.ManagerService;

@Controller
@RequestMapping("/manage/manager/")
public class ManagerController {
	@Autowired
	private ManagerService managerService;

	// 主页
	@RequestMapping("managerListUI.shtml")
	public String managerListUI() {
		return "manage/manager/list";
	}

	// 列表页
	@RequestMapping("getManagerList.shtml")
	@ResponseBody
	public String getManagerList(ManagerQuery managerQuery) {
		BootTablePage managerList = managerService.getManagerList(managerQuery);
		return JsonUtils.objectToJson(managerList);
	}

	// 编辑页
	@RequestMapping("managerEditUI.shtml")
	public String managerEditUI(Integer managerId, Model model) {
		if (Validator.isNotNullOrEmpty(managerId)) {
			ManagerDto managerDto = new ManagerDto();
			managerDto = managerService.getManager(managerId);
			model.addAttribute("manager", managerDto);
			return "manage/manager/edit";
		}
		return "manage/manager/add";
	}

	// //编辑
	// @RequestMapping("updateManager.shtml")
	// @ResponseBody
	// public String updateManager(ManagerDto managerDto){
	// managerService.saveManager(managerDto);
	// return ResultType.success();
	// }
	// 保存
	@RequestMapping("saveManager.shtml")
	@ResponseBody
	public String saveManager(ManagerDto managerDto) {
		managerService.saveManager(managerDto);
		return ResultType.success();
	}

	// 根据id获取
	@RequestMapping("getManager.shtml")
	@ResponseBody
	public String getManager(Integer managerId) {
		ManagerDto managerDto = managerService.getManager(managerId);
		return ResultType.success(managerDto);
	}

	// 删除
	@RequestMapping("deleteManager.shtml")
	@ResponseBody
	public String deleteManager(Integer managerId) {
		managerService.deleteManager(managerId);
		return ResultType.success();
	}
}
