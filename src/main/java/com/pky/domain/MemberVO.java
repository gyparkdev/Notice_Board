package com.pky.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {

	private String userId;
	private String userPw;
	private String userName;
	private String userEmail;
	private Date regDate;
}
