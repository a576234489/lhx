package com.qysgps.waterdma.controller.leakagesortanalyze;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qysgps.waterdma.util.HttpUtil;

@Controller
@RequestMapping("/LeakageAnalyze/LeakageSortAnalyze")
public class LeakageSortAnalyzeController {
	
	@RequestMapping()
	public String toLeakageSortAnalyze(){
		return "dataAnalyze/leakageAnalyze/sort";
	}
	@RequestMapping(value="/GetListJson",produces="application/json;charset=UTF-8")
	@ResponseBody
	public String getListJson(String queryJson,boolean _search,String nd,int rows,int page,String sidx,String sord){
		queryJson = queryJson.replaceAll("\\}", "%7D").replaceAll("\\{", "%7B").replaceAll("\"", "%22").replaceAll(":", "%3A").replaceAll(",", "%2C");
		String url = "http://www.qysgps.com:1111/LeakageAnalyze/LeakageSortAnalyze/GetListJson?queryJson="
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
