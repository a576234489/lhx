package com.qysgps.waterdma.controller.historydata;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HistoryDataController {
	
	@RequestMapping("/leakageQuery/historyData")
	public String toHistoryData(){
		return "dataAnalyze/leakageQuery/historyData";
	}

}
