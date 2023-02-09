package com.green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.dao.ProductDAO;
import com.green.vo.CustomerVO;
import com.green.vo.ProductVO;

@Service
public class ProductService {
	
	@Autowired
	private ProductDAO productDAO;

	public int selectAllNumAuction() {
		return productDAO.selectAllNumAuction();
	}
	
	public List<ProductVO> selectAllAuctionByFilter(String filter) {
		return productDAO.selectAllAuctionByFilter(filter);
	}

	public int selectAllNumAuctionByEnd(String end) {
		return productDAO.selectAllNumAuctionByEnd(end);
	}
	
	public int selectAllNumAuctionByCategory(String category) {
		return productDAO.selectAllNumAuctionByCategory(category);
	}
	
	public List<ProductVO> selectAllAuction(){
		return productDAO.selectAllAuction();
	}

	public List<ProductVO> selectTargetAuctionByPaging(String category, String filter, String sort, int startNum,
			String end) {
		return productDAO.selectTargetAuctionByPaging(category, filter, sort, startNum, end);
	}

	public List<ProductVO> search(String searchCate, String searchText) {
		return productDAO.search(searchCate, searchText);
	}

	public void readCount(int num) {
		productDAO.readCount(num);
	}

	public ProductVO selectOne(int num) {
		return productDAO.selectOne(num);
	}

	public void insertProduct(ProductVO dto) {
		productDAO.insertProduct(dto);
	}

	public void deleteProduct(int num) {
		productDAO.deleteProduct(num);
	}

	public void insertCustomer(CustomerVO cdto) {
		productDAO.insertCustomer(cdto);
	}

	public void direct(int num) {
		productDAO.direct(num);
	}
	
	public void updateUserPoint(int price, String id) {
		productDAO.updateUserPoint(price, id);
	}
	
	
}
