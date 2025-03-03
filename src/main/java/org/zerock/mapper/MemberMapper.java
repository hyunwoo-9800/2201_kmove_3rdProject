package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;

//会員情報mapper
public interface MemberMapper {

	public MemberVO read(String id);

	public void insert(MemberVO member);

	public void update(MemberVO member);

	public List<MemberVO> getListWithPaging(Criteria cri);

	public Integer insertSelectKey(MemberVO member);

	public int getTotalCount(Criteria cri);
	
	public int idChk(String id);

	public List<MemberVO> readBango(MemberVO member);

}
