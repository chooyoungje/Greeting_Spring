package util;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class MybatisConnection {
	private static SqlSessionFactory sqlmap;
	private MybatisConnection() {}
	static {
		Reader reader = null;
		try {
			reader = Resources.getResourceAsReader("util/mybatis-config.xml"); 
			sqlmap = new SqlSessionFactoryBuilder().build(reader);
			System.out.println("config ok");
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public static SqlSession getConnection() {
		return sqlmap.openSession();
		
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SqlSession session = getConnection();
		System.out.println(session);
	}
}
