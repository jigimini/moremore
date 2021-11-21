package com.spring.more.orders.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.more.orders.model.dao.OrderListDAO;
import com.spring.more.orders.model.vo.OrderListVO;

@Service("orderListService")
public class OrderListServiceImpl implements OrderListService {

	@Autowired
	private OrderListDAO orderListDAO;
	
	public OrderListServiceImpl() {
		System.out.println(">> OrderListServiceImpl() 객체 생성");
	}
	
	@Override
	public List<OrderListVO> getOrderList() {
		
		return orderListDAO.getOrderList();
	}

	@Override
	public List<OrderListVO> getOrderList(OrderListVO olvo) {
		System.out.println("OrderListServiceImpl - 입력된 데이터 확인하기: " + olvo.toString());
		System.out.println("OrderListServiceImpl - DB에서 불러온 데이터 확인하기 " + orderListDAO.getOrderList(olvo));
		
		return orderListDAO.getOrderList(olvo);
	}

	@Override
	public void updateOrderStatus(OrderListVO olvo) {
		 orderListDAO.updateOrderStatus(olvo);
	}

	@Override
	public OrderListVO getOneOrder(OrderListVO olvo) {
		// TODO Auto-generated method stub
		return orderListDAO.getOrder(olvo);
	}

}
