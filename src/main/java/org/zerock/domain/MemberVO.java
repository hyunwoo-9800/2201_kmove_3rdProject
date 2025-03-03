package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
//会員情報を指定するVO
public class MemberVO {

	private int bango;
	private String id;
	private String password;
	private String namae;
	private String tannjyoubi;
	private String mail;
	private String dennwabanngo;

	private Date regDate;
	private List<AuthVO> authList;

}
