package com.spring.more.project.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.more.project.model.vo.WishListVO;
import com.spring.more.project.model.vo.WishProVO;

@Repository
public class WishListDAO {

	@Autowired
	private SqlSessionTemplate wishlistDAO;
	
	public WishListDAO() {
		System.out.println("> WishListDAO() 객체 생성");
	}
	
	// 좋아요 등록
	public void insertWishList(WishListVO wvo) {
		//System.out.println(" DAO > insertWishList() 좋아요 등록"+ wvo.toString());
		wishlistDAO.insert("wishlistDAO.insertWishList", wvo);
	}
	
	// 좋아요 취소
	public void deleteWishList(WishListVO wvo) {
		//System.out.println(" DAO > deleteWishList() 좋아요 삭제"+ wvo.toString());
		wishlistDAO.delete("wishlistDAO.deleteWishList", wvo);
	}
	// 좋아요 체크
	public WishListVO getOneWishList(WishListVO wvo) {
		return wishlistDAO.selectOne("wishlistDAO.getOneWishList",wvo);
	}
	
	// 좋아요 리스트
	public List<WishProVO> getWishList() {
		return null;
	}
	
	public List<WishProVO> getWishList(WishProVO wpvo) {
		System.out.println(" DAO > getWishList() 좋아요 리스트 " + wpvo.toString());
		return wishlistDAO.selectList("wishlistDAO.getWishList", wpvo);
	}
	
}
