package book;

public class BookReviewDto {

   private int revseq;
   private String revcontent;
   private String revdate;
   private int rating;
   
   private int booknum;
   private int membernum;
   private String userid;
   private String userimage;
   
   public BookReviewDto() {
      
   }

   public BookReviewDto(int revseq, String revcontent, String revdate, int rating, int booknum, int membernum,
         String userid, String userimage) {
      super();
      this.revseq = revseq;
      this.revcontent = revcontent;
      this.revdate = revdate;
      this.rating = rating;
      this.booknum = booknum;
      this.membernum = membernum;
      this.userid = userid;
      this.userimage = userimage;
   }
   
   public BookReviewDto(String revcontent, int rating, int booknum, int membernum) {
      super();
      
      this.revcontent = revcontent;
      this.rating = rating;
      this.booknum = booknum;
      this.membernum = membernum;
   }

   public int getRevseq() {
      return revseq;
   }

   public void setRevseq(int revseq) {
      this.revseq = revseq;
   }

   public String getRevcontent() {
      return revcontent;
   }

   public void setRevcontent(String revcontent) {
      this.revcontent = revcontent;
   }

   public String getRevdate() {
      return revdate;
   }

   public void setRevdate(String revdate) {
      this.revdate = revdate;
   }

   public String getUserimage() {
      return userimage;
   }

   public void setUserimage(String userimage) {
      this.userimage = userimage;
   }

   public int getRating() {
      return rating;
   }

   public void setRating(int rating) {
      this.rating = rating;
   }

   public int getBooknum() {
      return booknum;
   }

   public void setBooknum(int booknum) {
      this.booknum = booknum;
   }

   public int getMembernum() {
      return membernum;
   }

   public void setMembernum(int membernum) {
      this.membernum = membernum;
   }

   public String getUserid() {
      return userid;
   }

   public void setUserid(String userid) {
      this.userid = userid;
   }

   @Override
   public String toString() {
      return "BookReviewDto [revseq=" + revseq + ", revcontent=" + revcontent + ", revdate=" + revdate + ", rating="
            + rating + ", booknum=" + booknum + ", membernum=" + membernum + ", userid=" + userid + ", userimage="
            + userimage + "]";
   }

   
   
   
   
}