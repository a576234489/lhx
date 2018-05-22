package com.qysgps.waterdma.controller.realdata;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qysgps.waterdma.util.HttpUtil;
@Controller
@RequestMapping("/MonitorInfo/RealData")
public class RealDataController {
	
	@RequestMapping()
	public String toRealData(){
		return "dataAnalyze/monitorInfo/index";
	}
	@RequestMapping(value="/GetListJson",produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object getListJson(boolean _search,String nd,int rows,int page,String sidx,String sord){
		String url = "http://www.qysgps.com:1111/MonitorInfo/RealData/GetListJson?_search="
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
