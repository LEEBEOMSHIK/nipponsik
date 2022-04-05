package goodsReplySvc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import goodsReplyDAO.GoodsReplyDAO;
import goodsReplyDTO.GoodsReplyDTO;

public class GoodsReplyModifySvc {
	public int goodsReplyModify(GoodsReplyDTO goodsReplyDTO) {
		Connection con = getConnection();
		GoodsReplyDAO goodsReplyDAO = GoodsReplyDAO.getInstance();
		goodsReplyDAO.setConnection(con);
		int modifyResult = goodsReplyDAO.updateGds(goodsReplyDTO);
		
		if(modifyResult == 1) {
			commit(con);
		}else {
			rollback(con);
		}
		return modifyResult;
	}
	public String goodsReplyModifyWriter(int gds_num) {
		Connection con = getConnection();
		GoodsReplyDAO goodsReplyDAO = GoodsReplyDAO.getInstance();
		goodsReplyDAO.setConnection(con);
		String writer = goodsReplyDAO.isWriter(gds_num);
		return writer;
	}

}
