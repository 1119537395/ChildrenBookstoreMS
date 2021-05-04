package com.fish.business.service.impl;

import com.fish.business.dao.BookDao;
import com.fish.business.domain.Book;
import com.fish.business.service.BookService;
import com.fish.business.vo.BookVo;
import com.fish.system.domain.User;
import com.fish.system.utils.*;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName BookServiceImpl
 * @Description 书籍业务层接口实现类
 * @Author 柚子茶
 * @Date 2021/4/16 15:48
 * @Version 1.0
 */
@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private BookDao bookDao;


	/**
	 * @return Map<String, String>
	 * @description 获取图书编号
	 * @author 柚子茶
	 * @date 2021/4/16 17:26
	 **/
	@Override
	public Map<String, String> getBookCode() {
		String bookCode = RandomUtils.createRandomGenerateBookCode("CBMS");
		Map<String, String> map = new HashMap<>(16);
		map.put("bookCode", bookCode);
		return map;
	}

	/**
	 * @param bookVo
	 * @return void
	 * @description 添加书籍
	 * @author 柚子茶
	 * @date 2021/4/16 17:58
	 **/
	@Override
	public void addBookInfo(BookVo bookVo) {
		// 获取当前登录的用户
		User user = (User) WebUtils.getHttpSession().getAttribute("user");
		bookVo.setCreateTime(new Date());
		bookVo.setCreateUserId(user.getUserId());
		// 判断是否上传了书籍封面图片
		if (!bookVo.getBookImageUrl().equals(MessageConstant.IMG_DEFAULT_ADDRESS)) {
			// 去掉图片的临时文件后缀
			String suffix = AppFileUtils.modifyFileSuffix(bookVo.getBookImageUrl(), MessageConstant.FILE_UPLOAD_TEMP);
			bookVo.setBookImageUrl(suffix);
		}

		this.bookDao.insertSelective(bookVo);
	}

	/**
	 * @param bookVo
	 * @return DataGridView
	 * @description 查询
	 * @author 柚子茶
	 * @date 2021/4/17 13:37
	 **/
	@Override
	public DataGridView queryBookInfo(BookVo bookVo) {
		Page<Object> page = PageHelper.startPage(bookVo.getPage(), bookVo.getLimit());
		List<Book> bookList = this.bookDao.queryBookInfo(bookVo);
		return new DataGridView(page.getTotal(), bookList);
	}

	/**
	 * @param bookVo
	 * @return void
	 * @description 删除
	 * @author 柚子茶
	 * @date 2021/4/17 13:37
	 **/
	@Override
	public void deleteBookInfo(BookVo bookVo) {
		this.bookDao.deleteByPrimaryKey(bookVo.getBookId());
	}

	/**
	 * @param bookVo
	 * @return void
	 * @description 更新
	 * @author 柚子茶
	 * @date 2021/4/17 13:37
	 **/
	@Override
	public void updateBookInfo(BookVo bookVo) {
		// 判断是否修改了书籍封面图
		if (bookVo.getBookImageUrl().endsWith(MessageConstant.FILE_UPLOAD_TEMP)) {
			// 将原先的书籍封面删除
			Book book = this.bookDao.selectByPrimaryKey(bookVo.getBookId());
			if (!book.getBookImageUrl().equals(MessageConstant.IMG_DEFAULT_ADDRESS)) {
				AppFileUtils.deleteFileUsePath(book.getBookImageUrl());
			}
			// 将新上传的书籍封面去掉临时文件后缀
			String modifyFileSuffix = AppFileUtils.modifyFileSuffix(bookVo.getBookImageUrl(), MessageConstant.FILE_UPLOAD_TEMP);
			bookVo.setBookImageUrl(modifyFileSuffix);
		}

		this.bookDao.updateByPrimaryKeySelective(bookVo);
	}

	/**
	 * @param bookVo
	 * @return DataGridView
	 * @description 查询已经上架的书籍信息
	 * @author 柚子茶
	 * @date 2021/4/17 17:12
	 **/
	@Override
	public DataGridView loadBookInfoByState(BookVo bookVo) {
		bookVo.setBookState(1);
		return queryBookInfo(bookVo);
	}

	/**
	 * @param bookVo
	 * @return boolean
	 * @description 校验图书库存
	 * @author 柚子茶
	 * @date 2021/4/17 20:17
	 **/
	@Override
	public boolean checkBookNumber(BookVo bookVo) {
		// 查询出图书剩余库存
		Book book = this.bookDao.selectByPrimaryKey(bookVo.getBookId());
		if (book.getBookStockNumber() < bookVo.getBookStockNumber()){
			return true;
		}
		return false;
	}
}
