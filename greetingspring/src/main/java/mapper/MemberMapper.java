package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Member;

public interface MemberMapper {

	// 회원 가입
	@Insert("insert into member values(#{memberId}, #{memberPw}, #{name}, #{gender}, #{email}, #{phone}, #{birth}, null)")
	int insertMember(Member member);

	// 회원 정보 가져오기
	@Select("select * from member where memberid = #{memberId}")
	Member getMember(String memberId);

	// 회원 이름으로 정보 가져오기
	@Select("select * from member where name = #{name}")
	Member getMemname(String name);

	// 회원 리스트
	@Select("select * from member")
	List<Member> MemberList();

	// 회원 정보 수정
	@Update("update member set email = #{email}, phone = #{phone}, birth = #{birth}")
	int updateMember(Member mem);

	// 회원 비밀번호 변경
	@Update("update member set memberpw = #{changePw} where memberid = #{memberId}")
	int changePw(Map map);

	// 회원 삭제
	@Delete("delete member where memberid = #{memberId}")
	int deleteMember(String memberId);

	// 회원 프로필 이미지 추가
	@Insert("insert into member (profileimage) values(#{profileImage} where memberid = #{memberId})")
	int insertProfileImage(String profileImage, String memberId);
	
	// 회원 프로필 이미지 변경
	@Update("update member set profileimage = #{profileImage} where memberid = #{memberId}")
	int updateProfileImage(Map<String,String> map);
}
