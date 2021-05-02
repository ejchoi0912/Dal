package club;

public class TalkDto {
	private int talkseq;
	private String talkcontent;
	private String talkdate;
	private int membernum;
	private String userid;
	private int cardseq;
	
	public TalkDto() {
	}

	public TalkDto(int talkseq, String talkcontent, String talkdate, String userid, int cardseq) {
		super();
		this.talkseq = talkseq;
		this.talkcontent = talkcontent;
		this.talkdate = talkdate;
		this.userid = userid;
		this.cardseq = cardseq;
	}

	
	public TalkDto(int talkseq, String talkcontent, String talkdate, int membernum, int cardseq) {
		super();
		this.talkseq = talkseq;
		this.talkcontent = talkcontent;
		this.talkdate = talkdate;
		this.membernum = membernum;
		this.cardseq = cardseq;
	}

	public TalkDto(String talkcontent, int membernum, int cardseq) {
		super();
		this.talkcontent = talkcontent;
		this.membernum = membernum;
		this.cardseq = cardseq;
	}

	public int getTalkseq() {
		return talkseq;
	}

	public void setTalkseq(int talkseq) {
		this.talkseq = talkseq;
	}

	public String getTalkcontent() {
		return talkcontent;
	}

	public void setTalkcontent(String talkcontent) {
		this.talkcontent = talkcontent;
	}

	public String getTalkdate() {
		return talkdate;
	}

	public void setTalkdate(String talkdate) {
		this.talkdate = talkdate;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getCardseq() {
		return cardseq;
	}

	public void setCardseq(int cardseq) {
		this.cardseq = cardseq;
	}

	
	public int getMembernum() {
		return membernum;
	}

	public void setMembernum(int membernum) {
		this.membernum = membernum;
	}

	@Override
	public String toString() {
		return "TalkDto [talkseq=" + talkseq + ", talkcontent=" + talkcontent + ", talkdate=" + talkdate
				+ ", userid=" + userid + ", cardseq=" + cardseq + "]";
	}
	
	
}
