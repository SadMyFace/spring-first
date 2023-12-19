package com.ezen.www.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.www.domain.BoardVO;
import com.ezen.www.domain.PagingVO;
import com.ezen.www.handler.PagingHandler;
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
	public String list(Model m, PagingVO pgvo) {
		log.info(">>> pgvo >> {} ", pgvo);
		//리턴타입은 목적지 경로에 대한 타입 (destPage가 리턴이라고 생각)
		//Model 객체 => setAttribute 역할을 하는 객체
		m.addAttribute("list", bsv.getList(pgvo));
		
		//ph 객체 다시 생성 (pgvo, totalCount)
		int totalCount = bsv.getTotalCount();
		
		PagingHandler ph = new PagingHandler(pgvo, totalCount);
		m.addAttribute("ph", ph);
		
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
	
	@GetMapping("/remove")
	public String remove(@RequestParam("bno") int bno, RedirectAttributes re) {
		log.info(">>> bno >> {} " + bno);
		
		int isOk = bsv.remove(bno);
		//페이지가 새로고침 될 때 남아있을 필요가 없는 데이터
		//리다이렉트 될 때 데이터를 보내는 객체(RedirectAttribute)
		//한번만 일회성으로 데이터 보낼때 사용
		re.addFlashAttribute("isDel", isOk);
		
		return "redirect:/board/list";
		
	}
}
