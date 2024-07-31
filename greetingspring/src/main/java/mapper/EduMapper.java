package mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Edu;

public interface EduMapper {

	@Insert("insert into edu values(eduseq.nextval,#{schoolType},#{schoolName},#{admissionDate},"
			+ "#{graduateDate},#{graduateState},#{major},#{score},#{totalScore},#{resumeId})")
	public int insertEdu(Edu edu);
	

	// 최종 학력 정보를 가져오기
	@Select("select * from edu where resumeid = #{resumeId}")
	public Edu getEdu(int resumeId);


	@Update("update edu set  schoolType = #{schoolType},schoolName = #{schoolName}, admissionDate = #{admissionDate},"
			+ "graduateDate=#{graduateDate},graduateState=#{graduateState},major=#{major},"
			+ "score=#{score},totalScore=#{totalScore} where eduid=#{eduId}")
	public int updateEdu(Edu edu);
}

