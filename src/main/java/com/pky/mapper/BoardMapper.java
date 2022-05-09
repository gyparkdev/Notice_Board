package com.pky.mapper;

import java.util.List;

import com.pky.domain.BoardVO;
import com.pky.domain.Criteria;

public interface BoardMapper {
	
	//게시판 리스트 조회
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	//게시글 조회수
	public int viewCount(Long board_no);
	
	//게시글 등록 
	public void insertSelectKey(BoardVO board);
	
	//게시글 상세 조회
	public BoardVO read(Long board_no);
	
	//게시글 수정
	public int update(BoardVO board);

	//게시글 삭제
	public int delete(Long board_no);
	
	//게시글 총 갯수
	public int getTotalCount(Criteria cri);
}
