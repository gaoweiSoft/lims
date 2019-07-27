package com.lims.customer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customer/")
public class CPageController {
	// 主页
	@RequestMapping("indexUI.shtml")
	public String indexUI() {
		return "customer/index";
	}

	// 登陆页
	@RequestMapping("loginUI.shtml")
	public String loginUI() {
		return "customer/login";
	}

	// 物理实验室规则
	@RequestMapping("rule/physicalUI.shtml")
	public String physicalUI() {
		return "customer/rule/physical";
	}

	// 化学实验室规则
	@RequestMapping("rule/chemistryUI.shtml")
	public String chemistryUI() {
		return "customer/rule/chemistry";
	}

	// 生物实验室规则
	@RequestMapping("rule/biologyUI.shtml")
	public String biologyUI() {
		return "customer/rule/biology";
	}

	// 实验室守则
	@RequestMapping("rule/laboratoryUI.shtml")
	public String laboratoryUI() {
		return "customer/rule/laboratory";
	}

	// 模拟电路实验室介绍
	@RequestMapping("introduce/simulationUI.shtml")
	public String simulationUI() {
		return "customer/introduce/simulation";
	}

	// 数字电路实验室介绍
	@RequestMapping("introduce/digitalUI.shtml")
	public String digitalUI() {
		return "customer/introduce/digital";
	}

	// EDA电路实验室介绍
	@RequestMapping("introduce/EDAUI.shtml")
	public String EDAUI() {
		return "customer/introduce/eda";
	}
}
