package controller;

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

import dao.AnnoDAO;
import dao.BusinessDAO;
import model.Anno;
import model.Business;
import model.Search;
import model.Sort;

@Controller
@RequestMapping("/business/")
public class BusinessController {

	Model model;
	HttpSession session;
	HttpServletRequest request;

	@Autowired
	BusinessDAO businessDao = new BusinessDAO();
	
	@Autowired
	AnnoDAO annoDao = new AnnoDAO();

	@ModelAttribute
	protected void service(HttpServletRequest request, Model model) throws ServletException, IOException {
		session = request.getSession();
		this.request = request;
		this.model = model;
		System.out.println("service");
	}

	// 메인
	@RequestMapping("business-main")
	public String business() throws ServletException, IOException {
		String businessId = (String) session.getAttribute("businessId");
		Business business = businessDao.getBusiness(businessId);
		model.addAttribute("business", business);

		return "main";
	}

	// 기업 회원가입폼
	@RequestMapping("business-join")
	public String businessJoin() throws ServletException, IOException {
		return "business/businessJoin";
	}

	// 기업 회원 가입 처리
	@RequestMapping("business-join-pro")
	public String businessJoinPro(Business business) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
//		String businessId = request.getParameter("businessId");
//		String businessPw = request.getParameter("businessPw");
//		String businessName = request.getParameter("businessName");
//		String address = request.getParameter("address");
//		int salary = Integer.parseInt(request.getParameter("salary"));
//		String welfare = request.getParameter("welfare");
//		String ceo = request.getParameter("ceo");
//		int sales = Integer.parseInt(request.getParameter("sales"));
//		int employees = Integer.parseInt(request.getParameter("employees"));
//		String type = request.getParameter("type");
//		String industry = request.getParameter("industry");
//		String detailIndustry = request.getParameter("detailIndustry");
//		String homepage = request.getParameter("homepage");
//		String content = request.getParameter("content");

		String welfare = business.getWelfare().replace("\n", "<br>");
		String content = business.getContent().replace("\n", "<br>");
//		content = content.replace("\n", "<br>");

//		Business business = new Business();
//		business.setBusinessId(businessId);
//		business.setBusinessPw(businessPw);
//		business.setBusinessName(businessName);
//		business.setAddress(address);
//		business.setSalary(salary);
//		business.setWelfare(welfare);
//		business.setCeo(ceo);
//		business.setSales(sales);
//		business.setEmployees(employees);
//		business.setType(type);
//		business.setIndustry(industry);
//		business.setDetailIndustry(detailIndustry);
//		business.setHomepage(homepage);
		business.setWelfare(welfare);
		business.setContent(content);
		System.out.println(business);
		int businessNum = businessDao.insertBusiness(business);

		String msg = "";
		String url = "";

		if (businessNum > 0) {
			msg = business.getBusinessName() + "님의 회원가입이 완료 되었습니다";
			url = "business-login";
		} else {
			msg = "회원가입이 실패 하였습니다";
			url = "business-join";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "alert";
	}

	// 기업 로그인 폼
	@RequestMapping("business-login")
	public String businessLogin() throws ServletException, IOException {

		return "business/businessLogin";
	}

	// 기업 로그인 처리
	@RequestMapping("business-login-pro")
	public String businessLoginPro(String businessId, String businessPw) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
//		String businessId = request.getParameter("businessId");
//		String businessPw = request.getParameter("businessPw");

		// Connection 객체
		Business business = businessDao.getBusiness(businessId);
		String msg = "";
		String url = "business-main";
		if (business != null) {
			if (businessPw.equals(business.getBusinessPw())) {
				session.setAttribute("businessId", businessId);
				msg = business.getBusinessName() + "님이 로그인 하셨습니다";
			} else {
				msg = "비밀번호가 맞지 않습니다";
				url = "business-login";
			}
		} else {
			msg = "사업자번호를 확인 하세요";
			url = "business-login";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "alert";
	}

	// 기업 로그아웃
	@RequestMapping("business-logout")
	public String logout() throws ServletException, IOException {
		session.invalidate();
		model.addAttribute("msg", "로그아웃 되었습니다");
		model.addAttribute("url", "business-main");
		return "alert";
	}

	// 기업 리스트
	@RequestMapping("business-list")
	public String businessList() throws ServletException, IOException {
		List<Business> businessList = businessDao.businessList();
		model.addAttribute("businessList", businessList);

		return "business/businessList";
	}

	// 기업 정보
	@RequestMapping("business-info")
	public String businessInfo() throws ServletException, IOException {
		String businessId = request.getParameter("businessId");
//		String businessId = (String) session.getAttribute("businessId");
		List<Anno> li = annoDao.getAnnoList();
		
		System.out.println(businessId);
		System.out.println("li.isEmpty() -> "+li.isEmpty());
		System.out.println("li.size() -> "+li.size());
		Business business = businessDao.getBusiness(businessId);
		model.addAttribute("business", business);
		model.addAttribute("li", li);

		return "business/businessInfo";
	}

	// 기업 정보 수정 폼
	@RequestMapping("business-update")
	public String businessUpdate() throws ServletException, IOException {
		String businessId = (String) session.getAttribute("businessId");
		Business business = businessDao.getBusiness(businessId);
		if (business != null) {
			String welfare = business.getWelfare();
			String content = business.getContent();
			welfare = welfare.replace("<br>", "\n");
			content = content.replace("<br>", "\n");
			business.setWelfare(welfare);
			business.setContent(content);
		}
		model.addAttribute("business", business);
		model.addAttribute("checkType", business.getType());
		return "business/businessUpdate";
	}

	// 기업 정보 수정 처리
	@RequestMapping("business-update-pro")
	public String businessUpdatePro(Business business) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String businessId = (String) session.getAttribute("businessId");
//		String businessPw = request.getParameter("businessPw");
//		String businessName = request.getParameter("businessName");
//		String address = request.getParameter("address");
//		int salary = Integer.parseInt(request.getParameter("salary"));
//		String welfare = request.getParameter("welfare");
//		String ceo = request.getParameter("ceo");
//		int sales = Integer.parseInt(request.getParameter("sales"));
//		int employees = Integer.parseInt(request.getParameter("employees"));
//		String type = request.getParameter("type");
//		String industry = request.getParameter("industry");
//		String detailIndustry = request.getParameter("detailIndustry");
//		String homepage = request.getParameter("homepage");
//		String content = request.getParameter("content");

		String welfare = business.getWelfare().replace("\n", "<br>");
		String content = business.getContent().replace("\n", "<br>");

		Business businessDb = businessDao.getBusiness(businessId);
//		Business business = new Business();
//		business.setBusinessId(businessId);
//		business.setBusinessPw(businessPw);
//		business.setBusinessName(businessName);
//		business.setAddress(address);
//		business.setSalary(salary);
//		business.setWelfare(welfare);
//		business.setCeo(ceo);
//		business.setSales(sales);
//		business.setEmployees(employees);
//		business.setType(type);
//		business.setIndustry(industry);
//		business.setDetailIndustry(detailIndustry);
//		business.setHomepage(homepage);
		
		business.setWelfare(welfare);
		business.setContent(content);
		String msg = "";
		String url = "business-update?businessId=" + businessId;

		if (businessDb != null) {
			if (businessDb.getBusinessPw().equals(business.getBusinessPw())) {
				msg = "수정하였습니다";
				businessDao.updateBusiness(business);
				url = "business-info?businessId=" + businessId;
			} else {
				System.out.println(businessDb.getBusinessPw());
				System.out.println(business.getBusinessPw());
				msg = "비밀번호를 확인해주세요";
			}
		} else {
			msg = "수정이 불가능합니다";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "alert";
	}

	// 기업 탈퇴 폼
	@RequestMapping("business-delete")
	public String businessDelete() throws ServletException, IOException {

		String businessId = (String) session.getAttribute("businessId");
		Business business = businessDao.getBusiness(businessId);

		model.addAttribute("business", business);

		return "business/businessDelete";
	}

	// 기업 탈퇴 처리
	@RequestMapping("business-delete-pro")
	public String businessDeletePro(String businessPw) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String businessId = (String) session.getAttribute("businessId");
//		String businessPw = request.getParameter("businessPw");
		Business businessDb = businessDao.getBusiness(businessId);

		String msg = "";
		String url = "business-delete";

		if (businessDb != null) {
			if (businessDb.getBusinessPw().equals(businessPw)) {
				msg = "탈퇴 하였습니다.";
				session.invalidate();
				businessDao.deleteBusiness(businessId);
				url = "business-login";
			} else {
				msg = "비밀번호가 틀렸습니다.";
			}
		} else {
			msg = "탈퇴 할 수 없습니다.";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "alert";
	}

	// 기업 검색
	@RequestMapping("search-business-list")
	public String searchBusinessList(Search search) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
//        String part = request.getParameter("part");
        String searchData = request.getParameter("searchData");
//        String sortData = request.getParameter("sortData"); // 정렬 조건이 있을 경우 받음

//        Search search = new Search();
//        search.setPart(part);
        search.setSearchData("%" + searchData + "%");
//        search.setSortData(sortData);
        
        List<Business> searchBusinessList = businessDao.searchBusinessList(search);

        model.addAttribute("searchPart", search.getPart()); // 선택된 검색 조건
        model.addAttribute("searchData", searchData); // 검색어
        model.addAttribute("selectedSortData", searchData); // 선택된 정렬 데이터를 속성에 설정
        model.addAttribute("searchBusinessList", searchBusinessList);

		return "business/searchBusinessList";
	}

	// 기업 정렬
	@RequestMapping("sort-business-list")
	public String sortBusinessList(Sort sort) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
//	        String sortData = request.getParameter("sortData");
		if (sort.getSortData() == null || sort.getSortData().isEmpty()) {
			sort.setSortData("businessName"); // 기본 정렬 기준
		}
//	        sort.setSortData(sortData);

		String ascDesc = "asc"; // 기본 정렬 순서
		sort.setAscDesc(ascDesc);

//	        System.out.println(sort);

		List<Business> sortBusinessList = businessDao.sortBusinessList(sort);
		model.addAttribute("sortBusinessList", sortBusinessList); // 정렬된 리스트를 속성에 설정
		model.addAttribute("selectedSortData", sort.getSortData()); // 선택된 정렬 데이터를 속성에 설정

		return "business/sortBusinessList"; // 결과를 표시할 JSP 페이지
	}

}
