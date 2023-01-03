package notice.controller.customer;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import notice.controller.NController;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeEditProcController implements NController{
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeEditProcController mvc2신호");
		
		request.setCharacterEncoding("utf-8");

		String num = request.getParameter("c");
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		Notice n = new Notice();
		n.setTitle(title);
		n.setContent(content);
		n.setSeq(num);

		NoticeDao dao = new NoticeDao();
		int cnt = dao.update(n); //업데이트 처리가 되었다면
		
		
		
		//detail로 가는 처리
		n = dao.getNotice(num);
		
		//request에 Notice n 을 담아    noticeDetail로 보내기
		request.setAttribute("n", n);
		request.getRequestDispatcher("noticeDetail.jsp").forward(request, response);
	
	}
}
