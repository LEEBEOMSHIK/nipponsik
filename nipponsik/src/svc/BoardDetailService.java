package svc;

import java.sql.Connection;
import dao.BoardDAO;
import vo.BoardBean;
import static db.JdbcUtil.*;

public class BoardDetailService {

	public BoardBean getArticle(int board_num) throws Exception{  
		
		BoardBean article = null;
		Connection con = getConnection();          //
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		int updateCount = boardDAO.updateReadCount(board_num);  // 조회수 메소드 불러옴
		
		if(updateCount > 0){    //제대로 반환이 됐다면 1 반환
			commit(con);        // system.out 출력을 통해 체크하는 것도 좋을 듯
		}
		else{
			rollback(con);      
		}
		
		article = boardDAO.selectArticle(board_num);
		close(con);
		return article;
		
	}

}
