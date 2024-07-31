package mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Anno;
import model.Column;
import model.Resume;
import model.Search;
import model.Skill;

public interface AnnoMapper {

	// 스킬의 다음 ID를 가져오기
	@Select("select skillseq.nextval from dual")
	public int selectSkillId();

	// 스킬의 다음 ID를 가져오기
	@Select("select annoseq.nextval from dual")
	public int selectAnnoId();

	// annoId, businessId, businessName, annoTitle, annoGrade, annoWorkType,
	// annoWorkPlace, annoDate
	// 모든 공고 목록 조회
	@Select("select * from anno order by annoid desc")
	List<Anno> getAnnoList();

	// 회사id로 해당 회사 공고 개수 조회
	@Select("SELECT COUNT(*) FROM anno WHERE businessId = #{businessId}")
	Anno AnnoCountFromBusinessId(String businessId);

	// 공고id로 해당 공고 1개 조회
	@Select("SELECT * FROM anno WHERE annoId = #{annoId}")
	Anno getAnnoFromAnnoId(int annoId);
	
	// 회사id로 해당 회사 공고 리스트 조회
	@Select("SELECT * FROM anno WHERE businessId = #{businessId}")
	List<Anno> getAnnoListFromBusinessId(String businessId);

	// 회사명으로 해당 회사 공고 리스트 조회
	@Select("SELECT * FROM anno WHERE businessName = #{businessName}")
	List<Anno> getAnnoListFromBusinessName(String businessName);

	// 공고 제목으로 검색하여 검색어가 포함된 공고 리스트 조회
	@Select("SELECT * FROM anno WHERE annoTitle LIKE '%${annoTitle}%' ")
	List<Anno> getAnnoListFromAnnoTitle(String annoTitle);

	// 경력 조건으로 검색하여 검색 조건에 맞는 공고 리스트 조회
	@Select("SELECT * FROM anno WHERE annoCareer LIKE '%${annoCareer}%' ")
	List<Anno> getAnnoListFromAnnoCareer(String annoCareer);

	// 연봉 조건으로 검색하여 연봉이 해당 금액 이상인 공고 리스트 조회
	@Select("SELECT * FROM anno WHERE annoSalary >= #{annoSalary}")
	List<Anno> getAnnoListFromAnnoSalary(int annoSalary);

	// 학력 조건으로 검색하여 해당 학력이 포함된 공고 리스트 조회
	@Select("SELECT * FROM anno WHERE annoEdu LIKE '%${annoEdu}%' ")
	List<Anno> getAnnoListFromAnnoEdu(String annoEdu);

	// 등급 조건으로 검색하여 해당 등급이 포함된 공고 리스트 조회
	@Select("SELECT * FROM anno WHERE annoGrade LIKE '%${annoGrade}%' ")
	List<Anno> getAnnoListFromAnnoGrade(String annoGrade);

	// 근무지 조건으로 검색하여 검색어가 포함된 공고 리스트 조회
	@Select("SELECT * FROM anno WHERE annoWorkPlace LIKE '%${annoWorkPlace}%' ")
	List<Anno> getAnnoListFromAnnoWorkPlace(String annoWorkPlace);

	// 공통 조건으로 검색하여 검색어가 포함된 공고 리스트 조회
	@Select("SELECT * FROM anno WHERE annoCommon LIKE '%${annoCommon}%' ")
	List<Anno> getAnnoListFromAnnoCommon(String annoCommon);

	// 자격 조건으로 검색하여 검색어가 포함된 공고 리스트 조회
	@Select("SELECT * FROM anno WHERE annoQualification LIKE '%${annoQualification}%' ")
	List<Anno> getAnnoListFromAnnoQualification(String annoQualification);

	// skillId 조건으로 검색하여 검색어가 포함된 공고 리스트 조회
	@Select("SELECT * FROM anno WHERE skillId LIKE '%${skillId}%' ")
	List<Anno> getAnnoListFromSkillId(int skillId);

	// 등록일 순으로 공고 리스트 조회
	@Select("SELECT * FROM anno ORDER BY annoDate")
	List<Anno> getAnnoListFromAnnoDate();

	// 최신순으로 공고 리스트 조회
	@Select("SELECT * FROM anno ORDER BY annoDate DESC")
	List<Anno> getAnnoListFromAnnoDateDesc();

	// 스킬 삽입
	@Insert("INSERT INTO Skill VALUES (#{skillId}, #{skills}, #{annoId})")
	int insertSkill(Skill skill);

	// 모든 스킬 조회
	@Select("SELECT * FROM Skill")
	List<Skill> getAllSkills();

	// 공고 삽입
	@Insert("INSERT INTO Anno (annoId, businessName, welfare, annoTitle, annoCareer, annoSalary, annoEdu, annoGrade, annoWorkType, annoWorkDay, annoWorkPlace, annoCommon, annoQualification, annoPickNum, annoDate, annoContent, businessId, skillId, annoDeadline) VALUES (#{annoId}, #{businessName}, #{welfare}, #{annoTitle}, #{annoCareer}, #{annoSalary}, #{annoEdu}, #{annoGrade}, #{annoWorkType}, #{annoWorkDay}, #{annoWorkPlace}, #{annoCommon}, #{annoQualification}, #{annoPickNum}, sysdate, #{annoContent}, #{businessId}, #{skillId}, #{annoDeadline})")
	int insertAnno(Anno anno);

	// 공고 아이디 불러오기
	@Select("SELECT annoseq.currval FROM dual")
	int getAnnoId();

	// 공고 스킬 삽입
	@Insert("INSERT INTO AnnoSkill (annoId, skillId) VALUES (#{annoId}, #{skillId})")
	int insertAnnoSkill(int annoId, int skillId);

	// 공고 수정
	@Update("UPDATE anno SET businessName=#{businessName}, welfare=#{welfare}, annoTitle=#{annoTitle}, annoCareer=#{annoCareer}, annoSalary=#{annoSalary}, annoEdu=#{annoEdu}, annoGrade=#{annoGrade}, annoWorkType=#{annoWorkType}, annoWorkDay=#{annoWorkDay}, annoWorkPlace=#{annoWorkPlace}, annoCommon=#{annoCommon}, annoQualification=#{annoQualification}, annoPickNum=#{annoPickNum}, annoContent=#{annoContent}, businessId=#{businessId}, skillId=#{skillId}, annoDeadline=#{annoDeadline} WHERE annoId=#{annoId}")
	int updateAnno(Anno anno);

	// 스킬 수정
	@Update("UPDATE skill set skills=#{skills} WHERE skillId=#{skillId}")
	int updateAnnoSkill(int skillId);

	// 공고 삭제
	@Delete("DELETE FROM anno WHERE annoId=#{annoId}")
	int deleteAnno(int annoId);

	// 공고 id로 스킬 조회
	@Select("SELECT skills FROM Skill WHERE annoId = #{annoId}")
	Skill getSkillsByAnnoId(int annoId);

	@Delete("DELETE FROM Skill WHERE annoid = #{annoId}")
	int deleteSkillsByAnnoId(int annoId);

	// deadline 가져오기
	@Select("select annoDeadline from anno where annoId = #{annoId}")
	Date getAnnoDeadline(int annoId);

	// 공고 검색어 리스트
	@Select("select * from anno where upper(${part}) like upper(#{searchData})")
	List<Anno> searchAnnoList(Search search);

	// 공고에 지원한 사람 수 조회 // 테이블이 resume가 아닐 수도 있음
	@Select("SELECT COUNT(*) FROM resume_anno_connect WHERE annoId = #{annoId}")
	int getResumeCount(int annoId);
	
	// 내가 지원한 공고 리스트
	@Select("select a.* from anno a, resume_anno_connect rac where rac.resumeid = #{resumeId} and a.annoid = rac.annoid")
	List<Anno> userMyAnnoList(int resumeId);
	
	// 컬럼에 대한 정보를 저장
	@Insert("insert into columntable values(#{annoId},#{columnTitle},#{columnStage})")
	public int insertColumn(Column column);

	// 컬럼에 대한 정보를 가져오기
	@Select("select * from columntable where annoid=#{annoId}")
	public Column getColumn(int annoId);

	@Update("update columntable set  columntitle = #{columnTitle}, columnstage=#{columnStage} where annoid=#{annoId}")
	public int updateColumn(Column column);
	
	// 내가 지원한 공고 아이디
	@Select("select annoid from resume_anno_connect where resumeid=${resumeId} ")
	List<Anno> userMyAnnoIdList(int resumeId);
	

}
