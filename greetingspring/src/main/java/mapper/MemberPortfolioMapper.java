package mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.MemberPortfolio;

public interface MemberPortfolioMapper {

	
	@Insert("insert into memberportfolio values(memberportfolioseq.nextval"
			+ ",#{portfolioUrl},#{portfolioFile},#{resumeId})")
	public int insertPortfolio(MemberPortfolio portfolio);
	
	@Select("select * from memberportfolio where resumeid = #{resumeId}")
	public MemberPortfolio getPortfolio(int resumeId);

	
	@Update("update memberportfolio set portfoliourl=#{portfolioUrl}, portfoliofile=#{portfolioFile}"
			+ "where portfolioid = #{portfolioId}")
	public int updatePortfolio(MemberPortfolio portfolio);
}

