package com.lims.manage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.feilong.core.Validator;
import com.lims.core.dto.BootTablePage;
import com.lims.core.dto.ResultT;
import com.lims.core.dto.ResultType;
import com.lims.core.dto.server.EquipmentDto;
import com.lims.core.dto.server.EquipmentQuery;
import com.lims.core.utils.JsonUtils;
import com.lims.manage.service.EquipmentService;

@Controller
@RequestMapping("/manage/equipment/")
public class EquipmentController {
	@Autowired
	private EquipmentService equipmentService;

	// 主页
	@RequestMapping("equipmentListUI.shtml")
	public String equipmentListUI() {
		return "manage/equipment/list";
	}

	// 列表页
	@RequestMapping("getEquipmentList.shtml")
	@ResponseBody
	public String getEquipmentList(EquipmentQuery equipmentQuery) {
		BootTablePage equipmentList = equipmentService.getEquipmentList(equipmentQuery);
		return JsonUtils.objectToJson(equipmentList);
	}

	// 不分页列表页
	@RequestMapping("getEquipments.shtml")
	@ResponseBody
	public String getEquipments(String location,String roomId){
		List<EquipmentDto> equipments = equipmentService.getEquipments(location,roomId);	
		ArrayList<Integer> resultList = new ArrayList<Integer>();
		for(EquipmentDto equipmentDto:equipments){
		resultList.add(equipmentDto.getEquipmentId());
		}
		return ResultType.success(resultList);
	}
	
	// 根据id获取数据， 查看详情
	@RequestMapping("viewEquipmentUI.shtml")
	public String viewUserUI(Integer eId, Model model) {
		EquipmentDto equipmentDto = equipmentService.viewEquipment(eId);
		model.addAttribute("equipment", equipmentDto);
		return "manage/equipment/view";
	}

	// 根据id获取
	@RequestMapping("getEquipment.shtml")
	@ResponseBody
	public String getEquipment(Integer eId) {
		EquipmentDto equipmentDto = equipmentService.getEquipment(eId);
		return ResultType.success(equipmentDto);
	}

	// 编辑页
	@RequestMapping("equipmentEditUI.shtml")
	public String equipmentEditUI(Integer eId, Model model) {
		if (Validator.isNotNullOrEmpty(eId)) {
			EquipmentDto equipmentDto = new EquipmentDto();
			equipmentDto = equipmentService.getEquipment((eId));
			model.addAttribute("equipment", equipmentDto);
			return "manage/equipment/edit";
		}
		return "manage/equipment/add";
	}

	// //编辑
	// @RequestMapping("updateEquipment.shtml")
	// @ResponseBody
	// public String updateEquipment(EquipmentDto equipmentDto){
	// equipmentService.saveEquipment(equipmentDto);
	// return ResultType.success();
	// }
	// 保存
	@RequestMapping("saveEquipment.shtml")
	@ResponseBody
	public String saveEquipment(EquipmentDto equipmentDto) {
		equipmentService.saveEquipment(equipmentDto);
		return ResultType.success();
	}

	// 删除
	@RequestMapping("deleteEquipment.shtml")
	@ResponseBody
	public String deleteEquipment(Integer eId) {
		equipmentService.deleteEquipment(eId);
		return ResultType.success();
	}
	
	@RequestMapping("uploadFile.shtml")
	@ResponseBody
	public ResultT uploadFile(MultipartFile equipments){
		try {
			equipmentService.saveEquipmentList(equipments);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return ResultT.ok("success");
	}
}
