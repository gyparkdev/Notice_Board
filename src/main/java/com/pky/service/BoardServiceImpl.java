package com.pky.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.pky.domain.BoardVO;
import com.pky.domain.Criteria;
import com.pky.mapper.BoardMapper;

import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Service
@RequiredArgsConstructor
@ToString
public class BoardServiceImpl implements BoardService{

	private final BoardMapper mapper;
	
	//게시글 리스트 조회
	@Override
	public List<BoardVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	//게시글 조회수
	@Override
	public int viewCount(Long board_no) {
		return mapper.viewCount(board_no);
	}
	
	//게시글 등록
	@Override
	public Long register(BoardVO board) {
		mapper.insertSelectKey(board);
		return board.getBoard_no();
	}

	//게시글 상세조회
	@Override
	public BoardVO get(Long board_no) {
		return mapper.read(board_no);
	}

	//게시글 수정
	@Override
	public int modify(BoardVO board) {
		return mapper.update(board);
	}

	//게시글 삭제
	@Override
	public int remove(Long board_no) {
		return mapper.delete(board_no);
	}

	//전체 게시글 수
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

}
