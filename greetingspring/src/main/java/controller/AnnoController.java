package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.AnnoDAO;
import dao.BusinessDAO;
import dao.MemberDAO;
import dao.ResumeDAO;
import model.Anno;
import model.Business;
import model.Column;
import model.Evaluate;
import model.Resume;
import model.ResumeAnnoConnection;
import model.Search;
import model.Skill;

@Controller
@RequestMapping("/anno/")
public class AnnoController {

	Model model;
	HttpSession session;
	HttpServletRequest request;
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

	@Autowired
	BusinessDAO businessDao = new BusinessDAO();

	@Autowired
	AnnoDAO annoDao = new AnnoDAO();

	@Autowired
	MemberDAO memberDao = new MemberDAO();
	
	@Autowired
	ResumeDAO resumeDao = new ResumeDAO();

	@ModelAttribute
	protected void service(HttpServletRequest request, Model model) throws ServletException, IOException {
		this.request = request;
		this.model = model;
		session = request.getSession();
		System.out.println("service");
	}

	@RequestMapping("business-anno-insert-form")
	public String BusinessAnnoInsertForm() throws ServletException, IOException {
		List<Skill> skills = annoDao.getAllSkills();
		String businessId = (String) session.getAttribute("businessId");
		Business business = businessDao.getBusiness(businessId);
		String welfare = business.getWelfare().replace("<br>", "\n");

		business.setWelfare(welfare);

		for (Skill skill : skills) {
			System.out.println(skill);
		}
		model.addAttribute("business", business);
		model.addAttribute("skills", skills);
		return "anno/businessAnnoInsertForm";
	}

	@RequestMapping("anno-insert-pro")
	public String annoInsertPro(String selectedSkills, Anno anno, Skill skill) throws ServletException, IOException, ParseException {
		request.setCharacterEncoding("utf-8");

//		String businessId = (String) session.getAttribute("businessId");
		int skillId = annoDao.selectSkillId();
		int annoId = annoDao.selectAnnoId();
		anno.setAnnoId(annoId);
		System.out.println("annoDao.selectAnnoId():"+annoId);

		Date annoDeadline = parseDate(request.getParameter("annoDeadline"));
		
		String annoDeadlineDate = dateFormat.format(annoDeadline);
		System.out.println("annoDeadlineDate : "+annoDeadlineDate);
		
		Date annoDeadline2 = parseDate(request.getParameter("annoDeadlineDate"));
		
		System.out.println(selectedSkills);
		System.out.println("annoDeadline : " + annoDeadline);
		System.out.println("annoDeadline2 : " + annoDeadline2);


		anno.setAnnoDeadline(annoDeadline);
//      anno.setSkillId(annoDao.selectSkillId());
		System.out.println("anno.getAnnoDeadline() = "+anno.getAnnoDeadline());
		
		

		String welfare = anno.getWelfare().replace("\n", "<br>");
		String annoContent = anno.getAnnoContent().replace("\n", "<br>");
		anno.setWelfare(welfare);
		anno.setAnnoContent(annoContent);

		System.out.println("annoContent:" + annoContent);

		System.out.println(anno);

		int num = annoDao.insertAnno(anno);
		
		if (num > 0 && selectedSkills != null && !selectedSkills.isEmpty()) {
//            Skill skill = new Skill();
            skill.setAnnoId(annoId);
            skill.setSkillId(skillId);
            skill.setSkills(selectedSkills);
            annoDao.insertSkill(skill);
        }

        String msg = num > 0 ? anno.getBusinessName() + "의 공고가 등록되었습니다." : "공고 등록이 실패했습니다.";
        String url = "business-anno-list";


		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "alert";
	}

	// Other methods...

	@RequestMapping("user-anno-list")
	public String userAnnoList() throws ServletException, IOException {
		List<Anno> li = annoDao.getAnnoList();


		for (Anno anno : li) {
			if (anno.getAnnoDeadline() != null) {
				Date now = new Date();
				long daysLeft = daysBetweenDates(now, anno.getAnnoDeadline());
				anno.setDaysLeft(daysLeft);
			} else {
				anno.setDaysLeft(-1); // or any other value indicating no deadline set
			}
		}


		model.addAttribute("li", li);

//		System.out.println("li size: " + li.size());
//		for (Anno anno1 : li) {
//			System.out.println(anno1.getBusinessName() + " " + anno1.getAnnoTitle());
//		}
//
//		// 공고들의 정보를 출력하는 코드
//		for (Anno anno2 : li) {
//			System.out.println("annoId: " + anno2.getAnnoId());
//		}

		return "anno/userAnnoList";
	}

	@RequestMapping("business-anno-list")
	public String businessAnnoList() throws ServletException, IOException {
		String businessId = (String) session.getAttribute("businessId");
		List<Anno> li = annoDao.getAnnoList();
//      List<Anno> li = annoDao.getAnnoListFromBusinessId(businessId);


		for (Anno anno : li) {
			if (anno.getAnnoDeadline() != null) {
				Date now = new Date();
				long daysLeft = daysBetweenDates(now, anno.getAnnoDeadline());
				anno.setDaysLeft(daysLeft);
			} else {
				anno.setDaysLeft(-1); // or any other value indicating no deadline set
			}
			int resumeCount = annoDao.getResumeCount(anno.getAnnoId());
			anno.setResumeCount(resumeCount);
		}

		model.addAttribute("businessId", businessId);


		model.addAttribute("li", li);

//		System.out.println("li size: " + li.size());
//		// 공고들의 정보를 출력하는 코드
//		for (Anno anno1 : li) {
//			System.out.println(anno1.getBusinessName() + " " + anno1.getAnnoTitle());
//			System.out.println("annoId: " + anno1.getAnnoId());
//		}

		return "anno/businessAnnoList";
	}

	@RequestMapping("user-anno-info")
	public String userAnnoInfo(int annoId) throws ServletException, IOException {
//		int annoId = Integer.parseInt(request.getParameter("annoId"));
	    Anno anno = annoDao.getAnnoFromAnnoId(annoId);
	    Skill skills = annoDao.getSkillsByAnnoId(annoId);
	    String memberId = (String) session.getAttribute("memberId");
	    Resume resume = resumeDao.getMemberResumeDefault(memberId);
	    
	    int resumeId = 0;
	    if(resume != null) {
	    	resumeId = resume.getResumeId();
	    }
	    
	    
	    // 내가 이력서를 지원한 공고인지 확인하는 코드
	    int findResult = resumeDao.isResumeRegister(annoId, resumeId);
	    // 없으면 0이 뜸
	    System.out.println("findResult : "+findResult);
	    model.addAttribute("findResult", findResult);
	    model.addAttribute("anno", anno);
	    model.addAttribute("skills", skills);

		return "anno/userAnnoInfo";
	}

	@RequestMapping("business-anno-info")
	public String businessAnnoInfo(int annoId) throws ServletException, IOException {
//		int annoId = annoDao.getAnnoId();
//		int annoId = Integer.parseInt(request.getParameter("annoId"));
		Anno anno = annoDao.getAnnoFromAnnoId(annoId);
        Skill skills = annoDao.getSkillsByAnnoId(annoId);
        
        Date now = new Date();
        long daysLeft = daysBetweenDates(now, anno.getAnnoDeadline());

        model.addAttribute("daysLeft", daysLeft);
        model.addAttribute("anno", anno);
        model.addAttribute("skills", skills);

        System.out.println("Skills for AnnoId: " + annoId);
        System.out.println(skills);

        return "anno/businessAnnoInfo";
	}

	@RequestMapping("business-anno-update-form")
    public String businessAnnoUpdateForm(int annoId)
            throws ServletException, IOException {
        // int annoId = Integer.parseInt(request.getParameter("annoId"));
        Anno anno = annoDao.getAnnoFromAnnoId(annoId);
        String annoDeadlineStr = (anno.getAnnoDeadline() != null) ? dateFormat.format(anno.getAnnoDeadline()) : "";
        String welfare = anno.getWelfare().replace("<br>", "\n");
      String annoContent = anno.getAnnoContent().replace("<br>", "\n");
      anno.setWelfare(welfare);
      anno.setAnnoContent(annoContent);
        
        Skill skills = annoDao.getSkillsByAnnoId(annoId);
        String[] skillsArray = skills.getSkills().split(",");
      for (int i = 0; i < skillsArray.length; i++) {
         System.out.println("skillsArray ===" + skillsArray[i]);
      }
      model.addAttribute("annoDeadlineStr", annoDeadlineStr); // 날짜 문자열을 전달
        model.addAttribute("anno", anno);
        model.addAttribute("skills", skills);
        model.addAttribute("skillsArray", skillsArray);

        return "anno/businessAnnoUpdateForm";
    }

	@RequestMapping("anno-update-pro")
	public String annoUpdatePro(Anno anno, int annoId, String selectedSkills, Skill skill)
			throws ServletException, IOException, ParseException {
		request.setCharacterEncoding("utf-8");

		// Check if the parameter is received correctly
//       String annoIdStr = request.getParameter("annoId"); // update form 가서 annoId name을 annoIdStr로 바꿔야할듯
//		System.out.println("Received annoId: " + annoIdStr);
		int skillId = annoDao.selectSkillId();

//		int annoId = parseIntOrDefault(annoIdStr, 0);
		System.out.println("Received adesadsadasdsasadasdsa: " + annoId);
//       Anno anno = new Anno();
		anno.setAnnoId(annoId);

		anno.setSkillId(parseIntOrDefault(request.getParameter("skillId"), 0));
//       String selectedSkills = request.getParameter("selectedSkills");
		Date annoDeadline = parseDate(request.getParameter("annoDeadline"));
		
		anno.setAnnoDeadline(annoDeadline);
		
		System.out.println(selectedSkills);
		System.out.print(anno);

		String welfare = anno.getWelfare().replace("\n", "<br>");
		String annoContent = anno.getAnnoContent().replace("\n", "<br>");
		anno.setWelfare(welfare);
		anno.setAnnoContent(annoContent);
		
		
		int num = annoDao.updateAnno(anno);

		if (num > 0 && selectedSkills != null && !selectedSkills.isEmpty()) {
//			Skill skill = new Skill();
			annoDao.deleteSkillsByAnnoId(annoId); // Delete existing skills
			skill.setAnnoId(annoId);
			skill.setSkillId(skillId);
			skill.setSkills(selectedSkills);

			annoDao.insertSkill(skill);
		}

        String msg = num > 0 ? "공고가 수정되었습니다." : "공고 수정에 실패했습니다.";
        String url = num > 0 ? "business-anno-info?annoId=" + annoId : "business-anno-list";


		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "alert";
	}

	@RequestMapping("anno-delete-pro")
	public String annoDeletePro(int annoId) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		// Check if the parameter is received correctly
//		Anno anno = new Anno();
//		String annoIdStr = request.getParameter("annoId"); // delettete form 가서 annoId name을 annoIdStr로 바꿔야할듯
//		int annoId = parseIntOrDefault(annoIdStr, 0);
//		anno.setAnnoId(annoId);

		int num = annoDao.deleteAnno(annoId);

		String msg = num > 0 ? "공고가 삭제되었습니다." : "공고 삭제에 실패했습니다.";
		String url = num > 0 ? "business-anno-list" : "business-anno-info?annoId=" + annoId;

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "alert";
	}

	@RequestMapping("business-anno-management")
	public String businessAnnoManagement(int annoId) throws ServletException, IOException {
//		int annoId = Integer.parseInt(request.getParameter("annoId"));
		Anno anno = annoDao.getAnnoFromAnnoId(annoId);
		
		Column column = annoDao.getColumn(annoId);
		// 컬럼 단계 리스트에 담아서 넘겨주기

		
		List<Column> columnList = new ArrayList();
		if(column !=null) {
			int maxColumnStage = column.getColumnStage();
			String[] columnTitleList = column.getColumnTitle().split(",");
			for(int i=0;i<maxColumnStage;i++) {
				Column columnToManagement = new Column();
				columnToManagement.setColumnTitle(columnTitleList[i]);
				columnToManagement.setColumnStage(i+1);
				columnList.add(columnToManagement);
			}
			
			model.addAttribute("columnList", columnList);
			
			for(String s : columnTitleList) {
				System.out.println("columnStageList : "+ s);
			}
		}
		
		// 이력서 평가에 관한 내용 가져오기
		List<Evaluate> evaluateList = resumeDao.getResumeEvaluateList(annoId);
		
		// 해당 공고에 지원한 이력서들 가져오기
		List<Resume> resumeList = resumeDao.getResumeToBusinessManagement(annoId);
		
				
		for(int i=0;i<evaluateList.size();i++) {
			if(evaluateList.get(i).getResumeId() == resumeList.get(i).getResumeId()) {
				int resumeScore = evaluateList.get(i).getavgScore();
				resumeList.get(i).setResumeScore(resumeScore);
			}
			
		}
		
		System.out.println("anno : "+ anno);
		System.out.println("resumeList : "+ resumeList);
		System.out.println("column : "+ column);
		
		model.addAttribute("anno", anno);
		model.addAttribute("resumeList", resumeList);
		model.addAttribute("column", column);
		

		return "anno/businessAnnoManagement";
	}
	
	@RequestMapping("business-column-save")
	public String businessColumnSave(@RequestParam("columnTitle") List<String> columnTitleList,  
			@RequestParam("annoId") int annoId, @RequestParam("columnCount") int columnCount)
			throws ServletException, IOException {
		 
		// 삭제를 하고 저장을 누르면 단계 5->3    
		// 컬럼 제목1,새 컬럼2,새 컬럼3,새 컬럼4, 컬럼 제목5   -> 컬럼 제목1,새 컬럼2,새 컬럼3
		
		
		String columnTitleListStr = String.join(",",columnTitleList);
		System.out.println("columnTitleListStr : "+columnTitleListStr);
		

		Column column = new Column();
		column.setannoId(annoId);
		column.setColumnTitle(columnTitleListStr);
		column.setColumnStage(columnCount);
		
		// DB에서 가져온 컬럼
		Column getColumn = annoDao.getColumn(annoId);
		
		// insert를 할 것인지, update를 할 것인지 판단하는 코드
		int num = 0;
		if(getColumn == null) {
			// 테이블에 없을 때에는 insert
			 num = annoDao.insertColumn(column);
		} else {
			num = annoDao.updateColumn(column);

		}
		
		
		String msg="";
		if(num>0) {
			msg="저장 성공";
		}else {
			msg="저장 실패";
		}
		
		System.out.println("annoId : "+annoId);
		System.out.println("columnCount : "+columnCount);
		
//		int annoId = Integer.parseInt(request.getParameter("annoId"));
		Anno anno = annoDao.getAnnoFromAnnoId(annoId);


		return "redirect:/anno/business-anno-management?annoId=" + annoId;
	}

	 
	 @RequestMapping("anno-resume-evaluate")
		public String annoResumeEvaluate(int annoId, int resumeId, int resumeColumnStage) throws ServletException, IOException {
		 Resume resumeDb = resumeDao.getResume(resumeId);
		 Anno annoDb = annoDao.getAnnoFromAnnoId(annoId);
		 Evaluate evaluate = new Evaluate();
		 evaluate.setAnnoId(annoId);
		 evaluate.setResumeId(resumeId);
		 Evaluate resumeEvaluate = resumeDao.getResumeEvaluate(evaluate);
		 
		 model.addAttribute("resumeEvaluate", resumeEvaluate);
		 model.addAttribute("resumeColumnStage", resumeColumnStage);
		 model.addAttribute("anno", annoDb);
		 model.addAttribute("resume", resumeDb);
		 
		 return "anno/annoResumeEvaluate";
	 }
	 
	 @RequestMapping("anno-resume-evaluate-save")
		public String annoResumeEvaluateSave(@ModelAttribute Evaluate evaluate) throws ServletException, IOException {

		 System.out.println(evaluate);
		 // 현재 이력서가 이력서 평가 테이블에 있는 지 확인
		 int selectResult = resumeDao.selectResumeEvaluate(evaluate);
		 
		 if(selectResult == 0) {
			 // 1. 이력서 평가 테이블에 없는 상태라면 데이터 insert
			 int insertResult = resumeDao.insertResumeEvaluate(evaluate);
			 System.out.println("insertResult : "+insertResult);
		 }else {
				// 2. 이력서 평가 테이블에 이미 들어가있는 상태라면 데이터 update
			 int updateResult = resumeDao.updateResumeEvaluate(evaluate);
			 System.out.println("updateResult : "+updateResult);
		 }
		 
		 int resumeId = evaluate.getResumeId();
		 int annoId = evaluate.getAnnoId();
		 int resumeEvaluateStage = evaluate.getEvaluateStage();
		 return "redirect:/anno/anno-resume-evaluate?annoId=" + annoId+"&resumeId="+resumeId+"&resumeColumnStage="+resumeEvaluateStage;
	 }
	 
	 @RequestMapping("anno-resume-nextstage")
		public String annoResumeNextstage(int annoId, int resumeId, int resumeColumnStage) throws ServletException, IOException {

		 
		 
		 int upgradeStage = resumeColumnStage + 1;
		 Evaluate evaluate = new Evaluate();
		 evaluate.setAnnoId(annoId);
		 evaluate.setResumeId(resumeId);
		 evaluate.setEvaluateStage(upgradeStage);
		 int num = resumeDao.updateResumeAnnoConnect(evaluate);
		 if(num>0) {
			 System.out.println("다음 단계로 이동 성공");
		 } else {
			 System.out.println("다음 단계로 이동 실패");
		 }
		 
		 return "redirect:/anno/business-anno-management?annoId=" + annoId;
	 }
	 
		@RequestMapping("user-my-anno-list")
		public String userMyAnnoList() throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			String memberId = (String) session.getAttribute("memberId");
			Resume resume = resumeDao.getMemberResumeDefault(memberId);
			int resumeId = resume.getResumeId();
			
			List<Anno> myAnnoList = annoDao.userMyAnnoList(resumeId);
			
			
			System.out.println(myAnnoList);


//			for (Anno anno : li) {
//				if (anno.getAnnoDeadline() != null) {
//					Date now = new Date();
//					long daysLeft = daysBetweenDates(now, anno.getAnnoDeadline());
//					anno.setDaysLeft(daysLeft);
//				} else {
//					anno.setDaysLeft(-1); // or any other value indicating no deadline set
//				}
//			}


			model.addAttribute("myAnnoList", myAnnoList);

			return "anno/userMyAnnoList";
		}


	
	
	@RequestMapping("search-anno-list")
	public String searchAnnoList(String part, String searchData, Search search) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
//      String part = request.getParameter("part");
//      String searchData = request.getParameter("searchData");
//      Search search = new Search();
		search.setPart(part);
		search.setSearchData("%" + searchData + "%");
		List<Anno> searchAnnoList = annoDao.searchAnnoList(search);

		model.addAttribute("searchPart", part);
		model.addAttribute("searchData", searchData);
		model.addAttribute("searchAnnoList", searchAnnoList);

		return "anno/searchAnnoList";
	}

	
	private int parseIntOrDefault(String value, int defaultValue) {
		try {
			return Integer.parseInt(value);
		} catch (NumberFormatException e) {
			return defaultValue;
		}
	}

	private Date parseDate(String dateStr) {
	    if (dateStr == null || dateStr.isEmpty()) {
	        return null;
	    }
	    try {
	        return dateFormat.parse(dateStr);
	    } catch (ParseException e) {
	        e.printStackTrace();
	        System.out.println("날짜 변환 중 에러가 발생했습니다: " + e.getMessage());
	        return null;
	    }
	}

	private long daysBetweenDates(Date startDate, Date endDate) {
		if (startDate == null || endDate == null) {
			throw new IllegalArgumentException("The dates must not be null");
		}
		Calendar startCal = Calendar.getInstance();
		startCal.setTime(startDate);
		startCal.set(Calendar.HOUR_OF_DAY, 0);
		startCal.set(Calendar.MINUTE, 0);
		startCal.set(Calendar.SECOND, 0);
		startCal.set(Calendar.MILLISECOND, 0);

		Calendar endCal = Calendar.getInstance();
		endCal.setTime(endDate);
		endCal.set(Calendar.HOUR_OF_DAY, 0);
		endCal.set(Calendar.MINUTE, 0);
		endCal.set(Calendar.SECOND, 0);
		endCal.set(Calendar.MILLISECOND, 0);

		long diffMillis = endCal.getTimeInMillis() - startCal.getTimeInMillis();
		return diffMillis / (1000 * 60 * 60 * 24);
	}
}