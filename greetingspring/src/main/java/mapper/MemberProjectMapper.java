package mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.MemberProject;

public interface MemberProjectMapper {

	
	@Insert("insert into memberproject values(memberprojectseq.nextval,#{projectName},#{team},#{isGoing},#{projectPeriod},#{projectInfo},#{resumeId})")
	public int insertProject(MemberProject project);
	
	@Select("select * from memberproject where resumeid=#{resumeId}")
	public MemberProject getProject(int resumeId);

	
	@Update("update memberproject set projectname=#{projectName}, team=#{team}, isgoing=#{isGoing},"
			+ "projectperiod=#{projectPeriod}, projectinfo=#{projectInfo}"
			+ "where projectid=#{projectId}")
	public int updateProject(MemberProject project);
}
