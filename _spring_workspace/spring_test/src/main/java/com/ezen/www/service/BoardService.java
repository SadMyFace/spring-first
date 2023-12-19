package com.ezen.www.service;

import java.util.List;

import com.ezen.www.domain.BoardVO;
import com.ezen.www.domain.PagingVO;

public interface BoardService {

	int register(BoardVO bvo);

	List<BoardVO> getList(PagingVO pgvo);

	int upReadCount(int bno);

	BoardVO getDetail(int bno);

	int modify(BoardVO bvo);

	int remove(int bno);

	int getTotalCount();

}
