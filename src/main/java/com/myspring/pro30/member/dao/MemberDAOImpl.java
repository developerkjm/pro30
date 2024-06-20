package com.myspring.pro30.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.pro30.board.vo.ArticleVO;
import com.myspring.pro30.member.vo.MemberVO;


@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List selectAllMemberList() throws DataAccessException {
		List<MemberVO> membersList = null;
		membersList = sqlSession.selectList("mapper.member.selectAllMemberList");
		return membersList;
	}

	@Override
	public int insertMember(MemberVO memberVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.member.insertMember", memberVO);
		return result;
	}
	
	@Override
	public MemberVO searchById(MemberVO memberVO) throws DataAccessException{
		  System.out.println("DAO of searchById");
		  MemberVO vo = sqlSession.selectOne("mapper.member.searchById",memberVO);
		return vo;
	}
	
	@Override
	//public MemberVO selectMember(String id) throws DataAccessException {
	//	return sqlSession.selectOne("mapper.member.selectMember", id);
	//}
	public List selectMember(String id) throws DataAccessException {
		System.out.println("MemberDAOImple의 id? : "+id);
		//List<Map<String, Object>> viewMemberList = sqlSession.selectOne("mapper.member.selectMember", id);
		List<Map<String, Object>> viewMemberList = sqlSession.selectList("mapper.member.selectMember", id);
		return viewMemberList;
	}

	
	@Override
	public int updateMember(MemberVO memberVO) throws DataAccessException {
		int result = sqlSession.update("mapper.member.updateMember", memberVO);
		return result;
	}

	@Override
	public int deleteMember(String id) throws DataAccessException {
		int result = sqlSession.delete("mapper.member.deleteMember", id);
		return result;
	}
	
	@Override
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException{
		  MemberVO vo = sqlSession.selectOne("mapper.member.loginById",memberVO);
		return vo;
	}

}
