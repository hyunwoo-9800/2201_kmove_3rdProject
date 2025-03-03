package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = {@Autowired})
	private BoardMapper mapper;

//	作業が正しく終了したら掲示物を登録する。
	@Transactional
	@Override
	public int insertSelectKey(BoardVO board) {

		log.info("register......" + board);

		return mapper.insertSelectKey(board);

	}

//	掲示板をリストを読む
	@Override
	public BoardVO read(Long bno) {

		log.info("get......" + bno);

		return mapper.read(bno);

	}

//	作業が正しく終了したら掲示物を修正する。
	@Transactional
	@Override
	public void update(BoardVO board) {

		log.info("modify......" + board);
		
		mapper.update(board);

	}

//	作業が正しく終了したら掲示物を削除する。
	@Transactional
	@Override
	public void delete(Long bno) {

		log.info("remove...." + bno);

		mapper.delete(bno);
	}

//	掲示物のリストをページングする
	@Override
	public List<BoardVO> getList(Criteria cri) {

		log.info("get List with criteria: " + cri);

		return mapper.getListWithPaging(cri);
	}

//	掲示物の総合を計算
	@Override
	public int getTotal(Criteria cri) {

		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

//　掲示物のURLを読む
	@Override
	public BoardVO readUrl(String url) {
		// TODO Auto-generated method stub
		
		log.info("readUrl");
		
		return mapper.readUrl(url);
	}

}
