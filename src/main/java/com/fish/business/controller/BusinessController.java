package com.fish.business.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ClassName BusinessController
 * @Description 业务管理的路由控制器
 * @Author 柚子茶
 * @Date 2021/2/25 19:06
 * @Version 1.0
 */
@Controller
@RequestMapping("business")
public class BusinessController {

	/**
	 * @return String
	 * @description 跳转到添加书籍界面
	 * @author 柚子茶
	 * @date 2021/4/16 16:13
	 **/
	@RequestMapping("addBookManager")
	public String toAddBookManager() {
		return "business/book/addBookManager";
	}


	/**
	 * @return String
	 * @description 跳转到书籍管理界面
	 * @author 柚子茶
	 * @date 2021/4/17 14:02
	 **/
	@RequestMapping("toBookManager")
	public String toBookManager() {
		return "business/book/BookManager";
	}

	/**
	 * @return String
	 * @description 跳转到结算窗口界面
	 * @author 柚子茶
	 * @date 2021/4/17 19:33
	 **/
	@RequestMapping("toSellManager")
	public String toSellManager() {
		return "business/order/SellManager";
	}

	/**
	 * @return String
	 * @description 跳转到订单管理界面
	 * @author 柚子茶
	 * @date 2021/4/18 10:48
	 **/
	@RequestMapping("toOrderManager")
	public String toOrderManager() {
		return "business/order/OrderManager";
	}


}
