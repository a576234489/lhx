package com.qysgps.waterdma.controller.analyzepressday;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AnalyzePressDayController {
	
	@RequestMapping("/pressAnalyze/analyzePressDay")
	public String toAnalyzePressDay(){
		return "dataAnalyze/pressAnalyze/day";
	}

}
