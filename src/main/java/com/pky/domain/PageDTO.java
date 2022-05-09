package com.pky.domain;

import lombok.Data;

@Data	
public class PageDTO {

	private int startPage, endPage;
	private boolean prev, next;
	private int total;
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		//마지막 페이지
		this.endPage =  (int) (Math.ceil(cri.getPageNum() / 10.0 )) * 10;

		//시작 페이지
		this.startPage = endPage - 9;
		
		//실제 마지막 페이지
		int realEnd = (int) ( Math.ceil((total * 1.0) / cri.getAmount()) );
		this.endPage = realEnd <= endPage ? realEnd : endPage;
		
		//이전 버튼
		this.prev = this.startPage > 1;
		
		//다음 버튼
		this.next = this.endPage < realEnd;
	}
}
