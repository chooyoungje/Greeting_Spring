package model;
public class Skill {
	   int skillId;
	   String skills;
	   int annoId;

	   // 모든 필드를 초기화하는 생성자 추가
	   public Skill(int skillId, String skills, int annoId) {
	      this.skillId = skillId;
	      this.skills = skills;
	      this.annoId = annoId;
	   }

	   // 기본 생성자
	   public Skill() {
	   }

	public int getSkillId() {
		return skillId;
	}

	public void setSkillId(int skillId) {
		this.skillId = skillId;
	}

	public String getSkills() {
		return skills;
	}

	public void setSkills(String skills) {
		this.skills = skills;
	}

	public int getAnnoId() {
		return annoId;
	}

	public void setAnnoId(int annoId) {
		this.annoId = annoId;
	}

	@Override
	public String toString() {
		return "Skill [skillId=" + skillId + ", skills=" + skills + ", annoId=" + annoId + "]";
	}

	  

	}