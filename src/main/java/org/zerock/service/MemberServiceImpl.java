package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_ = { @Autowired } )
	private MemberMapper mapper;
	
//　作業が正しく終了したら会員情報を登録する。	
	@Transactional
	@Override
	public void insert(MemberVO member) {
		// TODO Auto-generated method stub

		log.info("member register..... " + member );
		
		mapper.insert(member);
		
	}

//	作業が正しく終了したら会員情報を修正する。
	@Transactional
	@Override
	public void update(MemberVO member) {

		log.info("update......" + member);
		
		mapper.update(member);

	}

//	会員情報のページング処理
	@Override
	public List<MemberVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		
		log.info("Get List with criteria: " + cri);
		
		return mapper.getListWithPaging(cri);
	}

//	会員IDで会員情報を読む
	@Override
	public MemberVO read(String id) {
		// TODO Auto-generated method stub
		
		log.info("get... : " + id );
		
		return mapper.read(id);
	}

//	会員情報総合を計算
	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		
		log.info("get total count");
		return mapper.getTotalCount(cri);
	
	}

//	特定会員情報を読む
	@Override
	public List<MemberVO> readBango(MemberVO member) {
		// TODO Auto-generated method stub
		return mapper.readBango(member);
	}

//	会員のID重複を防ぐ。
	@Override
	public int idChk(String id) {
		// TODO Auto-generated method stub
		
		return mapper.idChk(id);
	
	}
	
}
