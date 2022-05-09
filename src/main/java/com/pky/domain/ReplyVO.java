package com.pky.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

	private Long board_no;
	private Long reply_no;
	private String content;
	private String writer;
	private Date regdate;
}
