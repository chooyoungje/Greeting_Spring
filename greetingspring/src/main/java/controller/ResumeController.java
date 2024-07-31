package controller;

import java.io.File;
import java.io.IOException;
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

import dao.AnnoDAO;
import dao.MemberDAO;
import dao.ResumeDAO;
import model.Anno;
import model.Career;
import model.Edu;
import model.Member;
import model.MemberPortfolio;
import model.MemberProject;
import model.Resume;

@Controller
@RequestMapping("/resume/")
public class ResumeController {
	
	
	Model model;
    HttpSession session;
    HttpServletRequest request;
    
    @Autowired
    ResumeDAO resumeDao = new ResumeDAO();
    
    @Autowired
    MemberDAO memberDao = new MemberDAO();
    
    @Autowired
    AnnoDAO annoDao = new AnnoDAO();

    @ModelAttribute
    protected void service(HttpServletRequest request, 
            Model model) throws ServletException, IOException {
    	this.request = request;
    	this.model = model;
        session = request.getSession();
        System.out.println("service");
    }

    
    // 이력서 상세 정보 조회
    @RequestMapping("resume-info")
    public String getresume(int resumeId) throws ServletException, IOException {
//        int resumeId = Integer.parseInt(request.getParameter("resumeId"));
        Resume resume = resumeDao.getResume(resumeId);
        if (resume == null) {
            return "";
        } else {
            model.addAttribute("resume", resume);
            return "resume/resumeInfo";
        }
    }
    
    
    
    @RequestMapping("resume-anno-register-form")
    public String resumeAnnoRegisterForm(int annoId) throws ServletException, IOException {
        
//       int annoId = Integer.parseInt(request.getParameter("annoId"));
    	Anno anno = annoDao.getAnnoFromAnnoId(annoId);
        String memberId = (String) session.getAttribute("memberId");
        Resume resume = resumeDao.getMemberResumeDefault(memberId);
        
        model.addAttribute("anno", anno);
        model.addAttribute("resume", resume);
        return "anno/newPage";
        
    }
    
    
   // 공고에 이력서 지원하기
   @RequestMapping("resume-anno-register")
   public String resumeAnnoRegister(int resumeId, int annoId)
           throws ServletException, IOException {
      
      resumeId = 0;
      if(request.getParameter("resumeId") != "" || request.getParameter("resumeId") != null) {
         resumeId = Integer.parseInt(request.getParameter("resumeId"));
      }
      System.out.println("resumeId : "+resumeId);
      System.out.println("annoId : "+request.getParameter("annoId"));
      
      annoId = Integer.parseInt(request.getParameter("annoId"));
      
      // resume 테이블에 annoId 집어넣기, update
      Resume resume = new Resume();
      resume.setResumeId(resumeId);
      resume.setAnnoId(annoId);
      
      int result = resumeDao.insertResumeAnnoConnect(resume);
      
      
      System.out.println("공고지원한 결과 : "+result);
      return "member/memberMain";
   }

   

    
    @RequestMapping("resume-anno-register-form-pro")
    public String resumeAnnoRegisterPro(int annoId) throws ServletException, IOException {
       
//       int annoId = Integer.parseInt(request.getParameter("annoId"));
        String memberId = (String) session.getAttribute("memberId");
        List<Resume> memberResumeList = resumeDao.getMemberResumeList(memberId);
        
        model.addAttribute("annoId", annoId);
        model.addAttribute("memberResumeList", memberResumeList);
        return "resume/resumeAnnoRegister";
        
    }
    
    
    
    // 회원이 작성한 이력서 목록 조회
    @RequestMapping("get-member-resume-list")
    public String getMemberReumeList() throws ServletException, IOException {
        String memberId = (String) session.getAttribute("memberId");
        List<Resume> resumeList = resumeDao.getMemberResumeList(memberId);

        for (Resume r : resumeList) {
            System.out.println(r.getRegistDate());
            System.out.println(r.getResumeTitle());
            System.out.println(r.getSelfInfo());
        }
        model.addAttribute("resumeList", resumeList);
        return "";
    }

    // 사업자가 작성한 이력서 목록 조회
    @RequestMapping("get-business-resume-list")
    public String getBusinessReumeList() throws ServletException, IOException {
        String businessId = (String) session.getAttribute("businessId");
//        int businessId = Integer.parseInt(bStrId);
//        int businessId String타입으로(Dao와 Mapper 포함) 수정
        List<Resume> resumeList = resumeDao.getBusinessResumeList(businessId);

        model.addAttribute("resumeList", resumeList);
        return "";
    }

    // 공고에 지원한 이력서 목록 조회
    @RequestMapping("get-anno-resume-list")
    public String getAnnoReumeList() throws ServletException, IOException {
        int annoId = 0;
        List<Resume> resumeList = resumeDao.getAnnoResumeList(annoId);

        model.addAttribute("resumeList", resumeList);
        return "resume/resumeAnnoList";
    }

    // 이력서 작성 폼으로 이동
    @RequestMapping("resume-register-form")
    public String insertResumeForm() throws ServletException, IOException {
        String memberId = (String) session.getAttribute("memberId");
        Member member = memberDao.getMember(memberId);

        model.addAttribute("member", member);
        return "resume/resumeRegisterForm";
    }

    
    
    // 이력서 작성 처리
    @RequestMapping("insert-resume")
    public String insertResume(@RequestParam("profileImageFile") MultipartFile multipartFile, @RequestParam("portfolioFiles") MultipartFile multipartFile2)
//    		Edu edu, Career career, MemberProject project, MemberPortfolio portfolio, Resume resume)
          throws ServletException, IOException {
       String path = request.getServletContext().getRealPath("/") + "img/member/"; 
//       MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "UTF-8");
       Resume resume = new Resume();
       MemberPortfolio portfolio = new MemberPortfolio();
       String profileImage = "";
		if(!multipartFile.isEmpty()) {
			File file = new File(path, multipartFile.getOriginalFilename());
			profileImage=multipartFile.getOriginalFilename();
			multipartFile.transferTo(file);
		}
//		resume.setProfileImage(profileImage);
		
		String portfolioFile = "";
		if(!multipartFile2.isEmpty()) {
			File file = new File(path, multipartFile2.getOriginalFilename());
			portfolioFile=multipartFile2.getOriginalFilename();
			multipartFile2.transferTo(file);
		}
//		portfolio.setPortfolioFile(portfolioFile);
       
       // 회원 정보: 회원 아이디를 가져와서 회원 테이블에서 조회
       String memberId = (String) session.getAttribute("memberId");

       // 이력서 아이디 가져오기
       int resumeId = resumeDao.selectResumeId();

       // 교육 정보 설정
       Edu edu = new Edu();
       edu.setSchoolType(request.getParameter("schoolType"));
       edu.setSchoolName(request.getParameter("schoolName"));
       edu.setAdmissionDate(request.getParameter("admissionDate"));
       edu.setGraduateDate(request.getParameter("graduateDate"));
       edu.setGraduateState(request.getParameter("graduateState"));
       edu.setMajor(request.getParameter("major"));
       edu.setScore(request.getParameter("score"));
       edu.setTotalScore(request.getParameter("totalScore"));
       edu.setResumeId(resumeId);

       // 경력 정보 설정
       Career career = new Career();
       career.setCompanyName(request.getParameter("companyName"));
       career.setDepartment(request.getParameter("department"));
       career.setWorkPart(request.getParameter("workPart"));
       career.setPosition(request.getParameter("position"));
       career.setWorkType(request.getParameter("workType"));
       career.setIsWorking(request.getParameter("isWorking"));
       career.setWorkPeriod(request.getParameter("workPeriod"));
       career.setResumeId(resumeId);

       // 프로젝트 정보 설정
       MemberProject project = new MemberProject();
       project.setProjectName(request.getParameter("projectName"));
       project.setTeam(request.getParameter("team"));
       project.setIsGoing(request.getParameter("isGoing"));
       project.setProjectPeriod(request.getParameter("projectPeriod"));
       project.setProjectInfo(request.getParameter("projectInfo"));
       project.setResumeId(resumeId);

       // 포트폴리오 정보 설정
       
       portfolio.setPortfolioUrl(request.getParameter("portfolioUrl"));
       portfolio.setPortfolioFile(portfolioFile);
       portfolio.setResumeId(resumeId);

       // 이력서 정보 설정
//       Resume resume = new Resume();
       resume.setName(request.getParameter("name"));
       resume.setBirth(request.getParameter("birth"));
       resume.setPhone(request.getParameter("phone"));
       resume.setEmail(request.getParameter("email"));
       resume.setResumeTitle(request.getParameter("resumeTitle"));
       resume.setResumeId(resumeId);
       resume.setMemberId(memberId);
       resume.setEdu(edu);
       resume.setCareer(career);
       resume.setProject(project);
       resume.setPortfolio(portfolio);
       resume.setSelfInfo(request.getParameter("selfInfo"));
       resume.setCertification(request.getParameter("certification"));
       resume.setLanguage(request.getParameter("language"));
       resume.setAddress(request.getParameter("address"));
       resume.setProfileImage(profileImage);

      
      // // 회원이 등록한 이력서가 0개라면 지금 들어가는 이력서가 기본이력서가 되도록하기
      if(resumeDao.getMemberResumeSize(memberId) < 1) {
    	  resume.setIsDefault(1);
      }
               
       System.out.println("resume" + resume);
       System.out.println("edu" + edu);
       System.out.println("career" + career);
       System.out.println("project" + project);
       System.out.println("profileImage: " + profileImage + ", resume.getProfileImage(): " + resume.getProfileImage());
       System.out.println("portfolioFile: " + portfolioFile + ", portfolio.getPortfolioFile(): " + portfolio.getPortfolioFile());
       System.out.println("selfInfo" + resume.getSelfInfo());
       System.out.println("certification" + resume.getCertification());
       System.out.println("language" + resume.getLanguage());
       System.out.println("address" + resume.getAddress());

       int num = resumeDao.insertResume(resume);

       String url = "";
       String msg = "";

       if (num > 0) {
          System.out.println("이력서 작성 성공");
          url = "member-main";
          msg = "이력서 작성 성공";

       } else {
          System.out.println("이력서 작성 실패");
       }

       List<Resume> memberResumeList = resumeDao.getMemberResumeList(memberId);

       model.addAttribute("profileImage", resume.getProfileImage());
       model.addAttribute("portfolioFile", portfolio.getPortfolioFile());
       model.addAttribute("memberResumeList", memberResumeList);
       
       model.addAttribute("msg", msg);
       model.addAttribute("url", url);

       return "alert";
    }
    
    @RequestMapping("member-main")
    public String memberMain() throws ServletException, IOException {
    	
        String memberId = (String)session.getAttribute("memberId");
        Member member = memberDao.getMember(memberId);
        int resumeId = resumeDao.selectResumeId();
        List<Resume> memberResumeList = resumeDao.getMemberResumeList(memberId);
         
        
        String profileImage;  
        
        
        if(memberResumeList.size() == 0) {
        	profileImage = "";
        }else {
        	int listNum = memberResumeList.size()-1;
        	profileImage= memberResumeList.get(listNum).getProfileImage();
        }
        model.addAttribute("profileImage", profileImage);
        
        
        model.addAttribute("memberResumeList", memberResumeList);
        model.addAttribute("member", member);
        
        
        return "member/memberMain";
    }
    
    
    
    // 이력서 수정 처리
    @RequestMapping("update-resume-form")
    public String updateResumeFrom(int resumeId) throws ServletException, IOException {
    	
//    	int resumeId =  Integer.parseInt(request.getParameter("resumeId"));
    	Resume resume = resumeDao.getResume(resumeId);
    	model.addAttribute("resumeId", resumeId);
    	model.addAttribute("resume", resume);
        return "resume/resumeUpdateForm";
    }
    
    
    
    @RequestMapping("update-resume-pro")
    public String updateResumePro(@RequestParam("profileImageFile") MultipartFile multipartFile, @RequestParam("portfolioFiles") MultipartFile multipartFile2)
//    		Edu edu, Career career, MemberProject project, MemberPortfolio portfolio, Resume resume) 
    				throws ServletException, IOException {
    	 String path = request.getServletContext().getRealPath("/") + "img/member/";
//         MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "UTF-8");
    	 Resume resume = new Resume();
    	 MemberPortfolio portfolio = new MemberPortfolio();
    	 
    	// 이력서 아이디 가져오기
         int resumeId = Integer.parseInt(request.getParameter("resumeId"));
         
         Resume resumeDb =resumeDao.getResume(resumeId);
         
         String profileImage = "";
  		if(!multipartFile.isEmpty()) {
  			File file = new File(path, multipartFile.getOriginalFilename());
  			profileImage=multipartFile.getOriginalFilename();
  			multipartFile.transferTo(file);
  			resume.setProfileImage(profileImage);
  		} else { //업로드를 안했을 경우
  			resume.setProfileImage(resumeDb.getProfileImage());
		}
  		
  		
  		String portfolioFile = "";
  		if(!multipartFile2.isEmpty()) {
  			File file = new File(path, multipartFile2.getOriginalFilename());
  			portfolioFile=multipartFile2.getOriginalFilename();
  			multipartFile2.transferTo(file);
  			portfolio.setPortfolioFile(portfolioFile);
  			System.out.println("portfolio.setPortfolioFile(portfolioFile) : " + portfolioFile);
  		} else { //업로드를 안했을 경우
  			portfolio.setPortfolioFile(resumeDb.getPortfolio().getPortfolioFile());
  			System.out.println("resumeDb.getPortfolio().getPortfolioFile() : " + resumeDb.getPortfolio().getPortfolioFile());
		}
    	
  		
         // 회원 정보: 회원 아이디를 가져와서 회원 테이블에서 조회
         String memberId = (String) session.getAttribute("memberId");

         

         // 교육 정보 설정
         Edu edu = new Edu();
         int eduId = Integer.parseInt(request.getParameter("eduId"));
         edu.setEduId(eduId);
         edu.setSchoolType(request.getParameter("schoolType"));
         edu.setSchoolName(request.getParameter("schoolName"));
         edu.setAdmissionDate(request.getParameter("admissionDate"));
         edu.setGraduateDate(request.getParameter("graduateDate"));
         edu.setGraduateState(request.getParameter("graduateState"));
         edu.setMajor(request.getParameter("major"));
         edu.setScore(request.getParameter("score"));
         edu.setTotalScore(request.getParameter("totalScore"));
         edu.setResumeId(resumeId);

//          경력 정보 설정
         Career career = new Career();
         int careerId = Integer.parseInt(request.getParameter("careerId"));
         career.setCareerId(careerId);
         career.setCompanyName(request.getParameter("companyName"));
         career.setDepartment(request.getParameter("department"));
         career.setWorkPart(request.getParameter("workPart"));
         career.setPosition(request.getParameter("position"));
         career.setWorkType(request.getParameter("workType"));
         career.setIsWorking(request.getParameter("isWorking"));
         career.setWorkPeriod(request.getParameter("workPeriod"));
         career.setResumeId(resumeId);

         // 프로젝트 정보 설정
         MemberProject project = new MemberProject();
         int projectId = Integer.parseInt(request.getParameter("projectId"));
         project.setProjectId(projectId);
         project.setProjectName(request.getParameter("projectName"));
         project.setTeam( request.getParameter("team"));
         project.setIsGoing(request.getParameter("isGoing"));
         project.setProjectPeriod(request.getParameter("projectPeriod"));
         project.setProjectInfo(request.getParameter("projectInfo"));
         project.setResumeId(resumeId);

         // 포트폴리오 정보 설정
//         MemberPortfolio portfolio = new MemberPortfolio();
         int portfolioId = Integer.parseInt(request.getParameter("portfolioId"));
         portfolio.setPortfolioId(portfolioId);
         portfolio.setPortfolioUrl(request.getParameter("portfolioUrl"));
//         portfolio.setPortfolioFile(portfolioFile);
         portfolio.setResumeId(resumeId);

         // 이력서 정보 설정
//         Resume resume = new Resume();
         resume.setName(request.getParameter("name"));
         resume.setBirth(request.getParameter("birth"));
         resume.setPhone(request.getParameter("phone"));
         resume.setEmail(request.getParameter("email"));
         resume.setResumeTitle(request.getParameter("resumeTitle"));
         resume.setResumeId(resumeId);
         resume.setMemberId(memberId);
         resume.setEdu(edu);
         resume.setCareer(career);
         resume.setProject(project);
         resume.setPortfolio(portfolio);
         resume.setSelfInfo(request.getParameter("selfInfo"));
         resume.setCertification(request.getParameter("certification"));
         resume.setLanguage(request.getParameter("language"));
         resume.setAddress(request.getParameter("address"));
//         resume.setProfileImage(profileImage);

         
        
        // // 회원이 등록한 이력서가 0개라면 지금 들어가는 이력서가 기본이력서가 되도록하기
        if(resumeDao.getMemberResumeSize(memberId) < 1) {
      	  resume.setIsDefault(1);
        }
                 
         System.out.println("resume" + resume);
         System.out.println("edu" + edu);
         System.out.println("career" + career);
         System.out.println("project" + project);
         System.out.println("portfolio" + portfolio);
         System.out.println("selfInfo" + resume.getSelfInfo());
         System.out.println("certification" + resume.getCertification());
         System.out.println("language" + resume.getLanguage());
         System.out.println("address" + resume.getAddress());

         int num = resumeDao.updateResume(resume);

         String url = "";
         String msg = "";

         if (num > 0) {
            System.out.println("이력서 수정 성공");
            url = "member-main";
            msg = "이력서 수정 성공";

         } else {
            System.out.println("이력서 수정 실패");
         }

         List<Resume> memberResumeList = resumeDao.getMemberResumeList(memberId);

         model.addAttribute("profileImage", resume.getProfileImage());
         model.addAttribute("portfolioFile", portfolio.getPortfolioFile());
         model.addAttribute("memberResumeList", memberResumeList);
         
         model.addAttribute("msg", msg);
         model.addAttribute("url", url);

         return "alert";
    }
    

    // 이력서 삭제 처리
    @RequestMapping("delete-resume")
    public String deleteResume(int resumeId) throws ServletException, IOException {
//        int resumeId = Integer.parseInt(request.getParameter("resumeId"));
        
        int num = resumeDao.deleteResume(resumeId);
        String url="";
        String msg="";
        if (num > 0) {
            System.out.println("이력서 삭제 성공");
            url = "member-main";
            msg = "이력서 삭제 성공";
         } else {
            System.out.println("이력서 삭제 실패");
         }

        model.addAttribute("msg", msg);
        model.addAttribute("url", url);
        return "alert";
    }
    
    
    // 기본 이력서로 이력서 업데이트 하기
    @RequestMapping("update-resume-default")	
    public String updateResumeDefault(int resumeId) throws ServletException, IOException {
//        int resumeId = Integer.parseInt(request.getParameter("resumeId"));
        String memberId = (String) session.getAttribute("memberId");
        int num = resumeDao.updateResumeToDefault(resumeId,memberId);
        
        String url="";
        String msg="";
        if (num > 0) {
            System.out.println("기본 이력서로 설정 성공");
            url = "member-main";
            msg = "기본 이력서로 설정 성공";
         } else {
            System.out.println("기본 이력서로 설정 실패");
         }

        model.addAttribute("msg", msg);
        model.addAttribute("url", url);
        return "alert";
    }

    
    
    
}
