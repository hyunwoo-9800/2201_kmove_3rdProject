package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.AuthVO;
import org.zerock.mapper.AuthMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class AuthServiceImpl implements AuthService {

	
	@Setter(onMethod_ = {@Autowired})
	private AuthMapper mapper;
	
//	会員レベルを追加
	@Override
	public void insert(String str) {
		// TODO Auto-generated method stub

		log.info("member register..... " + str );
		
		mapper.insert(str);
	}

//	会員レベルを修正
	@Override
	public void updateAuth(AuthVO auth) {
		
		log.info("update......" + auth);
		
		mapper.updateAuth(auth);
	
	}

//	会員レベルを削除
	@Override
	public boolean delete(AuthVO auth) {
		// TODO Auto-generated method stub
		return false;
	}

//	会員レベルを読む
	@Override
	public AuthVO readAuth(String id) {
		// TODO Auto-generated method stub
		
		log.info("Get List :" + id);
		
		return mapper.readAuth(id);
	}

	
	
}
