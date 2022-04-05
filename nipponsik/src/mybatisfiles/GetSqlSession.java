package mybatisfiles;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class GetSqlSession {
	static SqlSessionFactory sqlSession;
	public static SqlSessionFactory getSqlSession() {
		return sqlSession;
	}
	
	static {
		try {
			String resource = "mybatisfiles/dbConnectConfig.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			SqlSessionFactoryBuilder sqlSessionfactory = new SqlSessionFactoryBuilder();
			sqlSession = sqlSessionfactory.build(reader);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
