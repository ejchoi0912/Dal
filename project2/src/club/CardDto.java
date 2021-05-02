package club;

public class CardDto {
   private int cardseq;
   private String cardtitle;
   private String cardtext;
   private String cardstart;
   private String cardend;
   private int booknum;
   private int clubseq;
   private String bookimg;
   
   public CardDto() {
   }

   public CardDto(int cardseq, String cardtitle, String cardtext, String cardstart, String cardend, int booknum, int clubseq) {
      super();
      this.cardseq = cardseq;
      this.cardtitle = cardtitle;
      this.cardtext = cardtext;
      this.cardstart = cardstart;
      this.cardend = cardend;
      this.booknum = booknum;
      this.clubseq = clubseq;
   }
   
      
   public CardDto(int cardseq, String cardtitle, String cardtext, String cardstart, String cardend, int booknum,int clubseq, String bookimg) {
	super();
	this.cardseq = cardseq;
	this.cardtitle = cardtitle;
	this.cardtext = cardtext;
	this.cardstart = cardstart;
	this.cardend = cardend;
	this.booknum = booknum;
	this.clubseq = clubseq;
	this.bookimg = bookimg;
}

public CardDto(int cardseq, String cardtitle, String cardtext, String cardstart, String cardend, String bookimg, int clubseq) {
	super();
	this.cardseq = cardseq;
	this.cardtitle = cardtitle;
	this.cardtext = cardtext;
	this.cardstart = cardstart;
	this.cardend = cardend;
	this.bookimg = bookimg;
	this.clubseq = clubseq;
}

public String getBookimg() {
	return bookimg;
}

public void setBookimg(String bookimg) {
	this.bookimg = bookimg;
}

public int getCardseq() {
      return cardseq;
   }

   public void setCardseq(int cardseq) {
      this.cardseq = cardseq;
   }

   public String getCardtitle() {
      return cardtitle;
   }

   public void setCardtitle(String cardtitle) {
      this.cardtitle = cardtitle;
   }

   public String getCardstart() {
      return cardstart;
   }

   public void setCardstart(String cardstart) {
      this.cardstart = cardstart;
   }

   public String getCardend() {
      return cardend;
   }

   public void setCardend(String cardend) {
      this.cardend = cardend;
   }

   public int getBooknum() {
      return booknum;
   }

   public void setBooknum(int booknum) {
      this.booknum = booknum;
   }

   public int getClubseq() {
      return clubseq;
   }

   public void setClubseq(int clubseq) {
      this.clubseq = clubseq;
   }


   public String getCardtext() {
      return cardtext;
   }
   
   public void setCardtext(String cardtext) {
      this.cardtext = cardtext;
   }

@Override
public String toString() {
	return "CardDto [cardseq=" + cardseq + ", cardtitle=" + cardtitle + ", cardtext=" + cardtext + ", cardstart="
			+ cardstart + ", cardend=" + cardend + ", booknum=" + booknum + ", clubseq=" + clubseq + ", bookimg="
			+ bookimg + "]";
}



   
}