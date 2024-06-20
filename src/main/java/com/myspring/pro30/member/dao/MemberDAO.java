package com.myspring.pro30.member.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.pro30.board.vo.ArticleVO;
import com.myspring.pro30.member.vo.MemberVO;


public interface MemberDAO {
	 public List selectAllMemberList() throws DataAccessException;
	 public int insertMember(MemberVO memberVO) throws DataAccessException ;
	 public int updateMember(MemberVO memberVO) throws DataAccessException ;
	 
	 //public MemberVO selectMember(String id) throws DataAccessException;
	 public List selectMember(String id) throws DataAccessException;
	 
	 public int deleteMember(String id) throws DataAccessException;
	 public MemberVO loginById(MemberVO memberVO) throws DataAccessException;
	 public MemberVO searchById(MemberVO memberVO) throws DataAccessException;
}
