package goodsReplySvc;

import java.sql.Connection;
import java.util.List;
import goodsReplyDAO.GoodsReplyDAO;
import goodsReplyDTO.GoodsReplyDTO;
import static db.JdbcUtil.*;

public class GoodsReplyListSvc {
	public List<GoodsReplyDTO> goodsReplyList(int pageNumber){
		Connection con = getConnection();
		GoodsReplyDAO goodsReplyDAO = GoodsReplyDAO.getInstance();
		goodsReplyDAO.setConnection(con);
		List<GoodsReplyDTO> list = goodsReplyDAO.goodsReplyList(pageNumber);
		return list;
		
	}
	
	public int goodsReplyListCount() {
		Connection con = getConnection();
		GoodsReplyDAO goodsReplyDAO = GoodsReplyDAO.getInstance();
		goodsReplyDAO.setConnection(con);
		int goodsReplyListCount = goodsReplyDAO.goodsReplyListCount();
		return goodsReplyListCount;
	}

}
