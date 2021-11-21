package com.spring.more.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.more.project.model.service.WishListService;
import com.spring.more.project.model.vo.WishListVO;

@Controller
@SessionAttributes("wish")
public class WishListController {

	@Autowired
	private WishListService wishListService;
	
	public WishListController() {
		System.out.println("--->> WishListController() 객체생성");
	}
	
	// 좋아요♡ 
	@RequestMapping(value="/wishlistInsert.do", method = RequestMethod.POST)
	public String insertWishList(WishListVO wvo) { 
		System.out.println(">>> 컨트롤러 wishlistInsert 실행");		
		wishListService.insertWishList(wvo);
		return "project.jsp";
	}
	
	// 안 좋아요♥
	@RequestMapping("/wishlistDelete.do")
	public String deleteWishList(WishListVO wvo) {
		System.out.println(">>> 컨트롤러 wishlistDelete 실행");
		wishListService.deleteWishList(wvo);
		return "project.jsp";
	}
}
