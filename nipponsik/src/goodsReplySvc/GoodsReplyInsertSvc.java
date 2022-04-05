package goodsReplySvc;

import java.sql.Connection;
import static db.JdbcUtil.*;
import goodsReplyDAO.GoodsReplyDAO;
import goodsReplyDTO.GoodsReplyDTO;

public class GoodsReplyInsertSvc {
	public int insertGds(GoodsReplyDTO goodsReplyDTO) {
		
		Connection con = getConnection();
		GoodsReplyDAO goodsReplyDAO = GoodsReplyDAO.getInstance();
		goodsReplyDAO.setConnection(con);
		int insertResult = goodsReplyDAO.insertGds(goodsReplyDTO);
		
		if(insertResult == 1) {
			commit(con);
		}else {
			rollback(con);
		}
		return insertResult;
	}
	
	public int insertReply(GoodsReplyDTO goodsReplyDTO) {
		Connection con = getConnection();
		GoodsReplyDAO goodsReplyDAO = GoodsReplyDAO.getInstance();
		goodsReplyDAO.setConnection(con);
		int insertReplyCount = goodsReplyDAO.insertReply(goodsReplyDTO);
		
		if(insertReplyCount == 1) {
			commit(con);
		}else {
			rollback(con);
		}
		return insertReplyCount;
	}

}
