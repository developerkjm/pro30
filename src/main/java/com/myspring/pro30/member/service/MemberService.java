package com.myspring.pro30.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.pro30.member.vo.MemberVO;

public interface MemberService {
	 public List listMembers() throws DataAccessException;
	 public int addMember(MemberVO memberVO) throws DataAccessException;
	 public int updateMember(MemberVO memberVO) throws DataAccessException;
	 public List<Map<String, Object>> viewMember(String id) throws Exception;
	 public int removeMember(String id) throws DataAccessException;
	 public MemberVO login(MemberVO memberVO) throws Exception;
	 public MemberVO searchId(MemberVO memberVO) throws Exception;
	 
	 public List<String> memberSearch(String keyword) throws Exception;
}
