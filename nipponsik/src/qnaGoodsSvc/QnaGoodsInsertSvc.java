package qnaGoodsSvc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import qnaGoodsDAO.QnaGoodsDAO;
import qnaGoodsDTO.QnaGoodsDTO;

public class QnaGoodsInsertSvc {
	
	public int qnaInsert(QnaGoodsDTO qnaGoodsDTO) {
		Connection conn = getConnection();
		QnaGoodsDAO qnaGoodsDAO = QnaGoodsDAO.getInstance();
		qnaGoodsDAO.setConnection(conn);
		int result = qnaGoodsDAO.insertQna(qnaGoodsDTO);
		
		if(result == 1) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

}
