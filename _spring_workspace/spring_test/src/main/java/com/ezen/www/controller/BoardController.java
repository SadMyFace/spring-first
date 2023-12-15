package com.ezen.www.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.www.domain.BoardVO;
import com.ezen.www.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board/*")
@Controller
public class BoardController {
	
	@Inject
	private BoardService bsv;
	
	//경로와 리턴의 값이 같을경우 생략가능
	// /board/register => /board/register
	@GetMapping("/register")
	public void register() { }
	
	//@RequestParam("name")String name : 파라미터 받을 때
	@PostMapping("/register")
	public String register(BoardVO bvo) {
		log.info(">>> bvo >> {} ", bvo);
		
		int isOk = bsv.register(bvo);
		
		//목적지 경로
		return "redirect:/board/list";
	}
	
	// /board/list => /board/list   void 처리해도 상관없음.
	@GetMapping("/list")
	public String list(Model m) {
		//리턴타입은 목적지 경로에 대한 타입 (destPage가 리턴이라고 생각)
		//Model 객체 => setAttribute 역할을 하는 객체
		m.addAttribute("list", bsv.getList());
		return "/board/list";
	}
	
	@GetMapping({"/detail","/modify"})
	public void detail(Model m, @RequestParam("bno") int bno) {
		log.info(">>>> bno > " + bno);
		
		log.info(">>> readcount check 1");
		int isOk = bsv.upReadCount(bno);
		
		log.info(">>> readcount update >>> {} " + ((isOk > 0) ? "OK" : "Fail"));
		
		log.info(">>> detail check 1");
		m.addAttribute("bvo", bsv.getDetail(bno));	
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO bvo) {
		log.info(">>>> bvo > " + bvo);
		
		int isOk = bsv.modify(bvo);
		
		log.info(">>> modify >>> {} " + ((isOk > 0) ? "OK" : "Fail"));
		
		return "redirect:/board/detail?bno="+bvo.getBno(); //bno가 필요
		
	}
	
}
