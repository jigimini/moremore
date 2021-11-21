package com.spring.more.project.model.service;

import java.util.List;

import com.spring.more.project.model.vo.WishListVO;
import com.spring.more.project.model.vo.WishProVO;

public interface WishListService {

	void insertWishList(WishListVO wvo);
	void deleteWishList(WishListVO wvo);
	List<WishProVO> getWishList();
	List<WishProVO> getWishList(WishProVO wpvo);
	WishListVO checkWishlist(WishListVO wvo);
}
