package org.zerock.domain;


import lombok.Data;

@Data
//会員IDと会員レベルを指定するVO
public class AuthVO {

  private String id;
  private String authority;
  
}
