package com.qysgps.waterdma.controller.nightflowanalyze;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qysgps.waterdma.util.HttpUtil;

@Controller
public class NightFlowAnalyzeController {
	
	@RequestMapping("/LeakageAnalyze/NightFlowAnalyze")
	public String toNightFlowAnalyze(){
		return "dataAnalyze/leakageAnalyze/night";
	}
	@RequestMapping(value="/LeakageConfig/ARM_Area/GetTreeJson",produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object GetTreeJson(){
		String treeJson = HttpUtil.doGet("http://www.qysgps.com:1111/LeakageConfig/ARM_Area/GetTreeJson");
		return treeJson;
	}
	@RequestMapping(value="/LeakageAnalyze/NightFlowAnalyze/GetPageListJson")
	@ResponseBody
	public Object GetPageListJson(String queryJson,boolean _search,String nd,int rows,int page,String sidx,String sord){
		queryJson = queryJson.replaceAll("\\}", "%7D").replaceAll("\\{", "%7B").replaceAll("\"", "%22").replaceAll(":", "%3A").replaceAll(",", "%2C");
		sidx =sidx.replace(" ", "+");
		String url = "http://www.qysgps.com:1111/LeakageAnalyze/NightFlowAnalyze/GetPageListJson?queryJson="
				+queryJson+
				"&_search="
				+_search+
				"&nd="
				+nd+
				"&rows="
				+rows+
				"&page="
				+page+
				"&sidx="
				+sidx+
				"&sord="
				+sord;
		String listJson = HttpUtil.doGet(url);
		return listJson;
	}
	
}
