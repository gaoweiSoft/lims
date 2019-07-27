package com.lims.manage.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.feilong.core.Validator;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lims.core.dto.BootTablePage;
import com.lims.core.dto.server.LaboratoryDto;
import com.lims.core.dto.server.LaboratoryQuery;
import com.lims.core.mapper.LaboratoryMapper;
import com.lims.core.pojo.Laboratory;
import com.lims.core.pojo.LaboratoryExample;
import com.lims.core.pojo.LaboratoryExample.Criteria;

@Service
public class LaboratoryService {
	@Autowired
	private LaboratoryMapper laboratoryMapper;

	// 查询列表
	public BootTablePage getLaboratoryList(LaboratoryQuery laboratoryQuery) {
		if (Validator.isNotNullOrEmpty(laboratoryQuery));
		int pageNum = laboratoryQuery.getOffset() / laboratoryQuery.getLimit() + 1;
		BootTablePage bootTablePage = new BootTablePage();
		LaboratoryExample laboratoryExample = new LaboratoryExample();
		Integer numberId = 0;
		Criteria criteria = laboratoryExample.createCriteria();
		PageHelper.startPage(pageNum, laboratoryQuery.getLimit());
		criteria.andDelFlagEqualTo(0);
		if (Validator.isNotNullOrEmpty(laboratoryQuery.getLocation())) {
			criteria.andLocationLike("%" + laboratoryQuery.getLocation() + "%");
		}
		List<Laboratory> laboratoryList = laboratoryMapper.selectByExample(laboratoryExample);
		List<LaboratoryDto> laboratoryDtoList = new ArrayList<LaboratoryDto>();
		for (Laboratory list : laboratoryList) {
			numberId++;
			LaboratoryDto laboratoryDto = new LaboratoryDto();
			laboratoryDto.setNumberId(numberId);
			laboratoryDto.setLaboratoryId(list.getLaboratoryId());
			laboratoryDto.setRoomId(list.getRoomId());
			laboratoryDto.setQuantity(list.getQuantity());
			laboratoryDto.setLocation(list.getLocation());
			laboratoryDtoList.add(laboratoryDto);
		}
		PageInfo<Laboratory> pageInfo = new PageInfo<>(laboratoryList);
		bootTablePage.setRows(laboratoryDtoList);
		bootTablePage.setTotal(pageInfo.getTotal());
		return bootTablePage;
	}
	//不分页列表
	public List<LaboratoryDto> getLaboratorys(String value) {
		LaboratoryExample laboratoryExample = new LaboratoryExample();
		Criteria criteria = laboratoryExample.createCriteria();
		criteria.andDelFlagEqualTo(0);
		if (value != null){
			criteria.andLocationEqualTo(value);
		}		
		List<Laboratory> laboratoryList = laboratoryMapper.selectByExample(laboratoryExample);
		List<LaboratoryDto> laboratoryDtoList = new ArrayList<LaboratoryDto>();
		for (Laboratory list : laboratoryList) {
			LaboratoryDto laboratoryDto = new LaboratoryDto();
			laboratoryDto.setLaboratoryId(list.getLaboratoryId());
			laboratoryDto.setRoomId(list.getRoomId());
			laboratoryDto.setQuantity(list.getQuantity());
			laboratoryDto.setLocation(list.getLocation());
			laboratoryDtoList.add(laboratoryDto);
		}
		return laboratoryDtoList;
	}

	public void saveLaboratory(LaboratoryDto laboratoryDto) {
		// 编辑
		if (Validator.isNotNullOrEmpty(laboratoryDto.getLaboratoryId())) {
			Laboratory laboratory = laboratoryMapper.selectByPrimaryKey(laboratoryDto.getLaboratoryId());
			BeanUtils.copyProperties(laboratoryDto, laboratory);
			laboratoryMapper.updateByPrimaryKey(laboratory);
		} else {
			// 新建
			Laboratory laboratory = new Laboratory();
			BeanUtils.copyProperties(laboratoryDto, laboratory);
			laboratory.setDelFlag(0);
			laboratory.setQuantity(0);
			laboratoryMapper.insert(laboratory);
		}
	}

	// 获取id
	public LaboratoryDto getLaboratory(Integer laboratoryId) {
		Laboratory laboratory = laboratoryMapper.selectByPrimaryKey(laboratoryId);
		LaboratoryDto laboratoryDto = new LaboratoryDto();
		BeanUtils.copyProperties(laboratory, laboratoryDto);
		return laboratoryDto;
	}

	// 删除
	public void deleteLaboratory(Integer laboratoryId) {
		Laboratory laboratory = laboratoryMapper.selectByPrimaryKey(laboratoryId);
		laboratory.setDelFlag(1);
		laboratoryMapper.updateByPrimaryKey(laboratory);
	}
}
