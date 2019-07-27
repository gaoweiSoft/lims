package com.lims.manage.service;

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
import com.lims.core.dto.server.UserDto;
import com.lims.core.mapper.UserMapper;
import com.lims.core.pojo.User;
import com.lims.core.pojo.UserExample;
import com.lims.core.pojo.UserExample.Criteria;

@Service
public class UserService {
	@Autowired
	private UserMapper userMapper;

	// 查询列表
	public BootTablePage getUserList(BaseQuery baseQuery) {
		if (Validator.isNotNullOrEmpty(baseQuery));
		int pageNum = baseQuery.getOffset() / baseQuery.getLimit() + 1;
		BootTablePage bootTablePage = new BootTablePage();
		UserExample userExample = new UserExample();
		Integer numberId = 0;
		Criteria criteria = userExample.createCriteria();
		PageHelper.startPage(pageNum, baseQuery.getLimit());
		criteria.andUStatusEqualTo(0);
		List<User> userList = userMapper.selectByExample(userExample);
		List<UserDto> userDtoList = new ArrayList<UserDto>();
		for (User list : userList) {
			UserDto userDto = new UserDto();
			numberId++;
			userDto.setNumber(list.getNumber());
			userDto.setNumberId(numberId);
			userDto.setCollege(list.getCollege());
			userDto.setSchool(list.getSchool());
			if (list.getSign() == 0) {
				userDto.setSign("学生");
			} else {
				userDto.setSign("教师");
			}
			if (list.getuStatus() == 0) {
				userDto.setuStatus("未处理");
			} else if (list.getuStatus() == 1) {
				userDto.setuStatus("同意");
			} else {
				userDto.setuStatus("拒绝");
			}
			userDtoList.add(userDto);
		}
		PageInfo<User> pageInfo = new PageInfo<>(userList);
		bootTablePage.setRows(userDtoList);
		bootTablePage.setTotal(pageInfo.getTotal());
		return bootTablePage;
	}

	// 查询所有用户列表
	public BootTablePage getAllUserList(BaseQuery baseQuery) {
		if (Validator.isNotNullOrEmpty(baseQuery))
			;
		int pageNum = baseQuery.getOffset() / baseQuery.getLimit() + 1;
		BootTablePage bootTablePage = new BootTablePage();
		UserExample userExample = new UserExample();
		Integer numberId = 0;
		PageHelper.startPage(pageNum, baseQuery.getLimit());
		List<User> userList = userMapper.selectByExample(userExample);
		List<UserDto> userDtoList = new ArrayList<UserDto>();
		for (User list : userList) {
			UserDto userDto = new UserDto();
			numberId++;
			userDto.setNumber(list.getNumber());
			userDto.setNumberId(numberId);
			userDto.setCollege(list.getCollege());
			userDto.setSchool(list.getSchool());
			if (list.getSign() == 0) {
				userDto.setSign("学生");
			} else {
				userDto.setSign("教师");
			}
			if (list.getuStatus() == 0) {
				userDto.setuStatus("未处理");
			} else if (list.getuStatus() == 1) {
				userDto.setuStatus("同意");
			} else {
				userDto.setuStatus("拒绝");
			}
			userDtoList.add(userDto);
		}
		PageInfo<User> pageInfo = new PageInfo<>(userList);
		bootTablePage.setRows(userDtoList);
		bootTablePage.setTotal(pageInfo.getTotal());
		return bootTablePage;
	}

	// 根据id查到对应客户信息：详情页
	public UserDto viewUser(String number) {
		User user = userMapper.selectByPrimaryKey(number);
		UserDto userDto = new UserDto();
		BeanUtils.copyProperties(user, userDto);
		if (user.getSign() == 0) {
			userDto.setSign("学生");
		} else {
			userDto.setSign("教师");
		}
		if (user.getuStatus() == 0) {
			userDto.setuStatus("未处理");
		} else if (user.getuStatus() == 1) {
			userDto.setuStatus("同意");
		} else {
			userDto.setuStatus("拒绝");
		}
		if (user.getSex() == 0) {
			userDto.setSex("男");
		} else {
			userDto.setSex("女");
		}
		return userDto;
	}

	// 同意
	public void agreeUser(String number) {
		User user = userMapper.selectByPrimaryKey(number);
		user.setuStatus(1);
		userMapper.updateByPrimaryKey(user);
	}

	// 拒绝
	public void refuseUser(String number) {
		User user = userMapper.selectByPrimaryKey(number);
		user.setuStatus(2);
		userMapper.updateByPrimaryKey(user);
	}
	// 重置密码
		public void resetUser(String number) {
			User user = userMapper.selectByPrimaryKey(number);
			user.setPassword("123456");
			userMapper.updateByPrimaryKey(user);
		}
}
