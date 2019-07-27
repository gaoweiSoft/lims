package com.lims.customer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lims.core.dto.BootTablePage;
import com.lims.core.dto.server.EquipmentDto;
import com.lims.core.dto.server.EquipmentQuery;
import com.lims.core.utils.JsonUtils;
import com.lims.customer.service.CEquipmentService;

@Controller
@RequestMapping("/customer/equipment/")
public class CEquipmentController {
	@Autowired
	private CEquipmentService cEquipmentService;

	// 主页
	@RequestMapping("equipmentListUI.shtml")
	public String equipmentListUI(String search, Model model) {
		model.addAttribute("search", search);
		return "customer/equipment/list";
	}

	// 列表页
	@RequestMapping("getEquipmentList.shtml")
	@ResponseBody
	public String getEquipmentList(EquipmentQuery equipmentQuery) {
		BootTablePage equipmentList = cEquipmentService.getEquipmentList(equipmentQuery);
		return JsonUtils.objectToJson(equipmentList);
	}

	// 根据id获取数据， 查看详情
	@RequestMapping("viewEquipmentUI.shtml")
	public String viewUserUI(Integer eId, Model model) {
		EquipmentDto equipmentDto = cEquipmentService.viewEquipment(eId);
		model.addAttribute("equipment", equipmentDto);
		return "customer/equipment/view";
	}
}
