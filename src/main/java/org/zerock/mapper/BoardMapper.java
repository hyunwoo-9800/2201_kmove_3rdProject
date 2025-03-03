package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

//掲示物mapper
public interface BoardMapper {

	public List<BoardVO> getList();

	public List<BoardVO> getListWithPaging(Criteria cri);

//	public void insert(BoardVO board);

	public Integer insertSelectKey(BoardVO board);

	public BoardVO read(Long bno);

	public void delete(Long bno);

	public void update(BoardVO board);

	public int getTotalCount(Criteria cri);

	public BoardVO readUrl(String url);

}
