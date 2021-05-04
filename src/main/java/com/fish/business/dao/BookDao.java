package com.fish.business.dao;

import com.fish.business.domain.Book;
import com.fish.business.vo.BookVo;

import java.util.List;

/**
 * @InterfaceName BookDao
 * @Description 书籍的数据库访问层
 * @Author 柚子茶
 * @Date 2021/4/16 21:55
 * @Version 1.0
 */
public interface BookDao {

	int deleteByPrimaryKey(String bookId);

	int insert(Book record);

	int insertSelective(Book record);

	Book selectByPrimaryKey(String bookId);

	int updateByPrimaryKeySelective(Book record);

	int updateByPrimaryKey(Book record);


	/**
	 * @param bookVo
	 * @return List<Book>
	 * @description 根据条件查询书籍信息
	 * @author 柚子茶
	 * @date 2021/4/17 13:41
	 **/
	List<Book> queryBookInfo(BookVo bookVo);
}