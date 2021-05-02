package book;

public class BookDto {
	private int booknum;		// 책번호
	private String booktitle;	// 책제목
	private int categories;		// 관심분야
	private int bookreadcount;	// 조회수
	private int bookdel;		// 삭제유무
	private double grade;			// 별점
	
	private String author;		// 책저자
	private String issudate;	// 발행연도
	private String bookheader;	// 책소개
	private String publisher;	// 출판사
	private String bookimage;
	
	public BookDto() {
	}

	public BookDto(int booknum, String booktitle, int categories, int bookreadcount, int bookdel, double grade, String author,
			String issudate, String bookheader, String publisher, String bookimage) {
		super();
		this.booknum = booknum;
		this.booktitle = booktitle;
		this.categories = categories;
		this.bookreadcount = bookreadcount;
		this.grade = grade;
		this.author = author;
		this.issudate = issudate;
		this.bookheader = bookheader;
		this.publisher = publisher;
		this.bookimage = bookimage;
	}
	
	//insert용 생성자
	public BookDto(int booknum, String booktitle, int categories, String author, String issudate, String bookheader, String publisher, String bookimage) {
		super();
		this.booknum = booknum;
		this.booktitle = booktitle;
		this.categories = categories;
		this.author = author;
		this.issudate = issudate;
		this.bookheader = bookheader;
		this.publisher = publisher;
		this.bookimage = bookimage;
	}
	
	public BookDto(int booknum, String booktitle, int categories, int bookreadcount, int grade) {
		super();
		this.booknum = booknum;
		this.booktitle = booktitle;
		this.categories = categories;
		this.bookreadcount = bookreadcount;
		this.grade = grade;
	}

	public BookDto(String author, String issudate, String bookheader, String publisher) {
		super();
		this.author = author;
		this.issudate = issudate;
		this.bookheader = bookheader;
		this.publisher = publisher;
	}
	
	

	public BookDto(String booktitle, int categories, String author, String issudate, String bookheader,
			String publisher, String bookimage) {
		super();
		this.booktitle = booktitle;
		this.categories = categories;
		this.author = author;
		this.issudate = issudate;
		this.bookheader = bookheader;
		this.publisher = publisher;
		this.bookimage = bookimage;
	}

	public int getBooknum() {
		return booknum;
	}

	public void setBooknum(int booknum) {
		this.booknum = booknum;
	}

	public String getBooktitle() {
		return booktitle;
	}

	public void setBooktitle(String booktitle) {
		this.booktitle = booktitle;
	}

	public int getCategories() {
		return categories;
	}

	public void setCategories(int categories) {
		this.categories = categories;
	}

	public int getBookreadcount() {
		return bookreadcount;
	}

	public void setBookreadcount(int bookreadcount) {
		this.bookreadcount = bookreadcount;
	}

	public double getGrade() {
		return grade;
	}

	public void setGrade(double grade) {
		this.grade = grade;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getIssudate() {
		return issudate;
	}

	public void setIssudate(String issudate) {
		this.issudate = issudate;
	}

	public String getBookheader() {
		return bookheader;
	}

	public void setBookheader(String bookheader) {
		this.bookheader = bookheader;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	
	public int getBookdel() {
		return bookdel;
	}

	public void setBookdel(int bookdel) {
		this.bookdel = bookdel;
	}

	public String getBookimage() {
		return bookimage;
	}

	public void setBookimage(String bookimage) {
		this.bookimage = bookimage;
	}

	@Override
	public String toString() {
		return "BookDto [booknum=" + booknum + ", booktitle=" + booktitle + ", categories=" + categories
				+ ", bookreadcount=" + bookreadcount + ", bookdel=" + bookdel + ", grade=" + grade + ", author="
				+ author + ", issudate=" + issudate + ", bookheader=" + bookheader + ", publisher=" + publisher
				+ ", bookimage=" + bookimage + "]";
	}

	
}

