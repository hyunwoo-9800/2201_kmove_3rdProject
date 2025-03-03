package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;

//サービスクラスへ会員情報のCRUDをさせるinterface
public interface MemberService {
	
	public MemberVO read(String id);

	public void insert(MemberVO member);
	
	public void update(MemberVO member);
	
	public List<MemberVO> getList(Criteria cri);

	public int getTotal(Criteria cri);
	
	public List<MemberVO> readBango(MemberVO member);
	
	public int idChk(String id);
	
}
