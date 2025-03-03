package org.zerock.controller;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.AuthVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;
import org.zerock.service.AuthService;
import org.zerock.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

//管理者Controller
@Controller
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor
public class AdminController {

	private MemberService service;
	private AuthService authService;

//GetMappingが /admin_pageの場合、会員番号を読んで、member変数にセーブしてsessionへ伝達
	@GetMapping("/admin_page")
	public void memberList(MemberVO member, Model model) {

		log.info("member: " + member);
		model.addAttribute("member", service.readBango(member));

	}

//admin_searchの要請がGETの場合、会員情報を読み込んでsessionへ伝達
	@RequestMapping(value = "/admin_search", method = RequestMethod.GET)
	public void getSearch(@RequestParam("id") String id, Model model, MemberVO member) {
		
		model.addAttribute("member", service.read(id));
		model.addAttribute("auth", authService.readAuth(id));
		
	}

//admin_updateの要請がGETの場合、会員情報を読み込んでsessionへ伝達
	@RequestMapping(value = "/admin_update", method = RequestMethod.GET)
	public void getUpdate(@RequestParam("id") String id, Model model, MemberVO member) {
		
		model.addAttribute("member", service.read(id));
		model.addAttribute("auth", authService.readAuth(id));
	}

//admin_updateの要請がPOSTの場合、sessionからパラメータを得て会員情報を修正する
	@RequestMapping(value = "/admin_update", method = RequestMethod.POST)
	public String postUpdate(@RequestParam("bango") int bango, @RequestParam("id") String id,
			@RequestParam("password") String password, @RequestParam("namae") String namae, 
			@RequestParam("tannjyoubi") String tannjyoubi, @RequestParam("mail") String mail,
			@RequestParam("dennwabanngo") String dennwabanngo,
			@RequestParam("regDate") Date regDate, @RequestParam("authority") String authority,
			MemberVO member, AuthVO auth, Model model) {
		
		member.setBango(bango);
		member.setId(id);
		member.setPassword(password);
		member.setNamae(namae);
		member.setTannjyoubi(tannjyoubi);
		member.setMail(mail);
		member.setDennwabanngo(dennwabanngo);
		member.setRegDate(regDate);
		auth.setAuthority(authority);
		auth.setId(id);
		
		service.update(member);
		authService.updateAuth(auth);
		return "redirect:/admin/admin_page";
	}

}