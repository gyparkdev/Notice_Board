package com.pky.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

	private Long board_no;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updateDate;
	private Long viewCnt;
}
