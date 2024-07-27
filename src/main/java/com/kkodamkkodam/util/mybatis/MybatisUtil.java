package com.kkodamkkodam.util.mybatis;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisUtil {
	private static SqlSessionFactory sqlSessionFactory;
	static {
		
		try {
			InputStream inputStream = Resources.getResourceAsStream("mybatis/config/mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);

			System.out.println("실행성공:" + sqlSessionFactory);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("실행오류");
		}
	}
	//GETTER
	public static SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}
	
}