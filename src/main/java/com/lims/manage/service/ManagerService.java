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
import com.lims.core.dto.server.ManagerDto;
import com.lims.core.dto.server.ManagerQuery;
import com.lims.core.mapper.ManagerMapper;
import com.lims.core.pojo.Manager;
import com.lims.core.pojo.ManagerExample;
import com.lims.core.pojo.ManagerExample.Criteria;

@Service
public class ManagerService {
	@Autowired
	private ManagerMapper managerMapper;

	// 查询列表
	public BootTablePage getManagerList(ManagerQuery managerQuery) {
		if (Validator.isNotNullOrEmpty(managerQuery));
		int pageNum = managerQuery.getOffset() / managerQuery.getLimit() + 1;
		BootTablePage bootTablePage = new BootTablePage();
		ManagerExample managerExample = new ManagerExample();
		Integer numberId = 0;
		Criteria criteria = managerExample.createCriteria();
		PageHelper.startPage(pageNum, managerQuery.getLimit());
		criteria.andDelFlagEqualTo(0);
		if (Validator.isNotNullOrEmpty(managerQuery.getAccount())) {
			criteria.andAccountLike("%" + managerQuery.getAccount() + "%");
		}
		List<Manager> managerList = managerMapper.selectByExample(managerExample);
		List<ManagerDto> managerDtoList = new ArrayList<ManagerDto>();
		for (Manager list : managerList) {
			numberId++;
			ManagerDto managerDto = new ManagerDto();
			managerDto.setNumberId(numberId);
			managerDto.setManagerId(list.getManagerId());
			managerDto.setAccount(list.getAccount());
			managerDto.setmPassword(list.getmPassword());
			if (list.getPermission() == 0) {
				managerDto.setPermission("普通管理员");
			} else {
				managerDto.setPermission("超级管理员");
			}

			managerDtoList.add(managerDto);
		}
		PageInfo<Manager> pageInfo = new PageInfo<>(managerList);
		bootTablePage.setRows(managerDtoList);
		bootTablePage.setTotal(pageInfo.getTotal());
		return bootTablePage;
	}

	public void saveManager(ManagerDto managerDto) {
		// 编辑
		if (Validator.isNotNullOrEmpty(managerDto.getManagerId())) {
			Manager manager = managerMapper.selectByPrimaryKey(managerDto.getManagerId());
			BeanUtils.copyProperties(managerDto, manager);
			managerMapper.updateByPrimaryKey(manager);
		} else {
			// 新增
			Manager manager = new Manager();
			BeanUtils.copyProperties(managerDto, manager);
			manager.setDelFlag(0);
			manager.setPermission(Integer.valueOf(managerDto.getPermission()));
			managerMapper.insert(manager);
		}
	}

	// 根据id获取
	public ManagerDto getManager(Integer managerId) {
		Manager manager = managerMapper.selectByPrimaryKey(managerId);
		ManagerDto managerDto = new ManagerDto();
		BeanUtils.copyProperties(manager, managerDto);
		if (manager.getPermission() == 0) {
			managerDto.setPermission("0");
		} else {
			managerDto.setPermission("1");
		}
		return managerDto;
	}

	// 删除
	public void deleteManager(Integer managerId) {
		Manager manager = managerMapper.selectByPrimaryKey(managerId);
		manager.setDelFlag(1);
		managerMapper.updateByPrimaryKey(manager);
	}
}
