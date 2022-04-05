package action;

import javax.servlet.http.*;

import vo.ActionForward;

public interface Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception;
}
  // 인터페이스를 통해서 담으면 객체 컨트롤이 쉽다!!