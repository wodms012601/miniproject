package books;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.ResultSet;

public class bookDao {
	
	
	public ArrayList<booksManagement> selectSearchSv(booksManagement b, String sk, String sv) { // 모든 컬럼 검색 (포함되는 글자 가능)
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultset = null;
        
		ArrayList<booksManagement> alt = new ArrayList<>();
		
        try {
			Class.forName("com.mysql.jdbc.Driver");

			String URL = "jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr";
			String dbUserId = "books_id01";
			String dbPassword = "books_pw01";

			connection = DriverManager.getConnection(URL, dbUserId, dbPassword);

			System.out.println("데이터 베이스 연결");

			statement = connection.prepareStatement("SELECT info, book_cate, book_name, book_writer, book_publisher, book_record_date"
				+" FROM books_management "
				+" WHERE "+ sk +" like '%" + sv + "%' ");

			resultset = statement.executeQuery();

		while(resultset.next()) {
			b = new booksManagement();
			b.setInfo(resultset.getInt(1));
			b.setBook_cate(resultset.getString(2));
			b.setBook_name(resultset.getString(3));
			b.setBook_writer(resultset.getString(4));
			b.setBook_publisher(resultset.getString(5));
			b.setBook_record_date(resultset.getString(6));
			
			alt.add(b);
		}
		} catch(SQLException | ClassNotFoundException a) {
			System.out.println(a.getMessage() + "<-- catch");
			
		} finally{
			
			try {
				if(statement != null) statement.close();
				if(connection != null) connection.close();
			}
			catch(SQLException a) {
				System.out.println(a.getMessage() + "<-- catch");
			}
		}
		return alt;	
	}
	
	public ArrayList<booksManagement> selectSearchSv(booksManagement b, String sv) { // 책 이름만 검색 (포함되는 글자 가능)
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultset = null;
        
		ArrayList<booksManagement> alt = new ArrayList<>();
		
        try {
			Class.forName("com.mysql.jdbc.Driver");

			String URL = "jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr";
			String dbUserId = "books_id01";
			String dbPassword = "books_pw01";

			connection = DriverManager.getConnection(URL, dbUserId, dbPassword);

			System.out.println("데이터 베이스 연결");

			statement = connection.prepareStatement("SELECT info, book_cate, book_name, book_writer, book_publisher, book_record_date"
				+" FROM books_management "
				+" WHERE book_name like '%" + sv + "%' ");
		
			resultset = statement.executeQuery();
		
		while(resultset.next()) {
			b = new booksManagement();
			b.setInfo(resultset.getInt(1));
			b.setBook_cate(resultset.getString(2));
			b.setBook_name(resultset.getString(3));
			b.setBook_writer(resultset.getString(4));
			b.setBook_publisher(resultset.getString(5));
			b.setBook_record_date(resultset.getString(6));
			
			alt.add(b);
		}
		} catch(SQLException | ClassNotFoundException a) {
			System.out.println(a.getMessage() + "<-- catch");
			
		} finally{
			
			try {
				if(statement != null) statement.close();
				if(connection != null) connection.close();
			}
			catch(SQLException a) {
				System.out.println(a.getMessage() + "<-- catch");
			}
		}
		return alt;	
	}
	
	public ArrayList<booksManagement> selectSearchDate(String begin, String end, String sk, String sv) { // 날짜와 책 이름 검색 (포함되는 문자 가능)
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultset = null;
        booksManagement b = null;
        
		int beginYear = Integer.parseInt(begin.substring(0, 4));
		int beginMonth = Integer.parseInt(begin.substring(5, 7));
		int beginDay = Integer.parseInt(begin.substring(8, 10));
		int endYear = Integer.parseInt(end.substring(0, 4));
		int endMonth = Integer.parseInt(end.substring(5, 7));
		int endDay = Integer.parseInt(end.substring(8, 10));
		
		ArrayList<booksManagement> alt = new ArrayList<>();
		
        try {
			Class.forName("com.mysql.jdbc.Driver");

			String URL = "jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr";
			String dbUserId = "books_id01";
			String dbPassword = "books_pw01";

			connection = DriverManager.getConnection(URL, dbUserId, dbPassword);

			System.out.println("데이터 베이스 연결");
				
			statement = connection.prepareStatement("SELECT info, book_cate, book_name, book_writer, book_publisher, book_record_date"
				+" FROM books_management "
				+" WHERE (year(book_record_date) >= " + beginYear + ") AND (year(book_record_date) <= " + endYear + ")"
				+" AND (month(book_record_date) >= " + beginMonth + ") AND (month(book_record_date) <= " + endMonth + ")"
				+" AND (day(book_record_date) >= " + beginDay + ") and (day(book_record_date) <= " + endDay + ")"
				+" AND "+ sk +" like '%" + sv + "%' ");
			
			resultset = statement.executeQuery();
				
			while(resultset.next()) {
				b = new booksManagement();
				b.setInfo(resultset.getInt(1));
				b.setBook_cate(resultset.getString(2));
				b.setBook_name(resultset.getString(3));
				b.setBook_writer(resultset.getString(4));
				b.setBook_publisher(resultset.getString(5));
				b.setBook_record_date(resultset.getString(6));
				
				alt.add(b);
		}
		} catch(SQLException | ClassNotFoundException a) {
			System.out.println(a.getMessage() + "<-- catch");
			
		} finally{
			
			try {
				if(statement != null) statement.close();
				if(connection != null) connection.close();
			}
			catch(SQLException a) {
				System.out.println(a.getMessage() + "<-- catch");
			}
		}
		return alt;
	}
		
	public ArrayList<booksManagement> selectSearchDate(String begin, String end) { // 날짜만 입력해서 게시글 검색
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultset = null;
        
		int beginYear = Integer.parseInt(begin.substring(0, 4));
		int beginMonth = Integer.parseInt(begin.substring(5, 7));
		int beginDay = Integer.parseInt(begin.substring(8, 10));
		int endYear = Integer.parseInt(end.substring(0, 4));
		int endMonth = Integer.parseInt(end.substring(5, 7));
		int endDay = Integer.parseInt(end.substring(8, 10));
		
		ArrayList<booksManagement> alt = new ArrayList<>();
		
        try {
			Class.forName("com.mysql.jdbc.Driver");

			String URL = "jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr";
			String dbUserId = "books_id01";
			String dbPassword = "books_pw01";

			connection = DriverManager.getConnection(URL, dbUserId, dbPassword);

			System.out.println("데이터 베이스 연결");
				
			statement = connection.prepareStatement("SELECT info, book_cate, book_name, book_writer, book_publisher, book_record_date"
				+" FROM books_management "
				+" WHERE (year(book_record_date) >= " + beginYear + ") AND (year(book_record_date) <= " + endYear + ")"
				+" AND (month(book_record_date) >= " + beginMonth + ") AND (month(book_record_date) <= " + endMonth + ")"
				+" AND (day(book_record_date) >= " + beginDay + ") AND (day(book_record_date) <= " + endDay + ")");
		
			resultset = statement.executeQuery();
		
		while(resultset.next()) {
			booksManagement b = new booksManagement();
			b = new booksManagement();
			b.setInfo(resultset.getInt(1));
			b.setBook_cate(resultset.getString(2));
			b.setBook_name(resultset.getString(3));
			b.setBook_writer(resultset.getString(4));
			b.setBook_publisher(resultset.getString(5));
			b.setBook_record_date(resultset.getString(6));
			
			alt.add(b);
		}
		} catch(SQLException | ClassNotFoundException a) {
			System.out.println(a.getMessage() + "<-- catch");
			
		} finally{
			
			try {
				if(statement != null) statement.close();
				if(connection != null) connection.close();
			}
			catch(SQLException a) {
				System.out.println(a.getMessage() + "<-- catch");
			}
		}
		return alt;	
	}
	
	public booksManagement selectBookInfo(int bid) { // 도서리스트 상세보기
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultset = null;
        booksManagement b = null;

        try {
			Class.forName("com.mysql.jdbc.Driver");

			String URL = "jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr";
			String dbUserId = "books_id01";
			String dbPassword = "books_pw01";

			connection = DriverManager.getConnection(URL, dbUserId, dbPassword);

			System.out.println("데이터 베이스 연결");

			statement = connection.prepareStatement("SELECT * FROM books_management WHERE info=?");
			statement.setInt(1, bid);
			resultset = statement.executeQuery();
		if(resultset.next()) {
			b = new booksManagement();
			b.setInfo(resultset.getInt("info"));
			b.setBook_cate(resultset.getString("book_cate"));
			b.setBook_name(resultset.getString("book_name"));
			b.setBook_writer(resultset.getString("book_writer"));
			b.setBook_publisher(resultset.getString("book_publisher"));
			b.setBook_short(resultset.getString("book_short"));
			b.setBook_contents(resultset.getString("book_contents"));
			b.setBook_record_date(resultset.getString("book_record_date"));
		}
		} catch(SQLException | ClassNotFoundException a) {
			System.out.println(a.getMessage() + "<-- catch");
			
		} finally{
			
			try {
				if(statement != null) statement.close();
				if(connection != null) connection.close();
			}
			catch(SQLException a) {
				System.out.println(a.getMessage() + "<-- catch");
			}
		}
		return b;		
	}
	
	public void selectUpdateBook(booksManagement b) { // 도서리스트 업데이트 액션
		Connection connection = null;
        PreparedStatement statement = null;
        
        try {
			Class.forName("com.mysql.jdbc.Driver");
			 
			String URL = "jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr";
			String dbUserId = "books_id01";
			String dbPassword = "books_pw01";
			
			connection = DriverManager.getConnection(URL, dbUserId, dbPassword);
		
			System.out.println("데이터 베이스 연결");
		
			statement = connection.prepareStatement("UPDATE books_management SET book_cate=?, book_name=?, book_writer=?, book_publisher=?, book_short=?, book_contents=? WHERE info=?");
			statement.setString(1, b.getBook_cate());
			statement.setString(2, b.getBook_name());
			statement.setString(3, b.getBook_writer());
			statement.setString(4, b.getBook_publisher());
			statement.setString(5, b.getBook_short());
			statement.setString(6, b.getBook_contents());
			statement.setInt(7, b.getInfo());
		
			statement.executeUpdate();
		
		} catch(SQLException | ClassNotFoundException a) {
			System.out.println(a.getMessage() + "<-- catch");
			
		} finally{
			
			try {
				if(statement != null) statement.close();
				if(connection != null) connection.close();
			}
			catch(SQLException a) {
				System.out.println(a.getMessage() + "<-- catch");
			}
		}		
	}
	
	public booksManagement selectUpdateForm(int bid) { // 도서리스트 업데이트 폼
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultset = null;
        booksManagement b = null;
              
        try {
			Class.forName("com.mysql.jdbc.Driver");
			 
			String URL = "jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr";
			String dbUserId = "books_id01";
			String dbPassword = "books_pw01";
			
			connection = DriverManager.getConnection(URL, dbUserId, dbPassword);
		
			System.out.println("데이터 베이스 연결");
		
			statement = connection.prepareStatement("SELECT * FROM books_management WHERE info=?");
			statement.setInt(1, bid);
			resultset = statement.executeQuery();
			
			if(resultset.next()) {
	            b = new booksManagement();
	            b.setInfo(resultset.getInt("info"));
	            b.setBook_cate(resultset.getString("book_cate"));
	            b.setBook_name(resultset.getString("book_name"));
	            b.setBook_writer(resultset.getString("book_writer"));
	            b.setBook_publisher(resultset.getString("book_publisher"));
	            b.setBook_short(resultset.getString("book_short"));
	            b.setBook_contents(resultset.getString("book_contents"));
			}
		} catch(SQLException | ClassNotFoundException a) {
			System.out.println(a.getMessage() + "<-- catch");
			
		} finally{
			
			try {
				if(statement != null) statement.close();
				if(connection != null) connection.close();
			}
			catch(SQLException a) {
				System.out.println(a.getMessage() + "<-- catch");
			}
		}
		return b;
	}    
	
	public void deleteBook(int bid) { // 도서리스트 글 삭제
		Connection connection = null;
	    PreparedStatement statement = null;
		
        try {
			Class.forName("com.mysql.jdbc.Driver");
			 
			String URL = "jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr";
			String dbUserId = "books_id01";
			String dbPassword = "books_pw01";
			
			connection = DriverManager.getConnection(URL, dbUserId, dbPassword);
		
			System.out.println("데이터 베이스 연결");
		
			statement = connection.prepareStatement("DELETE FROM books_management WHERE info=?");
			statement.setInt(1, bid);
			statement.executeUpdate();
		
		} catch(SQLException | ClassNotFoundException a) {
			System.out.println(a.getMessage() + "<-- catch");
			
		} finally{
			
			try {
				if(statement != null) statement.close();
				if(connection != null) connection.close();
			}
			catch(SQLException a) {
				System.out.println(a.getMessage() + "<-- catch");
			}
		}		
	}
	
    public ArrayList<booksManagement> selectBookList(int beginRow, int pagePerRow) { // 도서리스트 페이징
    	ArrayList<booksManagement> bookList = new ArrayList<booksManagement>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultset = null;
        String sql = "SELECT * FROM books_management ORDER BY info DESC LIMIT ?, ?";
        try {
			Class.forName("com.mysql.jdbc.Driver");
			 
			String URL = "jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr";
			String dbUserId = "books_id01";
			String dbPassword = "books_pw01";
			
			connection = DriverManager.getConnection(URL, dbUserId, dbPassword);
		
			System.out.println("데이터 베이스 연결");
			
            statement = connection.prepareStatement(sql);
            statement.setInt(1, beginRow);
            statement.setInt(2, pagePerRow);
            
            resultset = statement.executeQuery();
            
            while(resultset.next()) {
            	booksManagement management = new booksManagement();
            	management.setInfo(resultset.getInt("info"));
            	management.setBook_cate(resultset.getString("book_cate"));
            	management.setBook_name(resultset.getString("book_name"));
            	management.setBook_writer(resultset.getString("book_writer"));
            	management.setBook_publisher(resultset.getString("book_publisher"));
            	management.setBook_record_date(resultset.getString("book_record_date"));
            	bookList.add(management);
            }
        } catch(SQLException | ClassNotFoundException a) {
			System.out.println(a.getMessage() + "<-- catch"); 
			
        } finally {
			try {
				if(statement != null) statement.close();
				if(connection != null) connection.close();
			}
			catch(SQLException a) {
				System.out.println(a.getMessage() + "<-- catch");
			}
        }
        return bookList;
    }
    
    public int selectBookListCount() { // 도서리스트 페이징
        int rowCount = 0;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultset = null;
        String sql = "SELECT COUNT(*) FROM books_management";
        try {
			Class.forName("com.mysql.jdbc.Driver");
			 
			String URL = "jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr";
			String dbUserId = "books_id01";
			String dbPassword = "books_pw01";
			
			connection = DriverManager.getConnection(URL, dbUserId, dbPassword);
		
			System.out.println("데이터 베이스 연결");
			
            statement = connection.prepareStatement(sql);
            resultset = statement.executeQuery();
            
            if(resultset.next()) {
                rowCount = resultset.getInt(1);
            }
        } catch(SQLException | ClassNotFoundException a) {
			System.out.println(a.getMessage() + "<-- catch");
			
        } finally {
        	
			try {
				if(statement != null) statement.close();
				if(connection != null) connection.close();
			}
			catch(SQLException a) {
				System.out.println(a.getMessage() + "<-- catch");
			}
        }
        return rowCount;
    }

	public int binsert(booksManagement b) { // 도서리스트 인설트
		Connection connection = null;
	    PreparedStatement statement = null;
	    
	try {
		Class.forName("com.mysql.jdbc.Driver");
			 
		String URL = "jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr";		
		String dbUserId = "books_id01";
		String dbPassword = "books_pw01";
		
		connection = DriverManager.getConnection(URL, dbUserId, dbPassword);
	
		System.out.println("데이터 베이스 연결");
		
		statement = connection.prepareStatement("INSERT INTO books_management(book_cate, book_name, book_writer, book_publisher, book_short, book_contents, book_record_date) VALUES (?,?,?,?,?,?,now())");
		statement.setString(1, b.getBook_cate());
		statement.setString(2, b.getBook_name());
		statement.setString(3, b.getBook_writer());
		statement.setString(4, b.getBook_publisher());
		statement.setString(5, b.getBook_short());
		statement.setString(6, b.getBook_contents());
		
		statement.executeUpdate();
		
	} catch(SQLException | ClassNotFoundException a) {
			System.out.println(a.getMessage() + "<-- catch");
			
	} finally{
			
			try {
				if(statement != null) statement.close();
				if(connection != null) connection.close();
			}
			catch(SQLException a) {
				System.out.println(a.getMessage() + "<-- catch");
			}
		}
	return 0;		
	}
}