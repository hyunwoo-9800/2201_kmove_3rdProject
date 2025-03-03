package org.zerock.mapper;

import org.zerock.domain.AuthVO;

//会員レベルmapper
public interface AuthMapper {

	public void insert(String str);
	public void updateAuth(AuthVO auth);
	public void delete(AuthVO auth);
	public AuthVO readAuth(String id);
	
}
