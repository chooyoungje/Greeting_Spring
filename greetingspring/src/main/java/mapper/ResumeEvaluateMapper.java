package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Evaluate;

public interface ResumeEvaluateMapper {
	
	
	// 
	@Insert("insert into resume_evaluate_table values("
			+ "#{resumeId},#{annoId},#{evaluateStage},sysdate,"
			+ "#{suitableScore},#{suitableContent},#{practicalScore},"
			+ "#{practicalContent},#{avgScore}"
			+ ")")
	public int insertResumeEvaluate(Evaluate evaluate);

	
	// 테이블에 존재하니??
	@Select("select count(*) from resume_evaluate_table "
			+ "where resumeid=#{resumeId} and annoid=#{annoId}")
	public int selectResumeEvaluate(Evaluate evaluate);

	
	// 테이블에 이미 값이 들어가 있는 경우 업데이트
	@Update("update resume_evaluate_table set evaluatestage=#{evaluateStage}, evaluatedate=sysdate,"
			+ "suitablescore=#{suitableScore}, suitablecontent=#{suitableContent},"
			+ "practicalscore=#{practicalScore}, practicalcontent=#{practicalContent},avgscore=#{avgScore} "
			+ "where resumeid=#{resumeId} and annoid=#{annoId}")
	public int updateResumeEvaluate(Evaluate evaluate);



	// 비즈니스 매니지먼트에서 이력서 평가로 페이지가 넘어갈 때 값 가져오기
	@Select("select * from resume_evaluate_table where resumeid=#{resumeId} and annoid=#{annoId}")
	public Evaluate getResumeEvaluate(Evaluate evaluate);


	
	@Select("select * from resume_evaluate_table where annoid=#{annoId}")
	public List<Evaluate> getResumeEvaluateList(int annoId);
	
	
}
