package com.pky.mapper;

import java.util.List;

import com.pky.domain.ReplyVO;

public interface ReplyMapper {

	//댓글 리스트 조회
	public List<ReplyVO> readReply(Long board_no); 
	
	//선택된 댓글 조회
	public ReplyVO selectReply(Long reply_no);
	
	//댓글작성
	public void writeReply(ReplyVO reply);
	
	//댓글수정
	public void updateReply(ReplyVO reply);
	
	//댓글삭제
	public void deleteReply(ReplyVO reply);
}
