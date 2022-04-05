package goodsReplyAction;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import action.Action;
import goodsReplyDTO.GoodsReplyDTO;
import goodsReplySvc.GoodsReplyInsertSvc;
import vo.ActionForward;

public class GoodsReplyInsertAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		String cust_id = null;
		HttpSession session = request.getSession();
		if(session.getAttribute("idbox") != null) {
			cust_id = (String)session.getAttribute("idbox");
		}
		if(cust_id == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요한 서비스 입니다.');");
			out.println("location.href='loginpage.jsp';");
			out.println("</script>");
		}
		
		String realFolder = "";
		String saveFolder = "/goodsReviewFile";
		int fileSize = 5*1024*1024;
		ServletContext context = request.getServletContext();  //파일 저장 위치의 주체를 넣어주기 위함
		realFolder = context.getRealPath(saveFolder);
		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize,"utf-8", new DefaultFileRenamePolicy());
		
		int goods_code = 0;
		if(multi.getParameter("goods_code") != null) {
			goods_code = Integer.parseInt(multi.getParameter("goods_code"));
		}
		String gdsRe_content = null;
		if(multi.getParameter("gdsRe_content") != null) {
			gdsRe_content = multi.getParameter("gdsRe_content");
		}
		int gdsRe_star = 0;
		if(multi.getParameter("gdsRe_star") != null) {
			gdsRe_star = Integer.parseInt(multi.getParameter("gdsRe_star"));
		}
		String gdsReply_safac = null;
		if(multi.getParameter("gdsReply_safac") != null) {
			gdsReply_safac = multi.getParameter("gdsReply_safac");
		}
		
		GoodsReplyDTO goodsReplyDTO = new GoodsReplyDTO();
		goodsReplyDTO.setGdsRe_cust_id(cust_id);
		goodsReplyDTO.setGdsRe_gdsCode(goods_code);
		goodsReplyDTO.setGdsRe_imgFile(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));
		goodsReplyDTO.setGdsRe_content(gdsRe_content);
		goodsReplyDTO.setGdsRe_star(gdsRe_star);
		goodsReplyDTO.setGdsRe_safac(gdsReply_safac);
		
		GoodsReplyInsertSvc goodsReplyInsertSvc = new GoodsReplyInsertSvc();
		int insertResult = goodsReplyInsertSvc.insertGds(goodsReplyDTO);
		
		if(insertResult == 1) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('상품 리뷰가 성공적으로 이루어졌습니다.');");
			out.println("</script>");
			forward = new ActionForward();
			forward.setPath("/review.manage");
		}else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('상품 리뷰 작성에 실패했습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
		
		return forward;
	}

}
