package com.ezen.www.repository;

import java.util.List;

import com.ezen.www.domain.CommentVO;

public interface CommentDAO {

	int insert(CommentVO cvo);

	List<CommentVO> getList(int bno);

	int remove(int cno);

	int modify(CommentVO cvo);

}
