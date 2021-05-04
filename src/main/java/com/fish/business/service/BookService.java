package com.fish.business.service;

import com.fish.business.vo.BookVo;
import com.fish.system.utils.DataGridView;

import java.util.Map;

/**
 * @InterfaceName BookService
 * @Description 书籍业务层接口
 * @Author 柚子茶
 * @Date 2021/4/16 15:48
 * @Version 1.0
 */
public interface BookService {


	/**
	 * @return Map<String, String>
	 * @description 获取图书编号
	 * @author 柚子茶
	 * @date 2021/4/16 17:26
	 **/
	Map<String, String> getBookCode();

	/**
	 * @param bookVo
	 * @return void
	 * @description 添加书籍
	 * @author 柚子茶
	 * @date 2021/4/16 17:58
	 **/
	void addBookInfo(BookVo bookVo);

	/**
	 * @param bookVo
	 * @return DataGridView
	 * @description 查询书籍信息
	 * @author 柚子茶
	 * @date 2021/4/17 13:32
	 **/
	DataGridView queryBookInfo(BookVo bookVo);

	/**
	 * @param bookVo
	 * @return void
	 * @description 删除书籍信息
	 * @author 柚子茶
	 * @date 2021/4/17 13:34
	 **/
	void deleteBookInfo(BookVo bookVo);

	/**
	 * @param bookVo
	 * @return void
	 * @description 更新书籍信息
	 * @author 柚子茶
	 * @date 2021/4/17 13:36
	 **/
	void updateBookInfo(BookVo bookVo);

	/**
	 * @param bookVo
	 * @return DataGridView
	 * @description 查询已经上架的书籍信息
	 * @author 柚子茶
	 * @date 2021/4/17 17:12
	 **/
	DataGridView loadBookInfoByState(BookVo bookVo);

	/**
	 * @param bookVo
	 * @return boolean
	 * @description 校验图书库存
	 * @author 柚子茶
	 * @date 2021/4/17 20:16
	 **/
	boolean checkBookNumber(BookVo bookVo);
}
