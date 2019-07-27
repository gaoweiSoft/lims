package com.lims.manage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lims.core.dto.BaseQuery;
import com.lims.core.dto.BootTablePage;
import com.lims.core.dto.ResultType;
import com.lims.core.utils.JsonUtils;
import com.lims.manage.service.RepairService;

@Controller
@RequestMapping("/manage/repair/")
public class RepairController {
	@Autowired
	private RepairService repairService;

	// 主页
	@RequestMapping("repairListUI.shtml")
	public String repairSettingUI() {
		return "manage/repair/list";
	}

	// 列表页
	@RequestMapping("getRepairList.shtml")
	@ResponseBody
	public String getRepairList(BaseQuery BaseQuery) {
		BootTablePage repairList = repairService.getRepairList(BaseQuery);
		return JsonUtils.objectToJson(repairList);
	}

	// 查看所有设备维修记录
	@RequestMapping("allRepairListUI.shtml")
	public String allRepairSettingUI() {
		return "manage/repair/allList";
	}

	// 查看所有申请
	@RequestMapping("getAllRepairList.shtml")
	@ResponseBody
	public String getAllRepairList(BaseQuery BaseQuery) {
		BootTablePage repairALLList = repairService.getAllRepairList(BaseQuery);
		return JsonUtils.objectToJson(repairALLList);
	}

	// 处理
	@RequestMapping("dealRepair.shtml")
	@ResponseBody
	public String dealRepair(Integer repairId) {
		repairService.dealRepair(repairId);
		return ResultType.success();
	}

	// 完成
	@RequestMapping("comRepair.shtml")
	@ResponseBody
	public String comRepair(Integer repairId) {
		repairService.comRepair(repairId);
		return ResultType.success();
	}
}