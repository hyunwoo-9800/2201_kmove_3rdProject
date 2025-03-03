package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

//サービスクラスへ掲示板のCRUDをさせるinterface
public interface BoardService {

	public int insertSelectKey(BoardVO board);

	public BoardVO read(Long bno);

	public void update(BoardVO board);

	public void delete(Long bno);

	// public List<BoardVO> getList();

	public List<BoardVO> getList(Criteria cri);

	// 추가
	public int getTotal(Criteria cri);

	public BoardVO readUrl(String url);
}
