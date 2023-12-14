package com.ezen.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Setter
@Getter
public class boardVO {
	
	private int bno;
	private String title;
	private String writer;
	private String contnet;
	private String isDel;
	private String reg_date;
	private int read_count;
	
	
	
}
