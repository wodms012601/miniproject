package books;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.ResultSet;

public class bookDao {
	
	public booksManagement selectBookInfo(int bid) {
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

			System.out.println("�뜲�씠�꽣 踰좎씠�뒪 �뿰寃�");

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
	
	public void selectUpdateBook(booksManagement b) {
		Connection connection = null;
        PreparedStatement statement = null;
        
        try {
			Class.forName("com.mysql.jdbc.Driver");
			 
			String URL = "jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr";
			String dbUserId = "books_id01";
			String dbPassword = "books_pw01";
			
			connection = DriverManager.getConnection(URL, dbUserId, dbPassword);
		
			System.out.println("�뜲�씠�꽣 踰좎씠�뒪 �뿰寃�");
		
			statement = connection.prepareStatement("UPDATE books_management SET book_cate=?, book_name=?, book_writer=?, book_publisher=? WHERE info=?");
			statement.setString(1, b.getBook_cate());
			statement.setString(2, b.getBook_name());
			statement.setString(3, b.getBook_writer());
			statement.setString(4, b.getBook_publisher());
			statement.setInt(5, b.getInfo());
		
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
	
	public booksManagement selectUpdateForm(int bid) {
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
		
			System.out.println("�뜲�씠�꽣 踰좎씠�뒪 �뿰寃�");
		
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
	
	public void deleteBook(int bid) {
		Connection connection = null;
	    PreparedStatement statement = null;
		
        try {
			Class.forName("com.mysql.jdbc.Driver");
			 
			String URL = "jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr";
			String dbUserId = "books_id01";
			String dbPassword = "books_pw01";
			
			connection = DriverManager.getConnection(URL, dbUserId, dbPassword);
		
			System.out.println("�뜲�씠�꽣 踰좎씠�뒪 �뿰寃�");
		
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
	
    public ArrayList<booksManagement> selectBookList(int beginRow, int pagePerRow) {
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
		
			System.out.println("�뜲�씠�꽣 踰좎씠�뒪 �뿰寃�");
			
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
    
    public int selectBookListCount() {
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
		
			System.out.println("�뜲�씠�꽣 踰좎씠�뒪 �뿰寃�");
			
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

	public int binsert(booksManagement b) {
		Connection connection = null;
	    PreparedStatement statement = null;
	    
	try {
		Class.forName("com.mysql.jdbc.Driver");
			 
		String URL = "jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr";		
		String dbUserId = "books_id01";
		String dbPassword = "books_pw01";
		
		connection = DriverManager.getConnection(URL, dbUserId, dbPassword);
	
		System.out.println("�뜲�씠�꽣 踰좎씠�뒪 �뿰寃�");
		
		statement = connection.prepareStatement("INSERT INTO books_management(book_cate, book_name, book_writer, book_publisher, book_record_date) VALUES (?,?,?,?,now())");
		statement.setString(1, b.getBook_cate());
		statement.setString(2, b.getBook_name());
		statement.setString(3, b.getBook_writer());
		statement.setString(4, b.getBook_publisher());
		
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