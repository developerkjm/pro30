package com.myspring.pro30.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.pro30.board.vo.ArticleVO;
import com.myspring.pro30.board.vo.FeeVO;
import com.myspring.pro30.member.vo.MemberVO;


public interface BoardDAO {
	public List selectAllArticlesList() throws DataAccessException;
	public List selectAllFeesList() 	throws DataAccessException;
	public List selectNewFeesList() 	throws DataAccessException;
	//public int insertFee(FeeVO feeVO) 	throws DataAccessException ;
	public int insertFee(Map feeMap) 	throws DataAccessException ;
	public void updateFee(Map feeMap) 	throws DataAccessException ;
	
	
	public int insertNewArticle(Map articleMap) throws DataAccessException;
	public void insertNewImage(Map articleMap) throws DataAccessException;
	
	public ArticleVO selectArticle(int articleNO) throws DataAccessException;
	public void updateArticle(Map articleMap) throws DataAccessException;
	public void deleteArticle(int articleNO) throws DataAccessException;
	public List selectImageFileList(int articleNO) throws DataAccessException;
	
}
