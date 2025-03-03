package org.zerock.service;

import org.zerock.domain.AuthVO;

//サービスクラスへ会員のレベルCRUDをさせるinterface
public interface AuthService {
	public void insert(String str);

	public void updateAuth(AuthVO auth);

	public boolean delete(AuthVO auth);
	
	public AuthVO readAuth(String id);
	
}
