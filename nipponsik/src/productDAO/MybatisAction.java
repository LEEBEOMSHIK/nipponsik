package productDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface MybatisAction {
	public String showdata(HttpServletRequest request,HttpServletResponse response) throws Exception; 

}
