package com.pky.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pky.domain.MemberVO;
import com.pky.service.MemberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/member/*")
public class MemberController {

	public final MemberService service;
	
	//회원가입 페이지로 이동
	@GetMapping("/join")
	public String joinGet() {
		return "member/join";
	}
	
	//회원가입 
	@PostMapping("/join")
	public String join(MemberVO member) {
		int result = service.idChk(member);
		if(result == 1) {
			return "/member/join";
		}else if(result == 0) {
			service.join(member);
		}
		return "redirect:/";
	}
	
	//로그인 페이지로 이동
	@GetMapping("/login")
	public String loginGet() {
		return "member/login";
	}
	
	//로그인
	@PostMapping("/login")
	public String login(MemberVO member, HttpServletRequest request, RedirectAttributes rttr) {
		HttpSession session = request.getSession();
		MemberVO login = service.login(member);
		if(login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("result", false);
		}else {
			session.setAttribute("member", login);
		}
		return "redirect:/";
	}
	
	//로그아웃 
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	//회원정보 수정 페이지로 이동
	@GetMapping("modify")
	public String memberUpdateView() {
		return "member/modify";
	}
	
	//회원정보 수정 
	@PostMapping("modify")
	public String memberUpdate(MemberVO member, HttpSession session) {
		service.update(member);
		session.invalidate();
		return "redirect:/";
	}
	
	//회원탈퇴 페이지로 이동
	@GetMapping("delete")
	public String memberDeleteView() {
		return "member/delete";
	}
	
	//회원탈퇴
	@PostMapping("delete")
	public String memberDelete(MemberVO member, HttpSession session, RedirectAttributes rttr) {
		MemberVO vo = (MemberVO)session.getAttribute("member");
		if(vo == null) {
			return "redirect:/";
		}
		//세션에 있는 비밀번호
		String sessionPw = vo.getUserPw();
		//member로 들어오는 비밀번호
		String memPw = member.getUserPw();
		
		if(!(sessionPw.equals(memPw))) {
			rttr.addFlashAttribute("result", false);
			return "redirect:/member/delete";
		}
		service.delete(member);
		session.invalidate();
		return "redirect:/";
	}
	
	//회원탈퇴 시, 비밀번호 체크
	@ResponseBody
	@PostMapping("/pwChk")
	public int pwChk(MemberVO member) {
		int result = service.pwChk(member);
		return result;
	}
	
	//회원가입 시, 아이디 중복 확인
	@ResponseBody
	@PostMapping("/idChk")
	public int idChk(MemberVO member) {
		int result = service.idChk(member);
		return result;
	}
}
