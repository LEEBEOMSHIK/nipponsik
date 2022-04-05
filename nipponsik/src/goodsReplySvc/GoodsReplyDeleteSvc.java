package goodsReplySvc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import goodsReplyDAO.GoodsReplyDAO;

public class GoodsReplyDeleteSvc {
	public int goodsReplyDelete(int gds_num) {
		Connection con = getConnection();
		GoodsReplyDAO goodsReplyDAO = GoodsReplyDAO.getInstance();
		goodsReplyDAO.setConnection(con);
		int deleteResult = goodsReplyDAO.deleteGds(gds_num);
		if(deleteResult == 1) {
			commit(con);
		}else {
			rollback(con);
		}
		return deleteResult;
	}

}
