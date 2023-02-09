package com.green.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.service.BoardService;
import com.green.service.ProductService;
import com.green.service.SignInService;
import com.green.vo.BoardVO;
import com.green.vo.ManagerVO;
import com.green.vo.MemberVO;
import com.green.vo.ProductVO;

@Controller
public class MainController {
	
	@Autowired
	private SignInService signInService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private ProductService productService;
	
	
	@RequestMapping("/")
	public String main(HttpSession session, Model model) {
		MemberVO member = (MemberVO)session.getAttribute("user");
		if(member != null) {
			session.setAttribute("user", signInService.getMember(member.getId()));
		}
		
		List<BoardVO> list = boardService.selectAll();
		List<ManagerVO> manager = boardService.selectAllmanager();
		List<ProductVO> hotProducts = productService.selectAllAuctionByFilter("readCount");
		List<ProductVO> newProducts = productService.selectAllAuctionByFilter("num");
		ProductVO[] hotProductArr = new ProductVO[4];
		ProductVO[] newProductArr = new ProductVO[4];
		for(int i=0; i<4; i++) {
			if(hotProducts.get(i).getProductPic().contains(",")) {
				String[] arr = hotProducts.get(i).getProductPic().split(",");
				hotProducts.get(i).setProductPic(arr[0]);
			}
			if(newProducts.get(i).getProductPic().contains(",")) {
				String[] arr = newProducts.get(i).getProductPic().split(",");
				newProducts.get(i).setProductPic(arr[0]);
			}
			hotProductArr[i]=(hotProducts.get(i));
			newProductArr[i]=(newProducts.get(i));
		}
		model.addAttribute("manager", manager);
		model.addAttribute("list",list);
		model.addAttribute("hotProductArr", hotProductArr);
		model.addAttribute("newProductArr", newProductArr);
		
		return "index";
	}

	
	
}
