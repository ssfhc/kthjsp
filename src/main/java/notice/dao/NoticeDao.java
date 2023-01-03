package notice.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import notice.db.DBCon;

import notice.vo.Notice;

public class NoticeDao {
	
	public List<Notice> getList() throws Exception{
		Connection conn =DBCon.getConnection();
		//접속성공 상태
		String sql = "select * from notices order by to_number(seq) desc";

		//실행
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		
		//리스트를 담을 그릇
		List<Notice> list=new ArrayList<Notice>();
		while (rs.next()) {
			Notice n=new Notice();
			n.setSeq(rs.getString("seq"));
			n.setTitle(rs.getString("title"));
			n.setWriter(rs.getString("writer"));
			n.setContent(rs.getString("content"));
			n.setRegdate(rs.getDate("regdate"));
			n.setHit(rs.getInt("hit"));
			
			list.add(n);
		}
		return list;
	}
	
	  public int delete(Notice n) throws Exception { 
	  
		  Connection conn=DBCon.getConnection();
	  
		  String sql = "delete from notices where seq = ?";
	  
		  PreparedStatement pstmt = conn.prepareStatement(sql); pstmt.setString(1,
				  n.getSeq());
	  
	  
		  int cnt = pstmt.executeUpdate();
	  
		  return cnt; }
	 
		
		public int delete(String num) throws Exception {

			Connection conn=DBCon.getConnection();
			
			String sql = "delete from notices where seq = ?";

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);


			int cnt = pstmt.executeUpdate();
			
			return cnt;
		}

		public int insert(Notice n) {

			
			PreparedStatement pstmt = null;
			Connection conn = null;
			int cnt = 0;
			try{

				conn=DBCon.getConnection();
				
				String sql = "insert into notices(seq,title,writer,content,regdate,hit)";
						sql +=" values((select max(to_number(seq))+1 from notices)";
						sql +=",?,'cj',?,systimestamp,0)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, n.getTitle());
				pstmt.setString(2, n.getContent());
				cnt = pstmt.executeUpdate();
				 
			}catch(Exception e){
				e.printStackTrace();
			}
			return cnt;
		}

		public int update(Notice n) throws Exception {
			Connection conn=DBCon.getConnection();
			//접속성공상태
			//String sql = "select * from notices where seq='"+seq+"'";
			String sql = "update notices set title = ? , content = ? where seq = ?";  
			 //실행
			 //Statement st = conn.createStatement();
			 PreparedStatement pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, n.getTitle());
			 pstmt.setString(2, n.getContent());
			 pstmt.setString(3, n.getSeq());
			 

			 int cnt = pstmt.executeUpdate();
			 return cnt;
		}
	
		public Notice getNotice(String seq) throws Exception {
			Connection conn=DBCon.getConnection();
			//접속성공상태
			String sql = "select * from notices where seq=?";  
			//실행
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, seq);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			//Notice.java파일에 저장 setting 
			Notice n = new Notice(); //(rs에서 받은 데이터를 notice에 넣기위해)
			n.setSeq(rs.getString("seq"));
			n.setTitle(rs.getString("title"));
			n.setWriter(rs.getString("writer"));
			n.setContent(rs.getString("content"));
			n.setRegdate(rs.getDate("regdate"));
			n.setHit(rs.getInt("hit"));
			
			
			
			rs.close();
			pstmt.close();
			conn.close();
			
			
			return n;
		}
		
}
