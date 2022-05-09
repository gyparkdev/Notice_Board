package com.pky.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.pky.domain.ReplyVO;
import com.pky.mapper.ReplyMapper;

import lombok.RequiredArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@ToString
public class ReplyServiceImpl implements ReplyService{

	public final ReplyMapper mapper;

	//댓글 리스트 조회
	@Override
	public List<ReplyVO> readReply(Long bno) {
		return mapper.readReply(bno);
	}

	//선택된 댓글 조회
	@Override
	public ReplyVO selectReply(Long rno) {
		return mapper.selectReply(rno);
	}
	
	//댓글 작성
	@Override
	public void writeReply(ReplyVO reply) {
		mapper.writeReply(reply);
	}

	//댓글 수정
	@Override
	public void updateReply(ReplyVO reply) {
		mapper.updateReply(reply);
	}

	//댓글 삭제
	@Override
	public void deleteReply(ReplyVO reply) {
		mapper.deleteReply(reply);
	}
}
