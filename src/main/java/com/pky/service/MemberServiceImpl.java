package com.pky.service;

import org.springframework.stereotype.Service;

import com.pky.domain.MemberVO;
import com.pky.mapper.MemberMapper;

import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Service
@RequiredArgsConstructor
@ToString
public class MemberServiceImpl implements MemberService{
	
	public final MemberMapper mapper;

	//회원가입
	@Override
	public void join(MemberVO member) {
		mapper.join(member);
	}

	//로그인
	@Override
	public MemberVO login(MemberVO member) {
		return mapper.login(member);
	}

	//회원정보수정
	@Override
	public void update(MemberVO member) {
		mapper.update(member);
	}

	//회원탈퇴
	@Override
	public void delete(MemberVO member) {
		mapper.delete(member);
	}

	//비밀번호 체크
	@Override
	public int pwChk(MemberVO member) {
		int result = mapper.pwChk(member);
		return result;
	}
	
	//아이디 중복확인
	@Override
	public int idChk(MemberVO member) {
		int result = mapper.idChk(member);
		return result;
	}
}
