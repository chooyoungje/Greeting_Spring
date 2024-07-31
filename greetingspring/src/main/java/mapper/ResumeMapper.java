package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Resume;

public interface ResumeMapper {

	// 이력서의 다음 ID를 가져오기
	@Select("select resumeidseq.nextval from dual")
	public int selectResumeId();

	// 이력서 1개 가져오기
	@Select("select * from resume where resumeid = #{resumeId}")
	public Resume getResume(int resumeId);

	// 회원이 작성한 이력서 목록 가져오기
	@Select("select resumeid, to_char(registdate,'YYYY-MM-DD PM HH:MI:SS') as registDate, resumetitle, isdefault from resume where memberid=#{memberId}")
	public List<Resume> getMemberResumeList(String memberId);

	// resumeId, registerDate, resumeTtitle, isDefault

	// 기업이 작성한 이력서 목록 가져오기
	@Select("select * from resume where businessid=#{businessId}")
	public List<Resume> getBusinessResumeList(String businessId);

	// 공고에 지원한 이력서 목록 가져오기
//	@Select("select * from resume, resume_anno_connect where annoid=#{annoId}")
//	public List<Resume> getAnnoResumeList(int annoId);
	
	@Select("select * from resume r JOIN resume_anno_connect rac ON r.resumeid = rac.resumeid where rac.annoid=#{annoId}")
	public List<Resume> getAnnoResumeList(int annoId);
	

	@Select("select profileimage from resume where memberid=#{memberId}")
	public String getProfileImage(String memberId);

	// 이력서 삽입
	@Insert("insert into resume values(#{resumeId},#{resumeTitle},#{profileImage},"
			+ "#{name},#{birth},#{phone},#{email},sysdate,#{selfInfo},#{certification},#{language},"
			+ "#{address},#{memberId},#{businessId},#{isDefault})")
	public int insertResume(Resume resume);

	// 이력서 삭제
	@Delete("delete from resume where resumeid = #{resumeId}")
	public int deleteResume(int resumeId);

	// 회원이 등록한 이력서 갯수 세기
	@Select("select count(*) from resume where memberid = #{memberId}")
	public int getMemberResumeSize(String memberId);

	@Update("update resume set resumetitle=#{resumeTitle}, profileimage=#{profileImage}, name=#{name}, birth=#{birth},"
			+ "phone=#{phone},email=#{email},registdate = sysdate,selfinfo=#{selfInfo},certification=#{certification},"
			+ "language=#{language},address=#{address}" + " where resumeid = #{resumeId}")
	public int updateResume(Resume resume);

	// 여기서부터 시작
	// DB에 있는 이력서 isDefault 값 전부 0으로 바꾸기
	@Update("update resume set isdefault=0 where memberid = #{memberId}")
	public int updateResumeToZero(String memberId);

	// 내가 선택한 이력서의 isDefault 값 1로 바꾸기
	@Update("update resume set isdefault=1 where resumeid = #{resumeId}")
	public int updateResumeToDefault(int resumeId);

	@Select("select * from resume where memberid = #{memberId} and isdefault = 1")
	public Resume getMemberResumeDefault(String memberId);
	
	
	
	
	
	
	
	
	// 기업 입장에서 자기 공고에 지원한 이력서들을 볼 때, 이력서를 DB에서 불러오는 쿼리
	@Select("select r.*, rac.annoid as annoId, rac.columnstage as columnStage, "
			+ "to_char(resume_check_date,'YYYY-MM-DD PM HH:MI:SS')as resumeCheckDate, "
			+ "to_char(resume_register_date,'YYYY-MM-DD PM HH:MI:SS')as registerToCompanyDate, "
			+ "rac.resumescore as resumeScore "
			+ "from resume r, resume_anno_connect rac "
			+ "where r.resumeid = rac.resumeid "
			+ "and annoid=#{annoId}")
	public List<Resume> getResumeToBusinessManagement(int annoId);
	
	
	
	
}
