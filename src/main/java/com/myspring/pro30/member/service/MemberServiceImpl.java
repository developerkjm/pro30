package com.myspring.pro30.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.pro30.board.vo.ArticleVO;
import com.myspring.pro30.board.vo.ImageVO;
import com.myspring.pro30.member.dao.MemberDAO;
import com.myspring.pro30.member.vo.MemberVO;



@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public List listMembers() throws DataAccessException {
		List membersList = null;
		membersList = memberDAO.selectAllMemberList();
		return membersList;
	}

	@Override
	public int addMember(MemberVO member) throws DataAccessException {
		return memberDAO.insertMember(member);
	}
	
	@Override
	public List<Map<String, Object>> viewMember(String id) throws Exception {
		System.out.println("view member id?? : "+id);
		List<Map<String, Object>> viewMember = memberDAO.selectMember(id);
		System.out.println("view memberVO?? : "+viewMember);
		return viewMember;
	}
	
	
	@Override
	public int updateMember(MemberVO member) throws DataAccessException {
		return memberDAO.updateMember(member);
	}
	

	@Override
	public MemberVO searchId(MemberVO memberVO) throws Exception{
		System.out.println("Service of searchId ? "+ memberDAO.searchById(memberVO));
		
		return memberDAO.searchById(memberVO);
	}
	
	@Override
	public int removeMember(String id) throws DataAccessException {
		return memberDAO.deleteMember(id);
	}
	
	@Override
	public MemberVO login(MemberVO memberVO) throws Exception{
		return memberDAO.loginById(memberVO);
	}
	
	public List<String> memberSearch(String keyword) throws Exception {
		List<String> list=memberDAO.selectMemberSearch(keyword);
		return list;
	}

}
