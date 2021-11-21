package com.spring.more.orders.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.more.orders.model.vo.OrderListVO;

@Repository
public class OrderListDAO {

	@Autowired
	private SqlSessionTemplate orderListDAO;
	
	public OrderListDAO() {
		System.out.println("> OrderListDAO() 객체 생성");
	}
	
	// 구매 펀딩 리스트 조회
	public List<OrderListVO> getOrderList() {
		return null;
	}
	
	public List<OrderListVO> getOrderList(OrderListVO olvo) {
		System.out.println(" DAO > getOrderList() 펀딩 리스트 " + olvo.toString());
		System.out.println("OrderListDAO - DB에서 불러온 데이터 확인하기 "+orderListDAO.selectList("orderListDAO.getOrderList", olvo).toString());
		return orderListDAO.selectList("orderListDAO.getOrderList", olvo);
	}

	public void updateOrderStatus(OrderListVO olvo) {
		System.out.println("updateOrderStatus userDAO"+orderListDAO.update("orderListDAO.updateOrderStatus", olvo));
		
	}

	public OrderListVO getOrder(OrderListVO olvo) {
		// TODO Auto-generated method stub
		return orderListDAO.selectOne("orderListDAO.getOrder", olvo);
	}
}
