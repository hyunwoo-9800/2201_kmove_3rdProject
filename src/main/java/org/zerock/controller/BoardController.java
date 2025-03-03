package org.zerock.controller;

import java.util.Date;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

//掲示板Controller
@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;

//	register、mainHome、gil、infomation、schoolinfo、seinenbuページへ異動するGetMapping
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register() {

	}
	
	@GetMapping("/mainHome")
	public void mainHome() {
		
	}
	
	@GetMapping("/gil")
	public void gil() {
		
	}
	
	@GetMapping("/infomation")
	public void infomation() {
		
	}
	
	@GetMapping("/schoolinfo")
	public void schoolinfo() {
		
	}
	
	@GetMapping("/seinenbu")
	public void seinenbu() {
		
	}

//	全ての掲示板を整列するGetMapping
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {

		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));
		// model.addAttribute("pageMaker", new PageDTO(cri, 123));

		int total = service.getTotal(cri);

		log.info("total: " + total);

		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}

//要請がPostMappingの/registerの場合、掲示物を登録をコントロールする
	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String register(BoardVO board, RedirectAttributes rttr) {

		log.info("==========================");

		service.insertSelectKey(board);

		rttr.addFlashAttribute("result", board.getBno());

		return "redirect:/board/list?type=" + board.getBoard_type();
	}

//	要請がGetMappingの/get、/modifyの場合、該当する掲示物を読む
	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model, BoardVO board) {
		
		log.info("/get or modify");
		model.addAttribute("board", service.read(bno));
		//model.addAttribute("board", service.readUrl(url));
		
	}

//	要請がPostMappingのmodify場合、該当する掲示物を修正する
	@PostMapping("/modify")
	public String modify(@RequestParam("bno") Long bno, @RequestParam("title") String title,
			@RequestParam("url") String url, @RequestParam("content") String content,
			@RequestParam("writer") String writer, @RequestParam("regdate") Date regdate,
			@RequestParam("updateDate") Date updateDate, @RequestParam("board_type") int board_type,
			@ModelAttribute("cri") Criteria cri, Model model, BoardVO board) {
		
		board.setBno(bno);
		board.setTitle(title);
		board.setUrl(url);
		board.setContent(content);
		board.setWriter(writer);
		board.setRegdate(regdate);
		//board.setUpdateDate(updateDate);
		board.setBoard_type(board_type);
		
		log.info("modify:" + board);

		service.update(board);
		return "redirect:/board/list" + cri.getListLink();

	}

//	要請がPostMappingのremove時、番号を得て掲示物を削除する
	@PostMapping("/remove")
	public void remove(@RequestParam("bno") Long bno,
			Criteria cri) {

		log.info("remove..." + bno);

		service.delete(bno);
	}

}
