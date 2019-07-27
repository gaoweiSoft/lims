package com.lims.customer.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.lims.core.pojo.Laboratory;
import com.lims.core.pojo.LaboratoryExample;
import com.lims.core.pojo.ApplyExample.Criteria;

@Service
public class CApplyService {
	@Autowired
	private ApplyMapper applyMapper;
	@Autowired
	private LaboratoryMapper laboratoryMapper;

	// 查询列表
	public BootTablePage getApplyList(BaseQuery baseQuery, HttpServletRequest request) {
		if (Validator.isNotNullOrEmpty(baseQuery));
		int pageNum = baseQuery.getOffset() / baseQuery.getLimit() + 1;
		BootTablePage bootTablePage = new BootTablePage();
		ApplyExample applyExample = new ApplyExample();
		List<ApplyDto> applyDtoList = new ArrayList<ApplyDto>();
		Criteria criteria = applyExample.createCriteria();
		PageHelper.startPage(pageNum, baseQuery.getLimit());
		HttpSession session = request.getSession();
		// 从session中获取用户id
		Object number = session.getAttribute("number");
		criteria.andNumberEqualTo((String) number);
		// 判断是否为当前用户的申请记录
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
			//将时间格式化
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

	// 新增
	public void saveApply(ApplyDto applyDto, HttpServletRequest request) {
		Apply apply = new Apply();
		// 根据实验室位置和房间号查询laboratoryId
		LaboratoryExample laboratoryExample = new LaboratoryExample();
		com.lims.core.pojo.LaboratoryExample.Criteria criteria = laboratoryExample.createCriteria();
		criteria.andLocationEqualTo(applyDto.getLocation());
		criteria.andRoomIdEqualTo(applyDto.getRoomId());
		List<Laboratory> laboratoryList = laboratoryMapper.selectByExample(laboratoryExample);
		BeanUtils.copyProperties(applyDto, apply);
		//将时间格式化
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			Date dateStart = sdf.parse(applyDto.getDateStart());
			Date dateEnd = sdf.parse(applyDto.getDateEnd());
			apply.setDateStart(dateStart);
			apply.setDateEnd(dateEnd);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		apply.setLaboratoryId(laboratoryList.get(0).getLaboratoryId());
		apply.setaStatus(0);
		HttpSession session = request.getSession();
		// 从session中获取用户id
		Object number = session.getAttribute("number");
		apply.setNumber((String) number);
		applyMapper.insert(apply);
	}
}
