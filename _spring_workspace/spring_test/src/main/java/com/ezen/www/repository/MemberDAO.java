package com.ezen.www.repository;

import com.ezen.www.domain.MemberVO;

public interface MemberDAO {

	MemberVO getUser();

	int insert(MemberVO mvo);

	MemberVO getUser(String id);

	void lastLogin(String id);

	int modify(MemberVO mvo);
	
	
}
