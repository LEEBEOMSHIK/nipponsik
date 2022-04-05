package searchAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import searchSvc.BaesongSelectListSvc;
import vo.ActionForward;

public class BaesongSelectListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String baesong = null;
		if(request.getParameter("baesong-item1") != null) {
			
		}
		ActionForward forward = null;
		BaesongSelectListSvc baesongSelectListSvc = new BaesongSelectListSvc();
		baesongSelectListSvc.baesongSelectList(baesong);
		
		return forward;
	}

}
