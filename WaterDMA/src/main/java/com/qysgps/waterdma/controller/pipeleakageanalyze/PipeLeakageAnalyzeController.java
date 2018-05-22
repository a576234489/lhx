package com.qysgps.waterdma.controller.pipeleakageanalyze;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PipeLeakageAnalyzeController {
	
	@RequestMapping("/leakageAnalyze/pipeLeakageAnalyze")
	public String toPipeLeakageAnalyze(){
		return "dataAnalyze/leakageAnalyze/pipe";
	}
}
