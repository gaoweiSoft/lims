package com.lims.customer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lims.core.dto.ResultType;
import com.lims.core.dto.server.RepairDto;
import com.lims.customer.service.CRepairService;

@Controller
@RequestMapping("/customer/repair/")
public class CRepairController {
	@Autowired
	private CRepairService repairEquipmentService;

	// 编辑页
	@RequestMapping("repairAddUI.shtml")
	public String repairEditUI(Model model) {
		return "customer/repair/add";
	}

	// 保存
	@RequestMapping("saveRepair.shtml")
	@ResponseBody
	public String saveRepair(RepairDto repairDto) {
		repairEquipmentService.saveRepair(repairDto);
		return ResultType.success();
	}
}
