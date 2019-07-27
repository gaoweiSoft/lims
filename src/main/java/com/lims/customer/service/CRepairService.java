package com.lims.customer.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lims.core.dto.server.RepairDto;
import com.lims.core.mapper.LaboratoryMapper;
import com.lims.core.mapper.RepairMapper;
import com.lims.core.pojo.Laboratory;
import com.lims.core.pojo.LaboratoryExample;
import com.lims.core.pojo.Repair;

@Service
public class CRepairService {
	@Autowired
	private RepairMapper repairMapper;
	@Autowired
	private LaboratoryMapper laboratoryMapper;

	// 新增
	public void saveRepair(RepairDto repairDto) {
		Repair repair = new Repair();
		// 根据实验室位置和房间号查询laboratoryId
		LaboratoryExample laboratoryExample = new LaboratoryExample();
		com.lims.core.pojo.LaboratoryExample.Criteria criteria = laboratoryExample.createCriteria();
		criteria.andLocationEqualTo(repairDto.getLocation());
		criteria.andRoomIdEqualTo(repairDto.getRoomId());
		List<Laboratory> laboratoryList = laboratoryMapper.selectByExample(laboratoryExample);
		BeanUtils.copyProperties(repairDto, repair);
		repair.setLaboratoryId(laboratoryList.get(0).getLaboratoryId());
		repair.setRepairStatus(0);
		repairMapper.insert(repair);
	}
}
