package mybatisfiles;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import productDTO.ProductDTO;

public class Select_CategoryProcess {
	static Select_CategoryProcess select_CategoryProcess = new Select_CategoryProcess();
	public static Select_CategoryProcess instance() {
		return select_CategoryProcess;
	}
	
	private SqlSessionFactory sqlSession = GetSqlSession.getSqlSession();
	
	public List<ProductDTO> selectList(int goods_category){
		SqlSession sqlse = sqlSession.openSession();
		List<ProductDTO> list = sqlse.selectList("mapper.selectcategory",goods_category);
		sqlse.close();
		return list;
	}
	
	public int selectListCount(int goods_category) {
		SqlSession sqlse = sqlSession.openSession();
		int selectListCount = sqlse.selectOne("selectcategorycount", goods_category);
		sqlse.close();
		return selectListCount;
	}

}
