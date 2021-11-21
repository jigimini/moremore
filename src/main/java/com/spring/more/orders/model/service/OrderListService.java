package com.spring.more.orders.model.service;

import java.util.List;

import com.spring.more.orders.model.vo.OrderListVO;

public interface OrderListService {

	List<OrderListVO> getOrderList();
	List<OrderListVO> getOrderList(OrderListVO olvo);
	void updateOrderStatus(OrderListVO olvo);
	OrderListVO getOneOrder(OrderListVO olvo);
}
