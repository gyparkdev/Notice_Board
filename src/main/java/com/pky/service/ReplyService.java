package com.pky.service;

import java.util.List;

import com.pky.domain.ReplyVO;

public interface ReplyService {

	//댓글 리스트 조회
	public List<ReplyVO> readReply(Long bno);
	
	//선택된 댓글 조회
	public ReplyVO selectReply(Long rno);
	
	//댓글 작성
	public void writeReply(ReplyVO reply);
	
	//댓글 수정
	public void updateReply(ReplyVO reply);
	
	//댓글 삭제
	public void deleteReply(ReplyVO reply);
}
