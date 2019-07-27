package com.lims.manage.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lims.core.dto.ResultType;
import com.lims.core.pojo.Laboratory;
import com.lims.manage.service.LogService;

@Controller
@RequestMapping("/manage/log/")
public class LogController {
	@Autowired
	private LogService logService;

	// 实验室设备柱状图
	@RequestMapping("laboratoryLogUI.shtml")
	public String laboratoryLogUI() {
		return "manage/log/laboratoryLog";
	}

	// 获得数据
	@RequestMapping("getLaboratorys.shtml")
	@ResponseBody
	public String getLaboratorys() {
		List<Laboratory> laboratoryList = new ArrayList<Laboratory>();
		laboratoryList = logService.getLaboratory();
		return ResultType.success(laboratoryList);
	}

	// 设备类型饼图
	@RequestMapping("typeLogUI.shtml")
	public String typeLogUI() {
		return "manage/log/typeLog";
	}

	// 获得数据
	@RequestMapping("getTypes.shtml")
	@ResponseBody
	public String getTypes() {
		List<Map<String, Object>> equipmentMap=new ArrayList<Map<String, Object>>();
		equipmentMap=logService.getType();
		return ResultType.success(equipmentMap);
	}
}
