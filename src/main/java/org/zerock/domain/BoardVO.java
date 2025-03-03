package org.zerock.domain;

import java.util.Date;
import lombok.Data;

@Data

//掲示板情報を指定するVO
public class BoardVO {

	private Long bno;
	private String title;
	private String url;
	private String content;
	private String writer;
	private Date regdate;
	private Date updateDate;
	private int board_type;

}
