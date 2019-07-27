package com.lims.manage.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.feilong.core.Validator;
import com.lims.core.dto.BootTablePage;
import com.lims.core.dto.ResultType;
import com.lims.core.dto.server.LaboratoryDto;
import com.lims.core.dto.server.LaboratoryQuery;
import com.lims.core.utils.JsonUtils;
import com.lims.manage.service.LaboratoryService;

@Controller
@RequestMapping("/manage/laboratory/")
public class LaboratoryController {
	@Autowired
	private LaboratoryService laboratoryService;

	// 主页
	@RequestMapping("laboratoryListUI.shtml")
	public String laboratoryListUI() {
		return "manage/laboratory/list";
	}

	// 列表页
	@RequestMapping("getLaboratoryList.shtml")
	@ResponseBody
	public String getLaboratoryList(LaboratoryQuery laboratoryQuery) {
		BootTablePage laboratoryList = laboratoryService.getLaboratoryList(laboratoryQuery);
		return JsonUtils.objectToJson(laboratoryList);
	}

	// 不分页列表
	@RequestMapping("getLaboratorys.shtml")
	@ResponseBody
	public String getLaboratorys(String value) {
		List<LaboratoryDto> laboratorys = laboratoryService.getLaboratorys(value);
		if (value != null){
			ArrayList<String> resultList = new ArrayList<String>();
			for(LaboratoryDto laboratoryDto : laboratorys){
				resultList.add(laboratoryDto.getRoomId());
			}
			HashSet<String> resultSet = new HashSet<String>(resultList);		
			return ResultType.success(resultSet);
		}else{
			ArrayList<String> resultList = new ArrayList<String>();
			for(LaboratoryDto laboratoryDto : laboratorys){
				resultList.add(laboratoryDto.getLocation());
			}		
			HashSet<String> resultSet = new HashSet<String>(resultList);		
			return ResultType.success(resultSet);
		}		
	}
	
	// 编辑页
	@RequestMapping("laboratoryEditUI.shtml")
	public String laboratoryEditUI(Integer laboratoryId, Model model) {
		if (Validator.isNotNullOrEmpty(laboratoryId)) {
			LaboratoryDto laboratoryDto = new LaboratoryDto();
			laboratoryDto = laboratoryService.getLaboratory((laboratoryId));
			model.addAttribute("laboratory", laboratoryDto);
			return "manage/laboratory/edit";
		}
		return "manage/laboratory/add";
	}

	// //编辑
	// @RequestMapping("updateLaboratory.shtml")
	// @ResponseBody
	// public String updateLaboratory(LaboratoryDto laboratoryDto){
	// laboratoryService.saveLaboratory(laboratoryDto);
	// return ResultType.success();
	// }
	// 保存
	@RequestMapping("saveLaboratory.shtml")
	@ResponseBody
	public String saveLaboratory(LaboratoryDto laboratoryDto) {
		laboratoryService.saveLaboratory(laboratoryDto);
		return ResultType.success();
	}

	// 根据id获取
	@RequestMapping("getLaboratory.shtml")
	@ResponseBody
	public String getLaboratory(Integer laboratoryId) {
		LaboratoryDto laboratoryDto = laboratoryService.getLaboratory(laboratoryId);
		return ResultType.success(laboratoryDto);
	}

	// 删除
	@RequestMapping("deleteLaboratory.shtml")
	@ResponseBody
	public String deleteLaboratory(Integer laboratoryId) {
		laboratoryService.deleteLaboratory(laboratoryId);
		return ResultType.success();
	}
}
