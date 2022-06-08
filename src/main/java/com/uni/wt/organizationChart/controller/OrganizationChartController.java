package com.uni.wt.organizationChart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrganizationChartController {
	
	@RequestMapping("organizationChart.do")
	public String organizationChart() {
		return "/organizationChart/organizationChartView";
	}
}
