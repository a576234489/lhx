package com.qysgps.waterdma.controller.analyzeflowday;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AnalyzeFlowDayController {
	
	@RequestMapping("/flowAnalyze/analyzeFlowDay")
	public String toAnalyzeFlowDay(){
		return "dataAnalyze/flowAnalyze/day";
	}
	
}
