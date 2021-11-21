package com.spring.more.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.more.project.model.service.WishListService;
import com.spring.more.project.model.vo.WishListVO;
import com.spring.more.project.model.vo.WishProVO;

@Controller
public class WishListAjaxController {

	@Autowired
	private WishListService wishListService;
	
	@RequestMapping("/getWishList.do")
	@ResponseBody
	public List<WishProVO> getAjaxWishlist(WishProVO wpvo) {
		System.out.println("WishListAjaxController getAjaxWishlist LINE 30: "+wpvo.getUser_no());
		
		List<WishProVO> wishlist = wishListService.getWishList(wpvo);
		
		System.out.println(wishlist);
		return wishlist;
	}
	// 좋아요 조회
	@RequestMapping(value="/getOneWishList.do", method=RequestMethod.POST)
	@ResponseBody
	public WishListVO getOneAjaxWishList(WishListVO wvo) {
		System.out.println("\">>> 컨트롤러 getWishList 조회중...\"");
		return wishListService.checkWishlist(wvo);
	} 
}
