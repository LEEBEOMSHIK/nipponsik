package goodsReplySvc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import goodsReplyDAO.GoodsReplyDAO;
import goodsReplyDTO.GoodsReplyDTO;

public class GoodsReplyAgainSvc {
	public int insertReply(GoodsReplyDTO goodsReplyDTO) {
		Connection con = getConnection();
		GoodsReplyDAO goodsReplyDAO = GoodsReplyDAO.getInstance();
		goodsReplyDAO.setConnection(con);
		int insertReplyResult = goodsReplyDAO.insertReply(goodsReplyDTO);
		
		if(insertReplyResult == 1) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return insertReplyResult;
	}
}
