package com.ezen.www.service;

import com.ezen.www.domain.MemberVO;

public interface MemberService {

	int signUp(MemberVO mvo);

	MemberVO inUser(MemberVO mvo);

	void lastLogin(String id);

	int modify(MemberVO mvo);

	
}
