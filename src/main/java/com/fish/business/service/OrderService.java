package com.fish.business.service;

import com.fish.business.vo.OrderVo;
import com.fish.system.utils.DataGridView;

import java.util.Map;

/**
 * @InterfaceName OrderService
 * @Description 订单业务层接口
 * @Author 柚子茶
 * @Date 2021/4/17 19:03
 * @Version 1.0
 */
public interface OrderService {


	/**
	 * @return Map<String, String>
	 * @description 获取自动生成的订单编号和当前登录的用户
	 * @author 柚子茶
	 * @date 2021/4/17 13:38
	 **/
	Map<String, String> queryOrderFormData();

	/**
	 * @param orderVo
	 * @return void
	 * @description 添加订单
	 * @author 柚子茶
	 * @date 2021/4/17 19:27
	 **/
	void addOrderData(OrderVo orderVo);

	/**
	 * @param orderVo
	 * @return DataGridView
	 * @description 查询订单信息
	 * @author 柚子茶
	 * @date 2021/4/18 10:09
	 **/
	DataGridView queryOrderInfo(OrderVo orderVo);

	/**
	 * @param orderId
	 * @return void
	 * @description 删除订单
	 * @author 柚子茶
	 * @date 2021/4/18 23:35
	 **/
	void deleteOrderInfo(String orderId);

	/**
	 * @param orderVo
	 * @return void
	 * @description 订单修改
	 * @author 柚子茶
	 * @date 2021/4/18 23:56
	 **/
	void updateOrderInfo(OrderVo orderVo);
}
