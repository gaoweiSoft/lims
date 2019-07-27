package com.lims.customer.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.feilong.core.Validator;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lims.core.dto.BootTablePage;
import com.lims.core.dto.server.EquipmentDto;
import com.lims.core.dto.server.EquipmentQuery;
import com.lims.core.mapper.EquipmentMapper;
import com.lims.core.mapper.LaboratoryMapper;
import com.lims.core.pojo.Equipment;
import com.lims.core.pojo.EquipmentExample;
import com.lims.core.pojo.EquipmentExample.Criteria;
import com.lims.core.pojo.Laboratory;

@Service
public class CEquipmentService {
	@Autowired
	private EquipmentMapper equipmentMapper;
	@Autowired
	private LaboratoryMapper laboratoryMapper;

	// 查询列表
	public BootTablePage getEquipmentList(EquipmentQuery equipmentQuery) {
		if (Validator.isNotNullOrEmpty(equipmentQuery));
		int pageNum = equipmentQuery.getOffset() / equipmentQuery.getLimit() + 1;
		BootTablePage bootTablePage = new BootTablePage();
		EquipmentExample equipmentExample = new EquipmentExample();
		Criteria criteria = equipmentExample.createCriteria();
		PageHelper.startPage(pageNum, equipmentQuery.getLimit());
		criteria.andDelFlagEqualTo(0);
		// 查询条件
		if (Validator.isNotNullOrEmpty(equipmentQuery.getType())) {
			criteria.andTypeLike("%" + equipmentQuery.getType()+ "%");
		}
		Integer numberId = 0;
		List<EquipmentDto> eEquipmentDtoList = new ArrayList<EquipmentDto>();
		List<Equipment> equipmentList = equipmentMapper.selectByExample(equipmentExample);
		for (Equipment list : equipmentList) {
			Laboratory laboratory = laboratoryMapper.selectByPrimaryKey(list.getLaboratoryId());
			numberId++;
			EquipmentDto equipmentDto = new EquipmentDto();
			equipmentDto.seteId(list.geteId());
			equipmentDto.setEquipmentId(list.getEquipmentId());
			equipmentDto.setManufacturer(list.getManufacturer());
			equipmentDto.setType(list.getType());
			if (list.getStatus() == 0) {
				equipmentDto.setStatus("未使用");
			} else {
				equipmentDto.setStatus("使用中");
			}
			equipmentDto.setLocation(laboratory.getLocation());
			equipmentDto.setRoomId(laboratory.getRoomId());
			equipmentDto.setNumberId(numberId);
			
			eEquipmentDtoList.add(equipmentDto);
		}
		PageInfo<Equipment> pageInfo = new PageInfo<>(equipmentList);
		bootTablePage.setRows(eEquipmentDtoList);
		bootTablePage.setTotal(pageInfo.getTotal());
		return bootTablePage;
	}

	// 详情页
	public EquipmentDto viewEquipment(Integer eId) {
		Equipment equipment = equipmentMapper.selectByPrimaryKey(eId);
		Laboratory laboratory = laboratoryMapper.selectByPrimaryKey(equipment.getLaboratoryId());
		EquipmentDto equipmentDto = new EquipmentDto();
		BeanUtils.copyProperties(equipment, equipmentDto);
		String time = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(equipment.getTime());
		equipmentDto.setTime(time);
		if (equipment.getStatus() == 0) {
			equipmentDto.setStatus("未使用");
		} else {
			equipmentDto.setStatus("使用中");
		}
		equipmentDto.setLocation(laboratory.getLocation());
		equipmentDto.setRoomId(laboratory.getRoomId());
		return equipmentDto;
	}
}
