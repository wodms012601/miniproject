package books;

public class booksManagement {
	private int info;
	private String book_cate;
	private String book_name;
	private String book_writer;
	private String book_publisher;
	private String book_date;
	public int getInfo() {
		return info;
	}
	public void setInfo(int info) {
		this.info = info;
	}
	public String getBook_cate() {
		return book_cate;
	}
	public void setBook_cate(String book_cate) {
		this.book_cate = book_cate;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getBook_writer() {
		return book_writer;
	}
	public void setBook_writer(String book_writer) {
		this.book_writer = book_writer;
	}
	public String getBook_publisher() {
		return book_publisher;
	}
	public void setBook_publisher(String book_publisher) {
		this.book_publisher = book_publisher;
	}
	public String getBook_date() {
		return book_date;
	}
	public void setBook_date(String book_date) {
		this.book_date = book_date;
	}
	@Override
	public String toString() {
		return "book_management [info=" + info + ", book_cate=" + book_cate + ", book_name=" + book_name
				+ ", book_writer=" + book_writer + ", book_publisher=" + book_publisher + ", book_date=" + book_date
				+ "]";
	}
}