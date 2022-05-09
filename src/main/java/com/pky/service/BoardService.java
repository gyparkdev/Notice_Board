package com.pky.service;

import java.util.List;

import com.pky.domain.BoardVO;
import com.pky.domain.Criteria;

public interface BoardService {
	//게시판 리스트 조회
	public List<BoardVO> getList(Criteria cri);
	
	//게시글 조회수
	public int viewCount(Long board_no);

	//게시글 상세조회
	public BoardVO get(Long board_no);
	
	//게시글 등록
	public Long register(BoardVO board);
	
	//게시글 수정
	public int modify(BoardVO board);
	
	//게시글 삭제
	public int remove(Long board_no);
	
	//게시글 총 갯수
	public int getTotal(Criteria cri);
}
