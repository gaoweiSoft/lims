package com.lims.manage.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.feilong.core.Validator;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lims.core.dto.BaseQuery;
import com.lims.core.dto.BootTablePage;
import com.lims.core.dto.server.RepairDto;
import com.lims.core.mapper.LaboratoryMapper;
import com.lims.core.mapper.RepairMapper;
import com.lims.core.pojo.Laboratory;
import com.lims.core.pojo.LaboratoryExample;
import com.lims.core.pojo.Repair;
import com.lims.core.pojo.RepairExample;
import com.lims.core.pojo.RepairExample.Criteria;

@Service
public class RepairService {
	@Autowired
	private RepairMapper repairMapper;
	@Autowired
	private LaboratoryMapper laboratoryMapper;

	// 查询列表
	public BootTablePage getRepairList(BaseQuery baseQuery) {
		if (Validator.isNotNullOrEmpty(baseQuery));
		int pageNum = baseQuery.getOffset() / baseQuery.getLimit() + 1;
		BootTablePage bootTablePage = new BootTablePage();
		List<RepairDto> repairDtoList = new ArrayList<RepairDto>();
		RepairExample repairExample = new RepairExample();
		Criteria criteria = repairExample.createCriteria();
		PageHelper.startPage(pageNum, baseQuery.getLimit());
		criteria.andRepairStatusNotEqualTo(2);
		List<Repair> repairList = repairMapper.selectByExample(repairExample);
		Integer numberId = 0;
		for (Repair list : repairList) {
			LaboratoryExample laboratoryExample = new LaboratoryExample();
			com.lims.core.pojo.LaboratoryExample.Criteria laboratoryCriteria = laboratoryExample.createCriteria();
			RepairDto repairDto = new RepairDto();
			numberId++;
			laboratoryCriteria.andLaboratoryIdEqualTo(list.getLaboratoryId());
			List<Laboratory> laboratoryList = laboratoryMapper.selectByExample(laboratoryExample);
			repairDto.setNumberId(numberId);
			repairDto.setRepairId(list.getRepairId());
			repairDto.setEquipmentId(list.getEquipmentId());
			repairDto.setProblem(list.getProblem());
			repairDto.setLocation(laboratoryList.get(0).getLocation());
			repairDto.setRoomId(laboratoryList.get(0).getRoomId());
			if (list.getRepairStatus() == 0) {
				repairDto.setRepairStatus("未处理");
			} else if (list.getRepairStatus() == 1) {
				repairDto.setRepairStatus("处理中");
			} else {
				repairDto.setRepairStatus("完成");
			}
			repairDtoList.add(repairDto);
		}
		PageInfo<Repair> pageInfo = new PageInfo<>(repairList);
		bootTablePage.setRows(repairDtoList);
		bootTablePage.setTotal(pageInfo.getTotal());
		return bootTablePage;
	}

	// 查询所有申请列表
	public BootTablePage getAllRepairList(BaseQuery baseQuery) {
		if (Validator.isNotNullOrEmpty(baseQuery));
		int pageNum = baseQuery.getOffset() / baseQuery.getLimit() + 1;
		BootTablePage bootTablePage = new BootTablePage();
		RepairExample repairExample = new RepairExample();
		List<RepairDto> repairDtoList = new ArrayList<RepairDto>();
		PageHelper.startPage(pageNum, baseQuery.getLimit());
		List<Repair> repairList = repairMapper.selectByExample(repairExample);
		Integer numberId = 0;
		for (Repair list : repairList) {
			LaboratoryExample laboratoryExample = new LaboratoryExample();
			com.lims.core.pojo.LaboratoryExample.Criteria laboratoryCriteria = laboratoryExample.createCriteria();
			RepairDto repairDto = new RepairDto();
			numberId++;
			laboratoryCriteria.andLaboratoryIdEqualTo(list.getLaboratoryId());
			List<Laboratory> laboratoryList = laboratoryMapper.selectByExample(laboratoryExample);
			repairDto.setNumberId(numberId);
			repairDto.setRepairId(list.getRepairId());
			repairDto.setEquipmentId(list.getEquipmentId());
			repairDto.setProblem(list.getProblem());
			repairDto.setLocation(laboratoryList.get(0).getLocation());
			repairDto.setRoomId(laboratoryList.get(0).getRoomId());
			if (list.getRepairStatus() == 0) {
				repairDto.setRepairStatus("未处理");
			} else if (list.getRepairStatus() == 1) {
				repairDto.setRepairStatus("处理中");
			} else {
				repairDto.setRepairStatus("完成");
			}
			repairDtoList.add(repairDto);
		}
		PageInfo<Repair> pageInfo = new PageInfo<>(repairList);
		bootTablePage.setRows(repairDtoList);
		bootTablePage.setTotal(pageInfo.getTotal());
		return bootTablePage;
	}

	// 处理
	public void dealRepair(Integer repairId) {
		Repair repair = repairMapper.selectByPrimaryKey(repairId);
		repair.setRepairStatus(1);
		repairMapper.updateByPrimaryKey(repair);
	}

	// 完成
	public void comRepair(Integer repairId) {
		Repair repair = repairMapper.selectByPrimaryKey(repairId);
		repair.setRepairStatus(2);
		repairMapper.updateByPrimaryKey(repair);
	}
}
