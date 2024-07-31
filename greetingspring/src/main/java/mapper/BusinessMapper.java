package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Business;
import model.Search;
import model.Sort;

public interface BusinessMapper {

	// 기업 정보 가져오기
	@Select("select * from business where businessid = #{businessId}")
	Business getBusiness(String businessId);

	// 기업 리스트
	@Select("select * from business")
	List<Business> businessList();

	// 기업 정보 입력(회원가입)
	@Insert("insert into business values(#{businessId}, #{businessPw}, #{businessName}, #{address}, #{salary}, #{welfare}, #{ceo}, #{sales}, #{employees}, #{type}, #{industry}, #{detailIndustry}, #{homepage}, #{content})")
	int insertBusiness(Business business);

	// 기업 정보 수정
	@Update("update business set businessid=#{businessId}, businesspw=#{businessPw}, businessname=#{businessName}, address=#{address}, salary=#{salary}, welfare=#{welfare}, ceo=#{ceo}, sales=#{sales}, employees=#{employees}, type=#{type}, industry=#{industry}, detailindustry=#{detailIndustry}, homepage=#{homepage}, content=#{content} where businessid=#{businessId}")
	int updateBusiness(Business business);
	
	// 기업 비번 수정
//	@Update("update business set businesspw = #{changePw} where businessid = #{businessId}")
//	int changePw(Map map);

	// 기업 정보 삭제
	@Delete("delete from business where businessid = #{businessId}")
	int deleteBusiness(String businessId);

	// 기업 유형(type)별 리스트
	@Select("select * from business where type=#{type}")
	List<Business> typeList(String type);

	// 기업 해당 산업(industry)별 리스트
	@Select("select * from business where industry=#{industry}")
	List<Business> industryList(String industry);

	// 기업 해당 상세 산업(industry)별 리스트
	@Select("select * from business where industry=#{industry} and detailindustry=#{detailIndustry}")
	List<Business> detailIndustryList(String industry, String detailIndustry);

//	// 기업 검색어 리스트
//	@Select("select * from business where upper(${part}) like upper(#{searchData})")
//	List<Business> searchBusinessList(Search search);
	
	// 기업 조건 검색
    @Select({
        "<script>",
        "SELECT * FROM business",
        "WHERE upper(${part}) LIKE upper(#{searchData})",
        "<if test='sortData != null and !sortData.isEmpty()'>",
        "ORDER BY ${sortData}",
        "</if>",
        "</script>"
    })
    List<Business> searchBusinessList(Search search);
    
	
	
	// 기업 리스트 정렬
	@Select("SELECT * FROM business ORDER BY ${sortData} ${ascDesc}")
	List<Business> sortBusinessList(Sort sort);
	
	
}