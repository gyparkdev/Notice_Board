package com.pky.service;

import com.pky.domain.MemberVO;

public interface MemberService {

	//회원가입
	public void join(MemberVO member);
	
	//로그인
	public MemberVO login(MemberVO member);
	
	//회원정보수정
	public void update(MemberVO member);
	
	//회원탈퇴
	public void delete(MemberVO member);
	
	//비밀번호 체크
	public int pwChk(MemberVO member);
	
	//아이디 중복확인
	public int idChk(MemberVO member);
	
}
