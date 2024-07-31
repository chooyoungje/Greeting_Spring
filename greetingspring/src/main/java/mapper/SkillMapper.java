package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import model.Skill;

public interface SkillMapper {
	// 스킬 가져오기
	@Select("select * from skill where skillid = #{skillId}")
	Skill getSkill(String id);

	// 스킬 리스트
	@Select("select * from skil")
	List<Skill> SkillList();
}
