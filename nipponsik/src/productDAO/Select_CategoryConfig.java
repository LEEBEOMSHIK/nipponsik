package productDAO;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatisfiles.Select_CategoryProcess;
import productDTO.ProductDTO;

public class Select_CategoryConfig implements MybatisAction{
	static Select_CategoryConfig select_CategoryConfig = new Select_CategoryConfig();
	public static Select_CategoryConfig instance() {
		return select_CategoryConfig;
	}
	@Override
	public String showdata(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int cate_list = Integer.parseInt(request.getParameter("cate_list"));
		int goods_category = 0;
		if(cate_list == 101 || cate_list == 102 || cate_list == 103 || cate_list == 104 || cate_list == 105 || cate_list == 106 || cate_list == 107 || cate_list == 108 || cate_list == 109 ) {
			goods_category = cate_list%10;
		} else {
			goods_category = cate_list%100;
		}
		Select_CategoryProcess select_CategoryProcess = Select_CategoryProcess.instance();
		List<ProductDTO> list = select_CategoryProcess.selectList(goods_category);
		request.setAttribute("list", list);
		
		int selectListCount = select_CategoryProcess.selectListCount(goods_category);
		request.setAttribute("selectListCount", selectListCount);
		return "productcategory.jsp";
	}

}
