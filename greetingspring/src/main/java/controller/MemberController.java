package controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dao.MemberDAO;
import dao.ResumeDAO;
import dao.BusinessDAO;
import model.Business;
import model.Member;
import model.Resume;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	Model model;
	HttpSession session;
	HttpServletRequest request;
	
	@Autowired
	MemberDAO memberDao = new MemberDAO();
	
	@Autowired
	BusinessDAO businessDao = new BusinessDAO();
	
	@Autowired
	ResumeDAO resumeDao = new ResumeDAO();

	@ModelAttribute
	protected void service(HttpServletRequest request, Model model)
			throws ServletException, IOException {
		this.request = request;
		this.model = model;
		session = request.getSession();
		System.out.println("service");
	}

	// 메인
	@RequestMapping("main")
	public String main() throws ServletException, IOException {
		String businessId = (String) session.getAttribute("businessId");
		Business business = businessDao.getBusiness(businessId);
		model.addAttribute("business", business);
		
		return "main";
	}

	// 회원 가입 폼
	@RequestMapping("member-join")
	public String memberJoin()
			throws ServletException, IOException {

		return "member/memberJoin";
	}

	// 회원 가입 처리
	@RequestMapping("member-join-pro")
	public String memberJoinPro()
			throws ServletException, IOException, ParseException {

		request.setCharacterEncoding("utf-8");
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		String name = request.getParameter("name");
		int gender = Integer.parseInt((request.getParameter("gender")));
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String birth = request.getParameter("birth");

		Member member = new Member();

		member.setMemberId(memberId);
		member.setMemberPw(memberPw);
		member.setName(name);
		member.setGender(gender);
		member.setEmail(email);
		member.setPhone(phone);
		member.setBirth(birth);

		System.out.println(member);

		int num = memberDao.insertMember(member);

		String msg = "";
		String url = "";

		if (num > 0) {
			msg = name + "님이 회원가입이 완료 되었습니다.";
			url = "member-login";
		} else {
			msg = "회원가입이 실패 하였습니다. 다시 시도해 주세요";
			url = "member-join";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "alert";
	}

	// 로그인 폼
	@RequestMapping("member-login")
	public String login() throws ServletException, IOException {

		return "member/memberLogin";
	}

	// 로그인 메인 폼
	@RequestMapping("member-main")
	public String memberMain()
			throws ServletException, IOException {

		String memberId = (String) session.getAttribute("memberId");
		Member member = memberDao.getMember(memberId);
//		int resumeId = resumeDao.selectResumeId();
		List<Resume> memberResumeList = resumeDao.getMemberResumeList(memberId);

		String profileImage;

		if (memberResumeList.size() == 0) {
			profileImage = "";
		} else {
			int listNum = memberResumeList.size() - 1;
			profileImage = memberResumeList.get(listNum).getProfileImage();
		}
		model.addAttribute("profileImage", profileImage);

		model.addAttribute("memberResumeList", memberResumeList);
		model.addAttribute("member", member);

		return "member/memberMain";
	}

	@RequestMapping("update-profileImage")
	public String updateProFileImage(@RequestParam("profileImageFile") MultipartFile multipartFile)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String path = request.getServletContext().getRealPath("/") + "img/member/";
//		MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "UTF-8");
//		String profileImage = multi.getFilesystemName("profileImage");
		
		String profileImage = "";
		if(!multipartFile.isEmpty()) {
			File file = new File(path, multipartFile.getOriginalFilename());
			profileImage=multipartFile.getOriginalFilename();
			multipartFile.transferTo(file);
		}
		
		String memberId = (String) session.getAttribute("memberId");
		Member member = memberDao.getMember(memberId);

		String url = "";
		String msg = "";

		if (profileImage != "") {
			member.setProfileImage(profileImage);
			int num = memberDao.updateProfileImage(member.getProfileImage(), memberId);
			
			if (num > 0) {
				msg = "프로필 이미지가 업데이트 되었습니다.";
				url = "member-main";
			} else {
				msg = "프로필 이미지 업데이트에 실패했습니다.";
				url = "member-main"; // 실패 시 경로 설정
			}
		} else {
			msg = "이미지를 선택 해주세요.";
			url = "member-main"; // 이미지가 업로드되지 않았을 때 경로 설정
		}

		System.out.println(member.getProfileImage());
		System.out.println(profileImage);

		session.setAttribute("member", member);

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "alert";
	}

	// 로그인 처리
	@RequestMapping("member-login-pro")
	public String memberLoginPro(String memberId, String memberPw)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
//		String memberId = request.getParameter("memberId");
//		String memberPw = request.getParameter("memberPw");

		String msg = "";
		String url = "member-main";
		Member member = memberDao.getMember(memberId);
		
		if (member != null) {
			if (memberPw.equals(member.getMemberPw())) {
				session.setAttribute("memberId", memberId);
				System.out.println("session.getAttribute(memberId):"+session.getAttribute("memberId"));
				msg = member.getName() + "님이 로그인 하셨습니다.";

			} else {
				msg = "비밀번호가 맞지 않습니다.";
				url = "member-login";
			}

		} else {

			msg = "id를 확인하세요.";
			url = "member-login";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "alert";
	}

	// 회원 정보
	@RequestMapping("member-info")
	public String memberInfo()
			throws ServletException, IOException {

		String memberId = (String) session.getAttribute("memberId");
		Member member = memberDao.getMember(memberId);

		model.addAttribute("member", member);
		model.addAttribute("nav", "memberinfo");

		return "member/memberInfo";
	}

	// 로그아웃
	@RequestMapping("member-logout")
	public String memberLogout()
			throws ServletException, IOException {

		session.invalidate();
		model.addAttribute("msg", "로그아웃 되었습니다.");
		model.addAttribute("url", "main");

		return "alert";
	}

	// 회원 정보 수정
	@RequestMapping("member-update")
	public String memberUpdate()
			throws ServletException, IOException {

		String memberId = (String) session.getAttribute("memberId");
		Member member = memberDao.getMember(memberId);

		model.addAttribute("member", member);
		model.addAttribute("nav", "memberinfo");

		return "member/memberUpdate";
	}
	
	// 정보 수정 처리
	@RequestMapping("member-update-pro")
	public String memberUpdatePro(Member member)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
//		String memberId = request.getParameter("memberId");
//		String memberPw = request.getParameter("memberPw");
//		String email = request.getParameter("email");
//		String phone = request.getParameter("phone");
//		String birth = request.getParameter("birth");

		Member memberDb = memberDao.getMember(member.getMemberId());
//		Member member = new Member();

//		member.setMemberId(memberId);
//		member.setMemberPw(memberPw);
//		member.setEmail(email);
//		member.setPhone(phone);
//		member.setBirth(birth);

		String msg = "";
		String url = "";

		if (memberDb != null) {
			if (memberDb.getMemberPw().equals(member.getMemberPw())) {
				msg = "수정 하였습니다.";
				memberDao.updateMember(member);
				url = "member-info";
			} else {
				System.out.println(memberDb.getMemberPw());
				System.out.println(member.getMemberPw());
				msg = "비밀번호가 맞지 않습니다.";

			}
		} else {
			msg = "수정할 수 없습니다.";
			url = "member-update";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "alert";
	}

	// 회원 비밀번호 수정
	@RequestMapping("member-change-pw")
	public String memberChangePw()
			throws ServletException, IOException {

		String memberId = (String) session.getAttribute("memberId");
		Member member = memberDao.getMember(memberId);

		model.addAttribute("member", member);

		return "member/memberChangePw";
	}

	// 회원 비밀번호 수정 처리
	@RequestMapping("member-change-pw-pro")
	public String memberChangePwPro(String memberPw, String changePw)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String memberId = (String) session.getAttribute("memberId");
//		String memberPw = request.getParameter("memberPw");
//		String changePw = request.getParameter("changePw");

		Member memberDb = memberDao.getMember(memberId);

		String msg = "";
		String url = "member-chang-pw";

		if (memberDb != null) {
			if (memberDb.getMemberPw().equals(memberPw)) {
				msg = "비밀번호를 변경 하였습니다.";
				session.invalidate();
				memberDao.changePw(memberId, changePw);
				url = "member-login";
			} else {
				msg = "비밀번호가 맞지 않습니다.";
			}
		} else {
			msg = "비밀번호를 변경할 수 없습니다.";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "alert";
	}

	// 회원 탈퇴 폼
	@RequestMapping("member-delete")
	public String memberDelete()
			throws ServletException, IOException {

		String memberId = (String) session.getAttribute("memberId");
		Member member = memberDao.getMember(memberId);

		model.addAttribute("member", member);

		return "member/memberDelete";
	}

	// 회원 탈퇴 처리
	@RequestMapping("member-delete-pro")
	public String memberDeletePro(String memberPw)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String memberId = (String) session.getAttribute("memberId");
//		String memberPw = request.getParameter("memberPw");
		Member memberDb = memberDao.getMember(memberId);

		String msg = "";
		String url = "member-delete";

		if (memberDb != null) {
			if (memberDb.getMemberPw().equals(memberPw)) {
				msg = "탈퇴 하였습니다.";
				session.invalidate();
				memberDao.deleteMember(memberId);
				url = "member-login";
			} else {
				msg = "비밀번호가 맞지 않습니다.";
			}
		} else {
			msg = "탈퇴할 수 없습니다.";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "alert";
	}

}
