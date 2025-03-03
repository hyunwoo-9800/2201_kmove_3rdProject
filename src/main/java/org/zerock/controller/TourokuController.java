package org.zerock.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.MemberVO;
import org.zerock.service.AuthService;
import org.zerock.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value = "/member/*")

//会員登録をコントロールするController
public class TourokuController {

	@Autowired
	private MemberService service;

	@Autowired
	private AuthService authService;

	@Setter(onMethod_ = { @Autowired })
	private PasswordEncoder pwencoder;

	// 会員登録 get
	@RequestMapping(value = "/touroku", method = RequestMethod.GET)
	public void getInsert() {

	}
	
	// 会員登録 get
	@RequestMapping(value = "/touroku2", method = RequestMethod.GET)
	public void getInsert2() {

	}

	// 会員登録 post
	@RequestMapping(value = "/touroku", method = RequestMethod.POST)
	public String postInsert2(MemberVO member, Model model) {

		int result = service.idChk(member.getId());

		MemberVO mem = member;

		try {

			if (result == 1) {

				model.addAttribute("error", "登録されているIDです。他のIDを入力してください");
				return "redirect:/member/touroku2";
			}

		} catch (Exception e) {
			// TODO: handle exception

			mem.setPassword(pwencoder.encode(member.getPassword())); // パスワード暗号化エンコーディング
			service.insert(mem);
			authService.insert(mem.getId());
			return "redirect:/board/mainHome";

		}
		
		return "redirect:/board/mainHome";
	
	}
	
	// 会員登録 post
	@RequestMapping(value = "/touroku2", method = RequestMethod.POST)
	public String postInsert(MemberVO member, Model model) {

		int result = service.idChk(member.getId());
		MemberVO mem = member;

		try {

			if (result == 1) {

				model.addAttribute("error", "登録されているIDです。他のIDを入力してください");
				return "redirect:/member/touroku2";
			}

		} catch (Exception e) {
			// TODO: handle exception

			mem.setPassword(pwencoder.encode(member.getPassword())); // パスワード暗号化エンコーディング
			service.insert(mem);
			authService.insert(mem.getId());
			return "redirect:/board/mainHome";

		}
		
		return "redirect:/board/mainHome";
	
	}
}

