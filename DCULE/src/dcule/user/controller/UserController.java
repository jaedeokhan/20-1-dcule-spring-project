package dcule.user.controller;


import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dcule.user.svc.UserService;
import dcule.user.vo.Authenticate;
import dcule.user.vo.User;

@Controller
@RequestMapping("/user")
public class UserController {
	private static final Logger log = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	// 회원가입 form, confirm
	@RequestMapping("/join/form")
	public ModelAndView userRegisterForm(ModelAndView mav) {
		log.debug("test 성공");
		mav.addObject("user", new User()); // 입력 폼과 매핑
		mav.setViewName("user/userJoin");
		return mav;
	}	
		
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String userRegisterConfirm(@Valid User user, BindingResult bindingResult) { // 유효성 테스트
		log.debug("User : {} " + user);
		if (bindingResult.hasErrors()) {
			log.debug("Binding Result has error!");
			List<ObjectError> errors = bindingResult.getAllErrors();
			for (ObjectError error : errors) {
				log.debug("error : {}" + error.getDefaultMessage());
			}
			return "user/userJoin";
		}
		// INSERT 
		userService.addUser(user);
		System.out.println("insert complete!");
		return "redirect:/user/login/form";
		
	}
	
	// 회원가입 아이디 중복 체크 ajax 통신
	@ResponseBody
	@RequestMapping(value="/join/idCheck")
	public int idCheck(@RequestParam("userId") String users, ModelAndView mav) {
		System.out.println("id check");
		int data = 0;
		data = userService.idCheck(users);
		return data;	
	}
	
	// 로그인  폼
	@RequestMapping(value="/login/form")
	public ModelAndView userLogin(ModelAndView mav) {
		log.debug("Login Form===================");
		mav.addObject("authenticate", new Authenticate());
		mav.setViewName("user/userLogin");
		return mav;
	}	
	
	// 로그인
	@RequestMapping(value="/login")
	public String userLoginForm(@Valid Authenticate auth, BindingResult bindingResult, Model model, HttpSession session) {
		log.debug("Login Action===================");
		if (bindingResult.hasErrors()) {
			return "user/userLogin";
		}
		Authenticate authenticate = userService.loginCheck(auth);
		log.debug("authenticate {} " + authenticate);
		if (authenticate == null) { // 사용자의 비밀번호와 아이디가 일치 x
			model.addAttribute("errorMessage", "로그인 시도가 실패했습니다. 사용자의 이름과 암호가 올바른지 확인하십시오.");
			return "user/userLogin";
		} else { // 로그인 성공
			// TODO 성공 처리 : 세션에 사용자 정보 저장
			session.setAttribute("userId", authenticate.getUserId());
			return "redirect:/evaluation/main/form";
		}
	}
	
	// 로그아웃
	@RequestMapping(value="/logout")
	public String logout(Model model, HttpSession session) {
		session.removeAttribute("userId");
		return "redirect:/user/login/form";
	}
	
	// 회원개인정보수정 폼
	@RequestMapping(value="/{userId}/info/form") 
	public String updateFrom(@PathVariable String userId, User user_, Model model, HttpSession session) {
		if (userId == null) { // userId 가 안넘어올때
			throw new IllegalArgumentException("사용자 아이디가 필요합니다.");
		}
		
		Object temp = session.getAttribute("userId");
		if (temp == null) { // 세션에 userId가 없을때
			session.setAttribute("loginErrorType","오류 메시지");
			session.setAttribute("loginErrorContent", "로그인을 해주세요.");
			return "redirect:/user/login/form";
		}
		
		String userId_ = (String)temp; 
		if (!user_.matchUserId(userId_)) { // 현재 세션의 userId와 사용자의 userId 세션을 비교 
			session.setAttribute("loginErrorType","오류 메시지");
			session.setAttribute("loginErrorContent", "로그인을 해주세요.");
			return "redirect:/user/login/form";
		}
		
		User user = userService.findById(userId);
		model.addAttribute("user", user);
		return "user/userForm";
	}
	
	// 개인정보수정 
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String userUpdateConfirm(@Valid User user, BindingResult bindingResult, Model model, HttpSession session) { // 유효성 테스트
		log.debug("User : {} " + user);
		if (bindingResult.hasErrors()) {
			log.debug("Binding Result has error!");
			List<ObjectError> errors = bindingResult.getAllErrors();
			for (ObjectError error : errors) {
				log.debug("error : {}" + error.getDefaultMessage());
			}
			return "user/userForm";
		}
		
		Object temp = session.getAttribute("userId");
		if (temp == null) { // 세션에 userId가 없을때
			session.setAttribute("loginErrorType","오류 메시지");
			session.setAttribute("loginErrorContent", "로그인을 해주세요.");
			return "redirect:/user/login/form";
		}
		
		String userId = (String)temp; 
		if (!user.matchUserId(userId)) { // 현재 세션의 userId와 사용자의 userId 세션을 비교 
			session.setAttribute("loginErrorType","오류 메시지");
			session.setAttribute("loginErrorContent", "로그인을 해주세요.");
			return "redirect:/user/login/form";
		}
		
		userService.modifyUser(user);
		model.addAttribute("successMessage", "개인정보 수정을 완료했습니다.");
		System.out.println("update complete!");
		return "user/userForm";
	}
	
	
		
		
}
