package goodsReplySvc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import goodsReplyDAO.GoodsReplyDAO;
import goodsReplyDTO.GoodsReplyDTO;

public class GoodsReplyDetailSvc {
	public GoodsReplyDTO goodsReplyOne(int goods_code) {
		Connection con = getConnection();
		GoodsReplyDAO goodsReplyDAO = GoodsReplyDAO.getInstance();
		goodsReplyDAO.setConnection(con);
		GoodsReplyDTO goodsReplyDTO = goodsReplyDAO.goodsReplyOne(goods_code);
		return goodsReplyDTO;
	}

}
