package goodsReplySvc;

import java.sql.Connection;
import java.util.List;
import goodsReplyDAO.GoodsReplyDAO;
import goodsReplyDTO.GoodsReplyDTO;
import static db.JdbcUtil.*;

public class GoodsReplyListCodeSvc {
	public List<GoodsReplyDTO> goodsReplyCodeList(int goods_code,int pageNumber){
		Connection con = getConnection();
		GoodsReplyDAO goodsReplyDAO = GoodsReplyDAO.getInstance();
		goodsReplyDAO.setConnection(con);
		List<GoodsReplyDTO> list = goodsReplyDAO.goodsReplyCodeList(goods_code,pageNumber);
		return list;
		
	}
	
	public int goodsReplyListCodeCount(int goods_code) {
		Connection con = getConnection();
		GoodsReplyDAO goodsReplyDAO = GoodsReplyDAO.getInstance();
		goodsReplyDAO.setConnection(con);
		int goodsReplyListCount = goodsReplyDAO.goodsReplyListCodeCount(goods_code);
		return goodsReplyListCount;
	}

}
