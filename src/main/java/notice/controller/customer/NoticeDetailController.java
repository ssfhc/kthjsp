package notice.controller.customer;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import notice.controller.NController;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeDetailController implements NController{
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeDetailController mvc2신호");
		
		 String seq = request.getParameter("c");
		 System.out.println("num : "+seq);
		 if(seq==null)
			 seq="1";
		 
		 NoticeDao dao = new NoticeDao();
		 Notice n = dao.getNotice(seq);
		 
		 request.setAttribute("n", n);
		 
		 request.getRequestDispatcher("noticeDetail.jsp").forward(request,  response);
	}
}
