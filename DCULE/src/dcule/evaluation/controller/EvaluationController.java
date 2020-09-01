package dcule.evaluation.controller;

import java.util.List;

import javax.jws.soap.SOAPBinding.Use;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dcule.evaluation.svc.EvaluationService;
import dcule.evaluation.vo.Evaluation;
import dcule.evaluation.vo.EvaluationModify;
import dcule.user.controller.UserController;
import dcule.user.vo.Authenticate;
import dcule.user.vo.User;

@Controller
@RequestMapping("/evaluation")
public class EvaluationController {
	private static final Logger log = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private EvaluationService evaluationService;
	
	// 강의평가 리스트
	@RequestMapping("/main/form")
	public ModelAndView evaluationRegistForm(ModelAndView mav, Model model, Evaluation evaluation) {
		log.debug("강의평가 리스트 =======================");
		List<Evaluation> list = evaluationService.getEvaluationList(evaluation);
		model.addAttribute("evaluationList", list); 
		mav.setViewName("evaluation/main");
		model.addAttribute("evaluation", new Evaluation()); // 입력 폼과 매핑
		return mav;
	}

	// 강의평가 번호에 해당하는 상세정보
	@RequestMapping(value="/list/{evaluationId}") 
	public String evaluationDetail(@PathVariable String evaluationId, Model model) {
		log.debug("강의평가 상세정보 =====================");
		Evaluation evaluation = evaluationService.findByEvaluationId(evaluationId);
		model.addAttribute("evaluation", evaluation);
		return "evaluation/evaluationDetail";
	}
	
	
	// 강의평가 등록
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String evaluationRegist(@Valid Evaluation evaluation, BindingResult bindingResult, HttpSession session) { // 유효성 테스트
		log.debug("강의평가 등록========================");
		log.debug("Evaluation : {} " + evaluation);
		if (bindingResult.hasErrors()) { // 실패
			log.debug("Binding Result has error!");
			List<ObjectError> errors = bindingResult.getAllErrors();
			for (ObjectError error : errors) {
				log.debug("error : {}" + error.getDefaultMessage());

			}
			session.setAttribute("messageType","오류 메시지");
			session.setAttribute("messageContent", "강의평가 등록을 실패했습니다.");
			return "redirect:/evaluation/main/form";
		}
		
	  Object temp = session.getAttribute("userId"); 
	  if (temp == null) { // 세션에 id 가 존재 x 
	  session.setAttribute("messageType","오류 메시지");
	  session.setAttribute("messageContent", "로그인을 하고 강의평가 등록을 해주세요. - 세션 x");
	  return "redirect:/evaluation/main/form"; 
	  }
		 
 
	  log.debug("userId = " + evaluation.getUserId());
      evaluationService.addEvaluation(evaluation); // 강의평가 등록 성공
	  System.out.println("insert complete!");
	  session.setAttribute("messageType","성공 메시지");
	  session.setAttribute("messageContent", "강의평가 등록을 성공했습니다.");
	  return "redirect:/evaluation/main/form";
	}
	
	// 강의평가 수정 폼
	@RequestMapping(value="/edit/{evaluationId}/form")
	public ModelAndView evaluationUpdateForm(@PathVariable String evaluationId, ModelAndView mav) {
		log.debug("강의평가 수정  Form===================");
		Evaluation evaluation = evaluationService.findByEvaluationId(evaluationId);
		mav.addObject("evaluation", evaluation);
		mav.setViewName("evaluation/evaluationEdit");
		return mav;
	}	
	
	// 강의평가정보수정  
	@RequestMapping(value="/edit/{evaluationId}", method=RequestMethod.POST)
	public String evaluationUpdate(@PathVariable String evaluationId, @Valid Evaluation evaluation, BindingResult bindingResult, Model model, HttpSession session) { 
		// TODO : 에러처리
		log.debug("강의평가 수정 =================");
		log.debug("Evaluation : {} " + evaluation);
		if (bindingResult.hasErrors()) {
			log.debug("Binding Result has error!");
			List<ObjectError> errors = bindingResult.getAllErrors();
			for (ObjectError error : errors) {
				log.debug("error : {}" + error.getDefaultMessage());
			}
			session.setAttribute("messageType","오류 메시지");
			session.setAttribute("messageContent", "강의평가 수정을 실패했습니다.");
			return "redirect:/evaluation/edit/" + evaluationId;
		}
		evaluationService.modifyEvaluation(evaluation); 
		session.setAttribute("messageType","성공 메시지");
		session.setAttribute("messageContent", "강의평가 수정을 성공했습니다.");
		System.out.println("강의평가 update complete!");
		return "redirect:/evaluation/list/" + evaluationId;
	}
	
	// 강의평가 삭제
	@RequestMapping(value="/remove/{evaluationId}") 
	public String evaluationRemove(@PathVariable String evaluationId, Model model, HttpSession session) {
		log.debug("강의평가 삭제 =====================");
		evaluationService.removeEvaluation(evaluationId);
		session.setAttribute("removeType", "성공 메시지");
		session.setAttribute("removeContent", "강의평가 삭제를 성공했습니다.");
		return "redirect:/evaluation/main/form";
	}
	
	
	/*
	 * // 수정하기 위한 사용자 아이디, 글 번호에 해당하는 내용 가져오기
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="/main/checkIdOverLap") public int
	 * modifyIdCheck(@RequestParam("userId") String
	 * userId, @RequestParam("evaluationId") int evaluationId, Model model) {
	 * log.debug("userId : " + userId); log.debug("evaluationId : " + evaluationId);
	 * System.out.println("checkIdOverLap start => "); int data = 0; Evaluation
	 * evaluation = evaluationService.findByUserIdAndEvaluationId(userId,
	 * evaluationId); model.addAttribute("evaluation", evaluation);
	 * log.debug("evaluation : {}" + evaluation); if (evaluation != null) { data =
	 * 1; } log.debug("data : " + data); return data; }
	 */
}
