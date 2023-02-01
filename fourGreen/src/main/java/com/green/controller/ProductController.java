package com.green.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.green.service.ChargePointService;
import com.green.service.ProductService;
import com.green.vo.CustomerVO;
import com.green.vo.MemberVO;
import com.green.vo.ProductVO;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private ChargePointService chargePointService;
	
	@RequestMapping("/product")
	public String main(Model model, @RequestParam(required = false) String category, @RequestParam(required = false) String filter, @RequestParam(required = false) String sort,
						@RequestParam(required = false) String searchCate, @RequestParam(required = false) String searchText, @RequestParam(required = false) String end,
						@RequestParam(required = false) String pageNum) {
		String category2 = "";
		String filter2 = "";
		String sort2 = "";
		String end2 = "";
		
		if(category != null) {
			category2 = "category="+category+"&";
		}
		if(filter != null) {
			filter2 = "filter="+filter+"&";
		}
		if(sort != null) {
			sort2 = "sort="+sort+"&";
		}
		if(end != null) {
			end2 = "end="+end+"&";
		}
		
		String url2 = category2+filter2+sort2+end2;
		model.addAttribute("url",url2);
		
		int totalCnt = 0;
		int pageNum2 = pageNum == null? 1 : Integer.parseInt(pageNum);
		int startNum = (pageNum2-1)*9+1;
		List<ProductVO> list = null;
		
		totalCnt = productService.selectAllNumAuction();
		
		if(category != null) {
			totalCnt = productService.selectAllNumAuctionByCategory(category);
		}
		if(end != null && end.equals("1")) {
			end = "<";
		}else if(end != null && end.equals("2")){
			end = ">";
		}
		
		list = productService.selectTargetAuctionByPaging(category, filter, sort, startNum, end);
		
		if(searchText != null) {
			list = productService.search(searchCate, searchText);
			totalCnt = list.size();
		}
		
		int totalPage = (totalCnt-1)/9+1;                                                                   
		int startPage = ((pageNum2-1)/9)*10+1;                                                               
		int endPage = totalPage <  startPage+9 ? totalPage: startPage+9;                                     
		System.out.println(totalCnt+"* / "+pageNum2+" / "+startNum+ " / "+totalPage+" / "+startPage+" / "+endPage);
		
		model.addAttribute("category", category);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageNum", pageNum2);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("list", list);
		
		return "product/productList";
	}
	
	@RequestMapping("/selectOne")
	public String selectOne(@RequestParam int num, Model model) {
		productService.readCount(num);
		ProductVO dto = productService.selectOne(num);
		model.addAttribute("list",productService.selectAllNumAuction());
		model.addAttribute("product",dto);
		if(System.currentTimeMillis()-dto.getRegdate().getTime()>0) {
			return "product/endPage";  
		}
		return "product/productDetail";  
	}
	

	@RequestMapping("/newAuction")
	public String newAuction(HttpSession session) {
		MemberVO m = (MemberVO)session.getAttribute("user");
		if(m != null) {
			return "product/newAuction"; 
		}
		return "redirect:/signInForm";
	}
	
	@PostMapping("/newAuction")
	public String newProduct(HttpSession session, RedirectAttributes attribute, @RequestParam String title,@RequestParam int strPrice,
			@RequestParam String memberId,
			@RequestParam String content,@RequestParam String regdate, @RequestParam String category,
		    @RequestParam MultipartFile[] productPic) throws IllegalStateException, IOException {
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user != null && user.getPoint() >= 1000) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			
			ProductVO dto = new ProductVO();
			dto.setTitle(title);
			dto.setStrPrice(strPrice);
			dto.setMemberId(memberId);
			dto.setContent(content);
			dto.setRegdate(regdate);
			dto.setCategory(category);
			String str = "";
			for(int i =0; i<productPic.length;i++) {
				Calendar dateTime = Calendar.getInstance();
				String uniqueId = sdf.format(dateTime.getTime())+RandomStringUtils.randomAlphanumeric(10);
				String fileName = uniqueId+"_"+productPic[i].getOriginalFilename();
				str += fileName;
				if(i<productPic.length-1) {
					str += ",";
				}
				File file = new File("C:\\UploadImage\\AuctionList",fileName);
				productPic[i].transferTo(file);
			}
			dto.setProductPic(str);
			
			productService.insertProduct(dto);
			chargePointService.updatePointByUserId(user.getId(), 1000);
			
			return "redirect:/product";
		}else {
			attribute.addAttribute("newAuctionMsg","잔액이 부족합니다.");
			return "redirect:/product";
		}
        
	}
	
	@RequestMapping("/deleteProduct")
	public String deleteProduct(int num) {
		productService.deleteProduct(num);
		
		return "redirect:/product";
	}

	@PostMapping("/biding")
	public String biding(int strPrice, CustomerVO cdto, @RequestParam int num, RedirectAttributes attributes) {
		cdto.setNum(num);
		cdto.setBidMoney(strPrice+"");
		cdto.setMemberId("test");
		productService.insertCustomer(cdto);
		attributes.addAttribute("num",num);
		
		return "redirect:/selectOne";
	}
	
	@GetMapping("/one")
	public String direct(@RequestParam int num, RedirectAttributes attributes) {
		productService.direct(num);
		attributes.addAttribute("num",num);
		
		return "redirect:/selectOne";
	}
	
	@GetMapping("/endPage")
	public String endPage() {
		return "product/endPage";
	}
	
	
	
	
}
