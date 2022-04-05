package qnaGoodsSvc;

import java.sql.Connection;
import java.util.ArrayList;

import qnaGoodsDAO.QnaGoodsDAO;

import static db.JdbcUtil.*;
import qnaGoodsDTO.QnaGoodsDTO;

public class QnaGoodsListSvc {
	
	public ArrayList<QnaGoodsDTO> qnaList(int goods_code, int page){
		Connection conn = getConnection();
		QnaGoodsDAO qnaGoodsDAO = QnaGoodsDAO.getInstance();
		qnaGoodsDAO.setConnection(conn);
		ArrayList<QnaGoodsDTO> list = qnaGoodsDAO.qnaList(goods_code, page);
		return list;
	}
	
	public int qnaListCount() {
		Connection conn = getConnection();
		QnaGoodsDAO qnaGoodsDAO = QnaGoodsDAO.getInstance();
		qnaGoodsDAO.setConnection(conn);
		int qnaListCount = qnaGoodsDAO.qnaListCount();
		return qnaListCount;
	}

}
