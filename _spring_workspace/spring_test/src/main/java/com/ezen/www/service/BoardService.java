package com.ezen.www.service;

import java.util.List;

import com.ezen.www.domain.BoardDTO;
import com.ezen.www.domain.BoardVO;
import com.ezen.www.domain.PagingVO;

public interface BoardService {

	int register(BoardDTO bdto);

	List<BoardVO> getList(PagingVO pgvo);

	int upReadCount(int bno);

	BoardDTO getDetail(int bno);

	int modify(BoardVO bvo);

	int remove(int bno);

	int getTotalCount(PagingVO pgvo);

	int removeImage(String uuid);

}
