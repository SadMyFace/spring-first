package com.ezen.www.service;

import java.util.List;

import com.ezen.www.domain.BoardVO;

public interface BoardService {

	int register(BoardVO bvo);

	List<BoardVO> getList();

	int upReadCount(int bno);

	BoardVO getDetail(int bno);

	int modify(BoardVO bvo);

}
