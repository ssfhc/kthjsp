package notice.controller.customer;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import notice.controller.NController;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeDelProcController implements NController{
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeDelProcController mvc2신호");
		
		String num = request.getParameter("c");
		NoticeDao dao = new NoticeDao();
		int cnt = dao.delete(num);
		if(cnt>0){
			response.sendRedirect("notice.do");
		}
	}
}
