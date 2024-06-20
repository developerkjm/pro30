package com.myspring.pro30.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.pro30.board.vo.ArticleVO;
import com.myspring.pro30.board.vo.FeeVO;
import com.myspring.pro30.member.vo.MemberVO;

public interface BoardService {
	public List<ArticleVO> listArticles() throws Exception;
	public List<FeeVO> listFees() throws Exception;
	public List<Map<String, Object>> feeForm() throws Exception;
	
	
	public int addNewArticle(Map articleMap) throws Exception;
	//public ArticleVO viewArticle(int articleNO) throws Exception;
	
	public ArticleVO viewArticle(int articleNO) throws Exception;
	//public Map viewArticle(int articleNO) throws Exception;
	
	
	
	public void modArticle(Map articleMap) throws Exception;
	public void removeArticle(int articleNO) throws Exception;
	
	
	
	//public int addNewFee(FeeVO feeVO) throws DataAccessException;
	public int addNewFee(Map feeMap) throws DataAccessException;
	public void updateFee(Map feeMap) throws DataAccessException;
	
}
