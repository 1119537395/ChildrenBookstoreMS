package com.fish.business.controller;

import com.fish.business.service.OrderService;
import com.fish.business.vo.OrderVo;
import com.fish.system.utils.CommonReturnType;
import com.fish.system.utils.DataGridView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * @ClassName OrderController
 * @Description 订单前端控制器
 * @Author 柚子茶
 * @Date 2021/4/17 19:05
 * @Version 1.0
 */
@RestController()
@RequestMapping("order")
public class OrderController {

	@Autowired
	private OrderService orderService;


	/**
	 * @return Map<String, Object>
	 * @description 获取自动生成的订单编号和当前系统登录的用户
	 * @author 柚子茶
	 * @date 2021/4/17 11:53
	 **/
	@RequestMapping("loadOrderFormData")
	public Map<String, String> loadOrderFormData() {
		return this.orderService.queryOrderFormData();
	}

	/**
	 * @param orderVo
	 * @return CommonReturnType
	 * @description 添加订单
	 * @author 柚子茶
	 * @date 2021/4/17 19:26
	 **/
	@RequestMapping("addOrderData")
	public CommonReturnType addOrderData(OrderVo orderVo) {
		try {
			this.orderService.addOrderData(orderVo);
			return CommonReturnType.ADD_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return CommonReturnType.ADD_FAILURE;
		}
	}


	/**
	 * @param orderVo
	 * @return DataGridView
	 * @description 查询订单信息
	 * @author 柚子茶
	 * @date 2021/4/18 10:09
	 **/
	@RequestMapping("loadOrderInfo")
	public DataGridView loadOrderInfo(OrderVo orderVo) {
		return this.orderService.queryOrderInfo(orderVo);
	}

	/**
	 * @param orderVo
	 * @return CommonReturnType
	 * @description 删除订单
	 * @author 柚子茶
	 * @date 2021/4/18 23:34
	 **/
	@RequestMapping("deleteOrderInfo")
	public CommonReturnType deleteOrderInfo(OrderVo orderVo) {
		try {
			this.orderService.deleteOrderInfo(orderVo.getOrderId());
			return CommonReturnType.DELETE_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return CommonReturnType.DELETE_FAILURE;
		}
	}

	/**
	 * @param orderVo
	 * @return CommonReturnType
	 * @description 订单修改
	 * @author 柚子茶
	 * @date 2021/4/18 23:56
	 **/
	@RequestMapping("updateOrderInfo")
	public CommonReturnType updateOrderInfo(OrderVo orderVo) {
		try {
			this.orderService.updateOrderInfo(orderVo);
			return CommonReturnType.MODIFY_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return CommonReturnType.MODIFY_FAILURE;
		}
	}


}
