package com.fish.business.controller;

import com.fish.business.service.BookService;
import com.fish.business.vo.BookVo;
import com.fish.system.utils.CommonReturnType;
import com.fish.system.utils.DataGridView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * @ClassName BookController
 * @Description 书籍的前端控制器
 * @Author 柚子茶
 * @Date 2021/4/16 15:49
 * @Version 1.0
 */
@RestController
@RequestMapping("book")
public class BookController {

	@Autowired
	private BookService bookService;


	/**
	 * @return Map<String, String>
	 * @description 获取图书编号
	 * @author 柚子茶
	 * @date 2021/4/16 17:25
	 **/
	@RequestMapping("getBookCode")
	public Map<String, String> getBookCode() {
		return this.bookService.getBookCode();
	}

	/**
	 * @param bookVo
	 * @return CommonReturnType
	 * @description 添加书籍
	 * @author 柚子茶
	 * @date 2021/4/16 17:57
	 **/
	@RequestMapping("addBookInfo")
	public CommonReturnType addBookInfo(BookVo bookVo) {
		try {
			this.bookService.addBookInfo(bookVo);
			return CommonReturnType.ADD_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return CommonReturnType.ADD_FAILURE;
		}
	}

	/**
	 * @param bookVo
	 * @return DataGridView
	 * @description 查询书籍信息
	 * @author 柚子茶
	 * @date 2021/4/17 13:31
	 **/
	@RequestMapping("loadBookInfo")
	public DataGridView loadBookInfo(BookVo bookVo) {
		return this.bookService.queryBookInfo(bookVo);
	}

	/**
	 * @param bookVo
	 * @return CommonReturnType
	 * @description 删除录入的书籍信息
	 * @author 柚子茶
	 * @date 2021/4/17 13:33
	 **/
	@RequestMapping("deleteBookInfo")
	public CommonReturnType deleteBookInfo(BookVo bookVo) {
		try {
			this.bookService.deleteBookInfo(bookVo);
			return CommonReturnType.DELETE_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return CommonReturnType.DELETE_FAILURE;
		}
	}

	/**
	 * @param bookVo
	 * @return CommonReturnType
	 * @description 更新书籍信息
	 * @author 柚子茶
	 * @date 2021/4/17 13:35
	 **/
	@RequestMapping("updateBookInfo")
	public CommonReturnType updateBookInfo(BookVo bookVo) {
		try {
			this.bookService.updateBookInfo(bookVo);
			return CommonReturnType.MODIFY_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return CommonReturnType.MODIFY_FAILURE;
		}
	}

	/**
	 * @param bookVo
	 * @return DataGridView
	 * @description 查询已经上架的书籍信息
	 * @author 柚子茶
	 * @date 2021/4/17 17:11
	 **/
	@RequestMapping("loadBookInfoByState")
	public DataGridView loadBookInfoByState(BookVo bookVo) {
		return this.bookService.loadBookInfoByState(bookVo);
	}

	/**
	 * @param bookVo
	 * @return boolean
	 * @description 校验图书库存
	 * @author 柚子茶
	 * @date 2021/4/17 20:16
	 **/
	@RequestMapping("checkBookNumber")
	public boolean checkBookNumber(BookVo bookVo) {
		return this.bookService.checkBookNumber(bookVo);
	}


}
