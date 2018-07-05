package books;

public class booksManagement {
	private int info;
	private String book_cate;
	private String book_name;
	private String book_writer;
	private String book_publisher;
	private String book_short;
	private String book_contents;
	private String book_record_date;
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
	public String getBook_short() {
		return book_short;
	}
	public void setBook_short(String book_short) {
		this.book_short = book_short;
	}
	public String getBook_contents() {
		return book_contents;
	}
	public void setBook_contents(String book_contents) {
		this.book_contents = book_contents;
	}
	public String getBook_record_date() {
		return book_record_date;
	}
	public void setBook_record_date(String book_record_date) {
		this.book_record_date = book_record_date;
	}
	@Override
	public String toString() {
		return "booksManagement [info=" + info + ", book_cate=" + book_cate + ", book_name=" + book_name
				+ ", book_writer=" + book_writer + ", book_publisher=" + book_publisher + ", book_short=" + book_short
				+ ", book_contents=" + book_contents + ", book_record_date=" + book_record_date + "]";
	}

}