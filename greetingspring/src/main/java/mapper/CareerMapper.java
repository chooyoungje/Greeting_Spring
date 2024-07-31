package mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Career;

public interface CareerMapper {

	// 경력 정보를 가져오기
	@Select("select * from career where resumeid=#{resumeId} ")
	public Career getCareer(int resumeId);
	
	@Insert("insert into career values(careerseq.nextval,#{companyName},#{department},#{workPart},"
			+ "#{position},#{workType},#{isWorking},#{workPeriod},#{resumeId})")
	public int insertCareer(Career career);

	
	@Update("update career set companyname=#{companyName}, department=#{department}, workpart=#{workPart},"
			+ "position=#{position}, worktype=#{workType}, isWorking=#{isWorking}, workperiod=#{workPeriod} "
			+ "where careerid=#{careerId}")
	public int updateCareer(Career career);
	
	
}