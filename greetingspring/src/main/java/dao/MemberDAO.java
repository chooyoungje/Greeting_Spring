package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mapper.MemberMapper;
import model.Member;
import util.MybatisConnection;

@Component
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate session;
	
	// 회원 가입
	public int insertMember(Member member) {
		int num = session.getMapper(MemberMapper.class).insertMember(member);
		
		return num;
	}
	
	// 회원 가져오기
	public Member getMember(String email) {
		Member member = session.getMapper(MemberMapper.class).getMember(email);
		
		return member;
	}
	
	// 회원 리스트 가져오기 
	public List<Member> memberList(){
		List<Member> list = session.getMapper(MemberMapper.class).MemberList();
		return list;
	}
	
	// 회원 정보 수정하기
	public int updateMember(Member member) {
		int num = session.getMapper(MemberMapper.class).updateMember(member);
		
		return num;
	}
	
	// 회원 비밀번호 수정하기
	public int changePw(String memberId, String changePw) {
		Map map = new HashMap();
		map.put("memberId", memberId);
		map.put("changePw", changePw);
		int num = session.getMapper(MemberMapper.class).changePw(map);
		
		return num;
	}

	// 회원 탈퇴하기
	public int deleteMember(String memberId) {
		int num = session.getMapper(MemberMapper.class).deleteMember(memberId);
		
		return num;
	}
	
	// 회원 사진 삽입
	public int insertProfileImage(String profileImage, String memberId) {
		int num = session.getMapper(MemberMapper.class).insertProfileImage(profileImage, memberId);
		
		return num;
	}
	
	// 회원 사진 변경
	public int updateProfileImage(String profileImage, String memberId) {
		Map<String,String> map = new HashMap<>();
		map.put("profileImage", profileImage);
		map.put("memberId", memberId);
		int num = session.getMapper(MemberMapper.class).updateProfileImage(map);
		
		return num;
	}
}
