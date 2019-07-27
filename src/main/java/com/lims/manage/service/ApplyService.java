package com.lims.manage.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.feilong.core.Validator;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lims.core.dto.BaseQuery;
import com.lims.core.dto.BootTablePage;
import com.lims.core.dto.server.ApplyDto;
import com.lims.core.mapper.ApplyMapper;
import com.lims.core.mapper.LaboratoryMapper;
import com.lims.core.pojo.Apply;
import com.lims.core.pojo.ApplyExample;
import com.lims.core.pojo.ApplyExample.Criteria;
import com.lims.core.pojo.Laboratory;
import com.lims.core.pojo.LaboratoryExample;

@Service
public class ApplyService {
	@Autowired
	private ApplyMapper applyMapper;
	@Autowired
	private LaboratoryMapper laboratoryMapper;

	// 查询列表
	public BootTablePage getApplyList(BaseQuery baseQuery) {
		if (Validator.isNotNullOrEmpty(baseQuery))
			;
		int pageNum = baseQuery.getOffset() / baseQuery.getLimit() + 1;
		BootTablePage bootTablePage = new BootTablePage();
		ApplyExample applyExample = new ApplyExample();
		List<ApplyDto> applyDtoList = new ArrayList<ApplyDto>();
		Criteria criteria = applyExample.createCriteria();
		PageHelper.startPage(pageNum, baseQuery.getLimit());
		criteria.andAStatusEqualTo(0);
		List<Apply> applyList = applyMapper.selectByExample(applyExample);
		Integer numberId = 0;
		for (Apply list : applyList) {
			LaboratoryExample laboratoryExample = new LaboratoryExample();
			com.lims.core.pojo.LaboratoryExample.Criteria laboratoryCriteria = laboratoryExample.createCriteria();
			ApplyDto applyDto = new ApplyDto();
			numberId++;
			laboratoryCriteria.andLaboratoryIdEqualTo(list.getLaboratoryId());
			List<Laboratory> laboratoryList = laboratoryMapper.selectByExample(laboratoryExample);
			applyDto.setApplyId(list.getApplyId());
			applyDto.setEquipmentId(list.getEquipmentId());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			applyDto.setDateStart(sdf.format(list.getDateStart()));
			applyDto.setDateEnd(sdf.format(list.getDateEnd()));
			applyDto.setNumberId(numberId);
			if (list.getaStatus() == 0) {
				applyDto.setaStatus("未处理");
			} else if (list.getaStatus() == 1) {
				applyDto.setaStatus("同意");
			} else {
				applyDto.setaStatus("拒绝");
			}
			applyDto.setLocation(laboratoryList.get(0).getLocation());
			;
			applyDto.setRoomId(laboratoryList.get(0).getRoomId());
			applyDtoList.add(applyDto);
		}
		PageInfo<Apply> pageInfo = new PageInfo<>(applyList);
		bootTablePage.setRows(applyDtoList);
		bootTablePage.setTotal(pageInfo.getTotal());
		return bootTablePage;
	}

	// 查询所有申请列表
	public BootTablePage getAllApplyList(BaseQuery baseQuery) {
		if (Validator.isNotNullOrEmpty(baseQuery));
		int pageNum = baseQuery.getOffset() / baseQuery.getLimit() + 1;
		BootTablePage bootTablePage = new BootTablePage();
		ApplyExample applyExample = new ApplyExample();
		List<ApplyDto> applyDtoList = new ArrayList<ApplyDto>();
		Integer numberId = 0;
		PageHelper.startPage(pageNum, baseQuery.getLimit());
		List<Apply> applyList = applyMapper.selectByExample(applyExample);
		for (Apply list : applyList) {
			LaboratoryExample laboratoryExample = new LaboratoryExample();
			com.lims.core.pojo.LaboratoryExample.Criteria laboratoryCriteria = laboratoryExample.createCriteria();
			numberId++;
			ApplyDto applyDto = new ApplyDto();
			laboratoryCriteria.andLaboratoryIdEqualTo(list.getLaboratoryId());
			List<Laboratory> laboratoryList = laboratoryMapper.selectByExample(laboratoryExample);
			applyDto.setApplyId(list.getApplyId());
			applyDto.setEquipmentId(list.getEquipmentId());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			applyDto.setDateStart(sdf.format(list.getDateStart()));
			applyDto.setDateEnd(sdf.format(list.getDateEnd()));
			applyDto.setNumberId(numberId);
			if (list.getaStatus() == 0) {
				applyDto.setaStatus("未处理");
			} else if (list.getaStatus() == 1) {
				applyDto.setaStatus("同意");
			} else {
				applyDto.setaStatus("拒绝");
			}
			applyDto.setLocation(laboratoryList.get(0).getLocation());
			applyDto.setRoomId(laboratoryList.get(0).getRoomId());
			applyDtoList.add(applyDto);
		}

		PageInfo<Apply> pageInfo = new PageInfo<>(applyList);
		bootTablePage.setRows(applyDtoList);
		bootTablePage.setTotal(pageInfo.getTotal());
		return bootTablePage;
	}

	// 根据id查到对应客户信息
	public ApplyDto getApply(Integer applyId) {
		Apply apply = applyMapper.selectByPrimaryKey(applyId);
		ApplyDto applyDto = new ApplyDto();
		BeanUtils.copyProperties(apply, applyDto);
		return applyDto;
	}

	// 同意
	public void agreeApply(Integer applyId) {
		Apply apply = applyMapper.selectByPrimaryKey(applyId);
		apply.setaStatus(1);
		applyMapper.updateByPrimaryKey(apply);
	}

	// 拒绝
	public void refuseApply(Integer applyId) {
		Apply apply = applyMapper.selectByPrimaryKey(applyId);
		apply.setaStatus(2);
		applyMapper.updateByPrimaryKey(apply);
	}
}
