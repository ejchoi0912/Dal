package club;

public class ClubDto {
	private int clubseq;
	private String clubtitle;
	private String clubtext;
	private String clubdate;
	private int membernum; // 그룹장 번호
	private String userid;
	private String clubimage;
	private int talksum; //카드별 토크갯수, 활동순위볼때 필요 
	private int membersum;

	public ClubDto() {
	}

	public ClubDto(int clubseq, String clubtitle, String clubtext, String clubdate, int membernum, String clubimage) {
		super();
		this.clubseq = clubseq;
		this.clubtitle = clubtitle;
		this.clubtext = clubtext;
		this.clubdate = clubdate;
		this.membernum = membernum;
		this.clubimage = clubimage;
	}
	//맴버 번호 말고 아이디 받는
	public ClubDto(int clubseq, String clubtitle, String clubtext, String clubdate, String userid, String clubimage) {
		super();
		this.clubseq = clubseq;
		this.clubtitle = clubtitle;
		this.clubtext = clubtext;
		this.clubdate = clubdate;
		this.userid = userid;
		this.clubimage = clubimage;
	}
	
	// updata를 위함
	public ClubDto(int clubseq, String clubtitle, String clubtext, String clubimage) {
		super();
		this.clubseq = clubseq;
		this.clubtitle = clubtitle;
		this.clubtext = clubtext;
		this.clubimage = clubimage;
	}

	//클럽생성할때 필요
	public ClubDto(String clubtitle, String clubtext, int membernum, String clubimage) {
		super();
		this.clubtitle = clubtitle;
		this.clubtext = clubtext;
		this.membernum = membernum;
		this.clubimage = clubimage;
	}
	//CL.CLUBSEQ, CL.CLUBTITLE, AL.BOOKNUM, AL.TALKSUM 
	//책에서 책에 해당하는 클럽불러올때
	public ClubDto(int clubseq, String clubtitle, int talksum) {
		super();
		this.clubseq = clubseq;
		this.clubtitle = clubtitle;
		this.talksum = talksum;
	}
	
	public ClubDto(int clubseq, String clubtitle, String clubtext, String clubdate, int membernum, String clubimage,
			int membersum) {
		super();
		this.clubseq = clubseq;
		this.clubtitle = clubtitle;
		this.clubtext = clubtext;
		this.clubdate = clubdate;
		this.membernum = membernum;
		this.userid = userid;
		this.clubimage = clubimage;
		this.membersum = membersum;
	}

	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public int getClubseq() {
		return clubseq;
	}

	public void setClubseq(int clubseq) {
		this.clubseq = clubseq;
	}

	public String getClubtitle() {
		return clubtitle;
	}

	public void setClubtitle(String clubtitle) {
		this.clubtitle = clubtitle;
	}

	public String getClubtext() {
		return clubtext;
	}

	public void setClubtext(String clubtext) {
		this.clubtext = clubtext;
	}

	public String getClubdate() {
		return clubdate;
	}

	public void setClubdate(String clubdate) {
		this.clubdate = clubdate;
	}

	public int getMembernum() {
		return membernum;
	}

	public void setMembernum(int membernum) {
		this.membernum = membernum;
	}

	public String getClubimage() {
		return clubimage;
	}

	public void setClubimage(String clubimage) {
		this.clubimage = clubimage;
	}

	public int getTalksum() {
		return talksum;
	}

	public void setTalksum(int talksum) {
		this.talksum = talksum;
	}
	
	public int getMembersum() {
		return membersum;
	}

	public void setMembersum(int membersum) {
		this.membersum = membersum;
	}

	@Override
	public String toString() {
		return "ClubDto [clubseq=" + clubseq + ", clubtitle=" + clubtitle + ", clubtext=" + clubtext + ", clubdate="
				+ clubdate + ", membernum=" + membernum + ", clubimage=" + clubimage + "]";
	}
	
	
}
