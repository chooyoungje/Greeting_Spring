package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mapper.BusinessMapper;
import model.Business;
import model.Search;
import model.Sort;
import util.MybatisConnection;

@Component
public class BusinessDAO {
	
	@Autowired
	SqlSessionTemplate session;
	
	// 기업 정보 조회
	public Business getBusiness(String businessId) {
		Business business = session.getMapper(BusinessMapper.class).getBusiness(businessId);
		return business;
	}
	
	// 전체 기업 리스트 조회
	public List<Business> businessList() {
		List<Business> businessList = session.getMapper(BusinessMapper.class).businessList();
		return businessList;
	}

	// 기업 정보 입력(회원가입)
	public int insertBusiness(Business business) {
		int businessNum = session.getMapper(BusinessMapper.class).insertBusiness(business);
		
		return businessNum;
	}

	// 기업 정보 수정
	public int updateBusiness(Business business) {
		int bnum = session.getMapper(BusinessMapper.class).updateBusiness(business);
		
		return bnum;
	}
	
	// 기업 비밀번호 수정하기
//	public int changePw(String businessId, String changePw) {
//		Map map = new HashMap();
//		map.put("businessId", businessId);
//		map.put("changePw", changePw);
//		int num = session.getMapper(BusinessMapper.class).changePw(map);
//		
//		return num;
//	}

	// 기업 정보 삭제
	public int deleteBusiness(String businessName) {
		int bnum = session.getMapper(BusinessMapper.class).deleteBusiness(businessName);
		
		return bnum;
	}

	// 기업체의 유형(type)별 리스트 조회
	public List<Business> typeList(String type) {
		List<Business> typeList = session.getMapper(BusinessMapper.class).typeList(type);
		return typeList;
	}

	// 기업의 해당 산업(industry)별 리스트 조회
	public List<Business> industryList(String industry) {
		List<Business> industryList = session.getMapper(BusinessMapper.class).industryList(industry);
		return industryList; 
	}

	// 기업의 해당 상세 산업(industry)별 리스트 조회
	public List<Business> detailIndustryList(String industry, String detailIndustry) {
		List<Business> detailIndustryList = session.getMapper(BusinessMapper.class).detailIndustryList(industry, detailIndustry);
		return detailIndustryList;
	}
	
//	// 기업 조건 검색
//	public List<Business> searchBusinessList(Search search) {
//		// 검색 결과가 없을 수도 있고 정확한 타입인지 확인하기 위해 List로 받는다.
//		List<Business> searchBusinessList = session.getMapper(BusinessMapper.class).searchBusinessList(search);
////		session.close();
//		return searchBusinessList;
//	} 
	
	
	// 기업 검색어 리스트
    public List<Business> searchBusinessList(Search search) {
        List<Business> searchBusinessList = session.getMapper(BusinessMapper.class)
                .searchBusinessList(search);
        return searchBusinessList;
    }
	
	
	// 기업 리스트 정렬
	public List<Business> sortBusinessList(Sort sort) {
		List<Business> sortBusinessList = session.getMapper(BusinessMapper.class).sortBusinessList(sort);
		return sortBusinessList; 
	}
}
