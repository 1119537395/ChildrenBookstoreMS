package com.fish.business.service.impl;

import com.fish.business.dao.BookDao;
import com.fish.business.dao.OrderDao;
import com.fish.business.domain.Book;
import com.fish.business.domain.Order;
import com.fish.business.service.OrderService;
import com.fish.business.vo.OrderVo;
import com.fish.system.domain.User;
import com.fish.system.utils.DataGridView;
import com.fish.system.utils.MessageConstant;
import com.fish.system.utils.RandomUtils;
import com.fish.system.utils.WebUtils;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName OrderServiceImpl
 * @Description 订单业务层接口实现类
 * @Author 柚子茶
 * @Date 2021/4/17 19:04
 * @Version 1.0
 */
@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDao orderDao;

	@Autowired
	private BookDao bookDao;

	/**
	 * @return Map<String, String>
	 * @description 获取自动生成的订单编号和当前登录的用户
	 * @author 柚子茶
	 * @date 2021/4/17 13:38
	 **/
	@Override
	public Map<String, String> queryOrderFormData() {
		// 自动生成订单编号
		String flowerOrderNumber = RandomUtils.createRandomNumberByTime(MessageConstant.ORDER_HEAD);
		// 获取当前登录的用户
		User user = (User) WebUtils.getHttpSession().getAttribute("user");

		// 创建Map集合
		// 将获取到数据封装到map集合中
		Map<String, String> map = new HashMap<>(16);
		map.put("orderNumber", flowerOrderNumber);
		map.put("userName", user.getUserName());

		return map;
	}

	/**
	 * @param orderVo
	 * @return void
	 * @description 添加订单
	 * @author 柚子茶
	 * @date 2021/4/17 19:27
	 **/
	@Override
	public void addOrderData(OrderVo orderVo) {
		// 查询出书籍的库存信息
		Book book = bookDao.selectByPrimaryKey(orderVo.getBookId());
		book.setBookStockNumber(book.getBookStockNumber() - orderVo.getOrderSellNumber());
		// 更新库存信息
		this.bookDao.updateByPrimaryKeySelective(book);
		// 获取当前登录的用户信息
		User user = (User) WebUtils.getHttpSession().getAttribute("user");
		orderVo.setCreateUserId(user.getUserId());
		orderVo.setOrderCreateTime(new Date());
		this.orderDao.insertSelective(orderVo);
	}

	/**
	 * @param orderVo
	 * @return DataGridView
	 * @description 查询订单信息
	 * @author 柚子茶
	 * @date 2021/4/18 10:10
	 **/
	@Override
	public DataGridView queryOrderInfo(OrderVo orderVo) {
		Page<Object> page = PageHelper.startPage(orderVo.getPage(), orderVo.getLimit());
		List<Order> orderList = this.orderDao.queryOrderInfo(orderVo);
		return new DataGridView(page.getTotal(), orderList);
	}

	/**
	 * @param orderId
	 * @return void
	 * @description 删除订单
	 * @author 柚子茶
	 * @date 2021/4/18 23:35
	 **/
	@Override
	public void deleteOrderInfo(String orderId) {
		this.orderDao.deleteByPrimaryKey(orderId);
	}

	/**
	 * @param orderVo
	 * @return void
	 * @description 订单修改
	 * @author 柚子茶
	 * @date 2021/4/18 23:56
	 **/
	@Override
	public void updateOrderInfo(OrderVo orderVo) {
		this.orderDao.updateByPrimaryKeySelective(orderVo);
	}
}
