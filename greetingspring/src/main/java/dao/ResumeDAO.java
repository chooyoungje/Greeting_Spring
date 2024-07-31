package dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mapper.CareerMapper;
import mapper.EduMapper;
import mapper.MemberPortfolioMapper;
import mapper.MemberProjectMapper;
import mapper.ResumeEvaluateMapper;
import mapper.ResumeMapper;
import mapper.Resume_Anno_ConnectMapper;
import model.Career;
import model.Edu;
import model.Evaluate;
import model.MemberPortfolio;
import model.MemberProject;
import model.Resume;
import model.ResumeAnnoConnection;

@Component
public class ResumeDAO {
	
	@Autowired
	SqlSessionTemplate session;
	
	
	public String getProfileImage(String memberId ) {
		
		String profileImage = session.getMapper(ResumeMapper.class).getProfileImage(memberId);
		
		return profileImage;
	
	}
	
	// 이력서 1개 가져오기
	public Resume getResume(int resumeId) {
		Resume resume = session.getMapper(ResumeMapper.class).getResume(resumeId);
		
		Edu edu = session.getMapper(EduMapper.class).getEdu(resumeId);
		MemberProject project = session.getMapper(MemberProjectMapper.class).getProject(resumeId);
		MemberPortfolio portfoio= session.getMapper(MemberPortfolioMapper.class).getPortfolio(resumeId);
		Career career = session.getMapper(CareerMapper.class).getCareer(resumeId);
		
		resume.setEdu(edu);
		resume.setProject(project);
		resume.setCareer(career);
		resume.setPortfolio(portfoio);
		
		return resume;
	}
	
	public Resume resumeInfo(int resumeId) {
		
		Resume resume = session.getMapper(ResumeMapper.class).getResume(resumeId);
		
		
		return resume; 
	}
	
	
	
	// 이력서 여러 개 리스트로 가져오기, 회원 자신이 작성한 이력서 목록 가져오기
	public List<Resume> getMemberResumeList(String memberid){
		List<Resume> memberResumeList = session.getMapper(ResumeMapper.class).getMemberResumeList(memberid);
		return memberResumeList;
	}
	
	
	
	// 이력서 여러 개 리스트로 가져오기, 기업에 들어온 이력서 목록 가져오기 getBusinessResumeList
	public List<Resume> getBusinessResumeList(String businessId){
		List<Resume> businessResumeList = session.getMapper(ResumeMapper.class).getBusinessResumeList(businessId);
		return businessResumeList;
	}
	
	
	// 
	public List<Resume> getResumeToBusinessManagement(int annoId){
		List<Resume> resumeList = session.getMapper(ResumeMapper.class).getResumeToBusinessManagement(annoId);
		return resumeList;
	}
	
	public int selectResumeId() {
		return session.getMapper(ResumeMapper.class).selectResumeId();
	}
	
	
	// 이력서 작성하기 insertResume
	public int insertResume(Resume resume) {
		
		// 학력 테이블에 데이터 insert
		int num1 = session.getMapper(EduMapper.class).insertEdu(resume.getEdu());
		System.out.println("num1 = "+num1);
		
		// 포트폴리오 테이블에 데이터 insert
		int num2 = session.getMapper(MemberPortfolioMapper.class).insertPortfolio(resume.getPortfolio());
		System.out.println("num2 = "+num2);
		
		// 프로젝트 테이블에 데이터 insert
		int num3 = session.getMapper(MemberProjectMapper.class).insertProject(resume.getProject());
		System.out.println("num3 = "+num3);
		
		// 경력 테이블에 데이터 insert
		int num4 = session.getMapper(CareerMapper.class).insertCareer(resume.getCareer());
		System.out.println("num4 = "+num4);
		
		
		int num = session.getMapper(ResumeMapper.class).insertResume(resume);
		System.out.println("num = "+num);
		
		
		return num;
	}
	
	
	
	
	
	
	// 이력서 수정하기 updateResume
	public int updateResume(Resume resume) {
		
		// 학력 테이블에 데이터 update
		int num1 = session.getMapper(EduMapper.class).updateEdu(resume.getEdu());
		System.out.println("num1 = "+num1);
		
		// 포트폴리오 테이블에 데이터 update
		int num2 = session.getMapper(MemberPortfolioMapper.class).updatePortfolio(resume.getPortfolio());
		System.out.println("num2 = "+num2);
		
		// 프로젝트 테이블에 데이터 update
		int num3 = session.getMapper(MemberProjectMapper.class).updateProject(resume.getProject());
		System.out.println("num3 = "+num3);
		
		// 경력 테이블에 데이터 update
		int num4 = session.getMapper(CareerMapper.class).updateCareer(resume.getCareer());
		System.out.println("num4 = "+num4);
		
		// 이력서 테이블 최종 업데이트
		int num = session.getMapper(ResumeMapper.class).updateResume(resume);
		System.out.println("num = "+num);
		
		return num;
	}
	
	
	// 이력서 삭제하기 deleteResume
	public int deleteResume(int resumeId) {
		int num = session.getMapper(ResumeMapper.class).deleteResume(resumeId);
		return num;
	}

//	public int updateAnnoId(int resumeId, int annoId) {
//		Map<String,Integer> map = new HashMap<>();
//		map.put("resumeId", resumeId);
//		map.put("annoId", annoId);
//		int result = session.getMapper(Resume_Anno_ConnectMapper.class).intsertAnnoId(map);
//		return 0;
//	}

	public int getMemberResumeSize(String memberId) {
		int memberResumeSize = session.getMapper(ResumeMapper.class).getMemberResumeSize(memberId);
		// TODO Auto-generated method stub
		return memberResumeSize;
	}

	
	// 여기서부터 가져가면 된다
	
	
	// 기본이력서로 설정하기
	public int updateResumeToDefault(int resumeId, String memberId) {
		
		// DB에 있는 이력서 isDefault 값 전부 0으로 바꾸기
		int updateToZero = session.getMapper(ResumeMapper.class).updateResumeToZero(memberId);
		System.out.println("결과 1 : updateToZero : " +updateToZero);
		// 내가 선택한 이력서의 isDefault 값 1로 바꾸기
		int updateResult =  session.getMapper(ResumeMapper.class).updateResumeToDefault(resumeId);
		System.out.println("결과 2 : updateResult : " +updateResult);
		return updateResult;
	}

	
	
	public Resume getMemberResumeDefault(String memberId) {
		// isDefault 값이 1인 이력서를 가져오기
		Resume resume = session.getMapper(ResumeMapper.class).getMemberResumeDefault(memberId);
		return resume;
	}

	public int isResumeRegister(int annoId, int resumeId) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("annoId", annoId);
		map.put("resumeId", resumeId);
		int findResult = session.getMapper(Resume_Anno_ConnectMapper.class).isResumeRegister(map);
		return findResult;
	}

	public List<Resume> getAnnoResumeList(int annoId) {
		List<Resume> resumeList = session.getMapper(ResumeMapper.class).getAnnoResumeList(annoId);
		return resumeList;
	}

	public int insertResumeAnnoConnect(Resume resume) {
		// TODO Auto-generated method stub
		int num = session.getMapper(Resume_Anno_ConnectMapper.class).insertResumeAnnoConnect(resume);
		return num;
	}

	
	
	// ===========================================================================================
	
	
	// 이력서 평가 테이블에 값 집어넣기
	public int insertResumeEvaluate(Evaluate evaluate) {
		int num = session.getMapper(ResumeEvaluateMapper.class).insertResumeEvaluate(evaluate);
		return 0;
	}
	
	// 이력서 평가 테이블에 데이터가 있는 지 판단
	public int selectResumeEvaluate(Evaluate evaluate) {
		int count = session.getMapper(ResumeEvaluateMapper.class).selectResumeEvaluate(evaluate);
		return count;
	}
	
	// 평가 데이터가 이미 들어가 있으면 update하기
	public int updateResumeEvaluate(Evaluate evaluate) {
		int num = session.getMapper(ResumeEvaluateMapper.class).updateResumeEvaluate(evaluate);
		return num;
	}

	
	// 비즈니스 매니지먼트에서 이력서 평가로 페이지가 넘어갈 때 값 가져오기
	public Evaluate getResumeEvaluate(Evaluate evaluate) {
		Evaluate getEvaluateResult = session.getMapper(ResumeEvaluateMapper.class).getResumeEvaluate(evaluate);
		return getEvaluateResult;
	}

	// 비즈니스 매니지먼트에 보여줄 이력서 평가 내용들을 리스트로 가져오기
	public List<Evaluate> getResumeEvaluateList(int annoId) {
		List<Evaluate> evaluateList = session.getMapper(ResumeEvaluateMapper.class).getResumeEvaluateList(annoId);
		return evaluateList;
	}

	public int updateResumeAnnoConnect(Evaluate evaluate) {
		int num = session.getMapper(Resume_Anno_ConnectMapper.class).updateResumeAnnoConnect(evaluate);
		return num;
	}
	
	
	
	
	
	
	
}
