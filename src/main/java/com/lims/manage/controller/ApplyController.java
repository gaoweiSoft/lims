package com.lims.manage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lims.core.dto.BaseQuery;
import com.lims.core.dto.BootTablePage;
import com.lims.core.dto.ResultType;
import com.lims.core.utils.JsonUtils;
import com.lims.manage.service.ApplyService;

@Controller
@RequestMapping("/manage/apply/")
public class ApplyController {

	@Autowired
	private ApplyService applyService;

	// 主页
	@RequestMapping("applyListUI.shtml")
	public String applySettingUI() {
		return "manage/apply/list";
	}

	// 列表页
	@RequestMapping("getApplyList.shtml")
	@ResponseBody
	public String getApplyList(BaseQuery BaseQuery) {
		BootTablePage applyList = applyService.getApplyList(BaseQuery);
		return JsonUtils.objectToJson(applyList);
	}

	// 查看所有申请主页
	@RequestMapping("allApplyListUI.shtml")
	public String allApplySettingUI() {
		return "manage/apply/allList";
	}

	// 查看所有申请
	@RequestMapping("getAllApplyList.shtml")
	@ResponseBody
	public String getAllApplyList(BaseQuery BaseQuery) {
		BootTablePage applyALLList = applyService.getAllApplyList(BaseQuery);
		return JsonUtils.objectToJson(applyALLList);
	}

	// 同意
	@RequestMapping("agreeApply.shtml")
	@ResponseBody
	public String agreeApply(Integer applyId) {
		applyService.agreeApply(applyId);
		return ResultType.success();
	}

	// 拒绝
	@RequestMapping("refuseApply.shtml")
	@ResponseBody
	public String refuseApply(Integer applyId) {
		applyService.refuseApply(applyId);
		return ResultType.success();
	}
}
