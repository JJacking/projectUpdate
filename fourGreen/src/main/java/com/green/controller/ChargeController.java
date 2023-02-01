package com.green.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.service.ChargePointService;
import com.green.vo.ChargeVO;

@Controller
public class ChargeController {
	
	@Autowired
	private ChargePointService chargePointService;
	
	@GetMapping("/charge")
	public String charge() {
		return "member/chargePage";
	}
	
	
	@PostMapping("/requestCharge")
	public String requestCharge(@RequestParam String id,@RequestParam long charge) {
		chargePointService.requestChargePoint(id,charge);
		return "member/index";
	}
	
	@GetMapping("/userChargeList")
	public String userChargeList(Model model,@RequestParam(required = false) String num) {
		int totalCount = chargePointService.getTotalCount();
		int pageNum = num == null ? 1:Integer.parseInt(num);
		int startPage = ((pageNum-1)/5)*5+1;
		int totalPage = ((totalCount-1)/10)+1;
		int endPage = totalPage < startPage+4 ? totalPage : startPage+4;
		int startNum = (pageNum-1)*10+1;
		
		List<ChargeVO> list = chargePointService.getChargeListWithPaging(startNum);
		
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("list", list);
		
		return "member/userChargeList";
	}
	
	@PostMapping("/chargePoint")
	@ResponseBody
	public String chargePoint(String email, long point, int idx) {
		System.out.println("chargePoint");
		String data = "";
		ChargeVO vo = chargePointService.getChargeInfoByIdx(idx);
		System.out.println(idx+"/"+vo.getResult());
		if(vo.getResult() == 0) {
			int chargePointResult = chargePointService.chargePointByUserId(email, point);
			if(chargePointResult == 1) {
				int result = chargePointService.chargeSuccess(idx);
				if(result == 1) {
					data="success";
				}
			}
		}else {
			data="already";
		}
		return data;
	}
	
	
}
