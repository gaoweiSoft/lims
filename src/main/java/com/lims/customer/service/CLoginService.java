package com.lims.customer.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lims.core.mapper.UserMapper;
import com.lims.core.pojo.User;
import com.lims.core.pojo.UserExample;
import com.lims.core.pojo.UserExample.Criteria;

@Service

public class CLoginService {
	@Autowired
	private UserMapper userMapper;

	public Integer checkUser(User user, HttpServletRequest request) {

		User userNew = userMapper.selectByPrimaryKey(user.getNumber());
		
		if (userNew != null && userNew.getDelFlag() != 1 && userNew.getuStatus() == 1) {
			// 用户存在
			UserExample userExample = new UserExample();
			Criteria criteria = userExample.createCriteria();
			criteria.andNumberEqualTo(user.getNumber());
			criteria.andPasswordEqualTo(user.getPassword());
			List<User> userList = userMapper.selectByExample(userExample);
			if (userList == null || userList.size() == 0) {
				// 密码错误
				return 1;
			} else {
				// 用户名密码正确
				HttpSession session = request.getSession();
				// 将数据存储到session中
				session.setAttribute("number", user.getNumber());
				return 2;
			}
		}
		return 0;
	}
}
