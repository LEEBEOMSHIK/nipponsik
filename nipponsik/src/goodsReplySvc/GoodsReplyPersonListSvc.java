package goodsReplySvc;

import java.sql.Connection;
import java.util.List;
import goodsReplyDAO.GoodsReplyDAO;
import static db.JdbcUtil.*;
import goodsReplyDTO.GoodsReplyDTO;

public class GoodsReplyPersonListSvc {
	public List<GoodsReplyDTO> personReplyList(String custom_id){
		Connection con = getConnection();
		GoodsReplyDAO goodsReplyDAO = GoodsReplyDAO.getInstance();
		goodsReplyDAO.setConnection(con);
		List<GoodsReplyDTO> list = goodsReplyDAO.personReplyList(custom_id);
		return list;
	}
	
	public int personReplyListCount(String custom_id){
		Connection con = getConnection();
		GoodsReplyDAO goodsReplyDAO = GoodsReplyDAO.getInstance();
		goodsReplyDAO.setConnection(con);
		int personReplyListCount = goodsReplyDAO.personReplyListCount(custom_id);
		return personReplyListCount;
	}

}
