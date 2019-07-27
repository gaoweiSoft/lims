package com.lims.manage.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lims.core.mapper.EquipmentMapper;
import com.lims.core.mapper.LaboratoryMapper;
import com.lims.core.pojo.EquipmentType;
import com.lims.core.pojo.Laboratory;
import com.lims.core.pojo.LaboratoryExample;
import com.lims.core.pojo.LaboratoryExample.Criteria;

@Service
public class LogService {
	@Autowired
	private LaboratoryMapper laboratoryMapper;
	@Autowired
	private EquipmentMapper equipmentMapper;
//查询不同实验室的设备数量
	public List<Laboratory> getLaboratory() {
		LaboratoryExample laboratoryExample = new LaboratoryExample();
		Criteria criteria = laboratoryExample.createCriteria();
		criteria.andDelFlagEqualTo(0);
		List<Laboratory> laboratoryList=laboratoryMapper.selectByExample(laboratoryExample);
		return laboratoryList;
	}
	public List<Map<String, Object>> getType() {
		List<Map<String, Object>> equipmentMap=new ArrayList<Map<String, Object>>();
		List<EquipmentType> equipmentList=equipmentMapper.selectByType();
		for(EquipmentType list:equipmentList){
			Map<String, Object> typeMap=new HashMap<String, Object>();
			typeMap.put("value", list.getCount());
			typeMap.put("name", list.getType());
			equipmentMap.add(typeMap);
		}
		return equipmentMap;
	}
}
