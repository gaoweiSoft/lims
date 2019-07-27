package com.lims.customer.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lims.core.dto.BaseQuery;
import com.lims.core.dto.BootTablePage;
import com.lims.core.dto.ResultType;
import com.lims.core.dto.server.ApplyDto;
import com.lims.core.utils.JsonUtils;
import com.lims.customer.service.CApplyService;

@Controller
@RequestMapping("/customer/apply/")
public class CApplyController {
	@Autowired
	private CApplyService cApplyService;
	// 主页
	@RequestMapping("applyListUI.shtml")
	public String applySettingUI() {
		return "customer/apply/list";
	}

	// 列表页
	@RequestMapping("getApplyList.shtml")
	@ResponseBody
	public String getApplyList(BaseQuery BaseQuery, HttpServletRequest request) {
		BootTablePage applyList = cApplyService.getApplyList(BaseQuery, request);
		return JsonUtils.objectToJson(applyList);
	}
	// 申请页
	@RequestMapping("applyAddUI.shtml")
	public String applyEditUI(Model model) {
		return "customer/apply/add";
	}

	// 保存
	@RequestMapping("saveApply.shtml")
	@ResponseBody
	public String saveApply(ApplyDto applyDto, HttpServletRequest request) {
		cApplyService.saveApply(applyDto, request);
		return ResultType.success();
	}
}
