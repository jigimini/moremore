package com.spring.more.project.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.more.project.model.dao.WishListDAO;
import com.spring.more.project.model.vo.WishListVO;
import com.spring.more.project.model.vo.WishProVO;

@Service("wishListService")
public class WishListServiceImpl implements WishListService {

	@Autowired
	private WishListDAO wishlistDAO;
	
	public WishListServiceImpl() {
		System.out.println(">> WishListServiceImpl() 객체 생성");
	}

	@Override
	public void insertWishList(WishListVO wvo) {
		
		wishlistDAO.insertWishList(wvo);
	}

	@Override
	public void deleteWishList(WishListVO wvo) {
		
		wishlistDAO.deleteWishList(wvo);
	}
	
	@Override
	public List<WishProVO> getWishList() {
		return wishlistDAO.getWishList();
	}
	
	@Override
	public List<WishProVO> getWishList(WishProVO wpvo) {
		System.out.println("WishListServiceImpl - 입력된 데이터 확인하기: "+ wpvo.toString());
		System.out.println("WishListServiceImpl - DB에서 불러온 데이터 확인하기"+wishlistDAO.getWishList(wpvo));
		return wishlistDAO.getWishList(wpvo);
	}
	
	@Override
	public WishListVO checkWishlist(WishListVO wvo) {
		System.out.println("WishListServiceImpl - checkWishlist 입력된 데이터 확인하기: "+ wvo.toString());
		System.out.println("WishListServiceImpl - checkWishlist DB에서 불러온 데이터 확인하기"+wishlistDAO.getOneWishList(wvo));	
		return wishlistDAO.getOneWishList(wvo);
	}

}
