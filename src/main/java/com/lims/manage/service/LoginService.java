package com.lims.manage.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lims.core.mapper.ManagerMapper;
import com.lims.core.pojo.Manager;
import com.lims.core.pojo.ManagerExample;
import com.lims.core.pojo.ManagerExample.Criteria;

@Service
public class LoginService {
	@Autowired
	private ManagerMapper managerMapper;

	public Integer checkUser(Manager manager, HttpServletRequest request) {
		ManagerExample managerExample = new ManagerExample();
		Criteria criteria = managerExample.createCriteria();
		criteria.andAccountEqualTo(manager.getAccount());
		List<Manager> managerListNew = managerMapper.selectByExample(managerExample);
		// 编辑
		if ((managerListNew != null && managerListNew.size() != 0) && managerListNew.get(0).getDelFlag() != 1) {
			// 用户存在
			criteria.andAccountEqualTo(manager.getAccount());
			criteria.andMPasswordEqualTo(manager.getmPassword());
			List<Manager> managerList = managerMapper.selectByExample(managerExample);
			if (managerList == null || managerList.size() == 0) {
				// 密码错误
				return 1;
			} else {
				// 用户名密码正确
				HttpSession session = request.getSession();
				// 将数据存储到session中
				session.setAttribute("managerId", managerList.get(0).getManagerId());
				return 2;
			}
		}
		return 0;
	}
}
