package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Evaluate;
import model.Resume;
import model.ResumeAnnoConnection;


public interface Resume_Anno_ConnectMapper {

	
	// 공고에 이력서등록 -> 이력서에 공고ID 넣기
	@Update("insert into resume_anno_connect values(#{resumeId},#{annoId},sysdate,null,#{columnStage},#{resumeScore})")
	public int insertResumeAnnoConnect(Resume resume);
	

	// 회원이 지원한 공고인지 아닌지 판별하는 쿼리
	@Select("select count(*) from resume_anno_connect where annoid=#{annoId} and resumeid=#{resumeId}")
	public int isResumeRegister(Map<String, Integer> map);



	// ===========================================================================================

	// resume_anno_connect 이력서 평가에서 합격버튼을 눌렀을 때 이력서 단계 1 증가 시키기
	@Update("update resume_anno_connect set columnstage = #{evaluateStage} "
			+ "where resumeid=#{resumeId} and annoid=#{annoId}")
	public int updateResumeAnnoConnect(Evaluate evaluate);
	
	
}
