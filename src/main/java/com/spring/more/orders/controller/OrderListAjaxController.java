package com.spring.more.orders.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.more.orders.model.service.OrderListService;
import com.spring.more.orders.model.vo.OrderListVO;

@Controller
public class OrderListAjaxController {

	@Autowired
	private OrderListService orderListService;
	
	@RequestMapping("/getOrderList.do")
	@ResponseBody
	public List<OrderListVO> getAjaxOrderList(OrderListVO olvo) {
		System.out.println("OrderListAjaxController getAjaxOrderList LINE 19: "+olvo.getUser_no());
		
		List<OrderListVO> orderlist = orderListService.getOrderList(olvo);
		
		System.out.println(orderlist);
		return orderlist;
	}
	@RequestMapping("/requestOrderCancel.do")
	@ResponseBody
	public OrderListVO requestOrderCancelAjaxOrderList(OrderListVO olvo) {
		System.out.println("OrderListAjaxController requestOrderCancelAjaxOrderList LINE 19: "+olvo.toString());
		orderListService.updateOrderStatus(olvo);
		return orderListService.getOneOrder(olvo);
	}
	
}
