package com.lims.customer.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lims.core.dto.server.UserDto;
import com.lims.core.mapper.UserMapper;
import com.lims.core.pojo.User;

@Service
public class CUserService {
	@Autowired
	private UserMapper userMapper;

	public void saveUser(UserDto userDto) {
		User userNew = userMapper.selectByPrimaryKey(userDto.getNumber());
		// 编辑
		if (userNew != null) {
			User user = userMapper.selectByPrimaryKey(userDto.getNumber());
			userDto.setPassword(user.getPassword());
			BeanUtils.copyProperties(userDto, user);
			userMapper.updateByPrimaryKey(user);
		} else {
			// 新增
			User user = new User();
			BeanUtils.copyProperties(userDto, user);
			user.setDelFlag(0);
			user.setuStatus(0);
			user.setSign(Integer.valueOf(userDto.getSign()));
			userMapper.insert(user);
		}
	}

	// 修改密码
	public Integer changePassword(UserDto userDto, HttpServletRequest request) {
		HttpSession session = request.getSession();
		// 从session中获取用户id
		Object number = session.getAttribute("number");
		User user = userMapper.selectByPrimaryKey((String) number);
		// 判断原密码是否正确
		if (userDto.getPassword().equals(user.getPassword())) {
			if (userDto.getNewPassword().equals(user.getPassword())) {
				// 原密码和新密码一样
				return 2;
			} else {
				user.setNumber((String) number);
				user.setPassword(userDto.getNewPassword());
				userMapper.updateByPrimaryKey(user);
				return 0;
			}
		}
		// 原密码错误
		return 1;
	}

	// 根据id获取
	public UserDto getUser(String number) {
		User user = userMapper.selectByPrimaryKey(number);
		UserDto userDto = new UserDto();
		BeanUtils.copyProperties(user, userDto);
		if (user.getSign() == 0) {
			userDto.setSign("0");
		} else {
			userDto.setSign("1");
		}
		if (user.getSex() == 0) {
			userDto.setSex("0");
		} else {
			userDto.setSex("1");
		}
		return userDto;
	}

	// 删除：注销用户
	public void deleteUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Object number = session.getAttribute("number");
		User user = userMapper.selectByPrimaryKey((String) number);
		user.setDelFlag(1);
		userMapper.updateByPrimaryKey(user);
	}
}
