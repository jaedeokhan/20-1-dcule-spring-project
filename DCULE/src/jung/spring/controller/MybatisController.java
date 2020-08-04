package jung.spring.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jung.spring.dao.MemberDAOImpl;
import jung.spring.svc.MemberService;
import jung.spring.vo.Member;

@Controller
public class MybatisController {
	
	// 
	/*
	@Autowired
	private MemberDAOImpl memberDAOImpl;
	*/
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/main")
	public ModelAndView main(Locale locale) {

		ModelAndView result = new ModelAndView();
		List<Member> memberList = memberService.getMembers();
		result.addObject("result", memberList);
		result.setViewName("main");
		return result;
	}
	
	@RequestMapping(value ="/insert", method = RequestMethod.POST)
	public ModelAndView addMember(Member member){
		
		memberService.addMember(member);
		System.out.println("insert complete");
		
		ModelAndView result = new ModelAndView();
		List<Member> memberList = memberService.getMembers();
		result.addObject("result", memberList);
		result.setViewName("redirect:/main");
		return result;
	}
	
	
	@RequestMapping(value ="/delete")
	public ModelAndView removeMember(@RequestParam("id") int id){
		
		memberService.removeMember(id);
		System.out.println("delete complete");
		
		ModelAndView result = new ModelAndView();
		List<Member> memberList = memberService.getMembers();
		result.addObject("result", memberList);
		result.setViewName("redirect:/main");
		return result;
	}
	
	@RequestMapping("/updateForm")
	public ModelAndView update(@RequestParam("id") int id, Model model) {

		ModelAndView result = new ModelAndView();
		Member member = memberService.getModifyMember(id);
		result.addObject("member", member);
		result.setViewName("updateForm");
		return result;
	}
	
	@RequestMapping(value ="/update", method = RequestMethod.POST)
	public ModelAndView modifyMember(Member member){
		
		memberService.modifyMember(member);
		System.out.println("update complete");
		
		ModelAndView result = new ModelAndView();
		List<Member> memberList = memberService.getMembers();
		result.addObject("result", memberList);
		result.setViewName("redirect:/main");
		return result;
	}
}
