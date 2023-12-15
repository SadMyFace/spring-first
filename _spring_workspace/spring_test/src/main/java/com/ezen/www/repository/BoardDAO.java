package com.ezen.www.repository;

import java.util.List;

import com.ezen.www.domain.BoardVO;

public interface BoardDAO {

	int insert(BoardVO bvo);

	List<BoardVO> selectList();

	int updateReadcount(int bno);

	BoardVO getDetail(int bno);

	int modify(BoardVO bvo);

}
