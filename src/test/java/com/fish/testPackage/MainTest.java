package com.fish.testPackage;

import com.fish.business.dao.BookDao;
import com.fish.business.dao.OrderDao;
import com.fish.business.domain.Book;
import com.fish.business.domain.Order;
import com.fish.business.vo.BookVo;
import com.fish.system.utils.RandomUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.Random;

/**
 * @ClassName MainTest
 * @Description 测试类
 * @Author 柚子茶
 * @Date 2021/4/16 15:21
 * @Version 1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml" })
public class MainTest {


	@Autowired
	private OrderDao OrderDao;

	@Test
	public void test(){

		List<Order> orderList = OrderDao.queryOrderInfo(null);
		for (Order order : orderList) {
			System.out.println(order);
		}

	}

}
