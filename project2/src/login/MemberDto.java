package login;

import java.util.List;

public class MemberDto {

	
	private int membernum;
	private String userid;
	private String pwd;
	private String email;
	private int gender;
	private String phone;
	private String birth;
	private int activity;
	private int auth;
	private int clubmaster;
	private String userimage;
	
	public MemberDto() {
		
	}
	
	public MemberDto(int membernum, String userid, String pwd, String email, int gender, String phone, String birth,
			int activity, int auth, int clubmaster, String userimage) {
		this.membernum = membernum;
		this.userid = userid;
		this.pwd = pwd;
		this.email = email;
		this.gender = gender;
		this.phone = phone;
		this.birth = birth;
		this.activity = activity;
		this.auth = auth;
		this.clubmaster = clubmaster;
		this.userimage = userimage;
	}

	public MemberDto(String userid, String pwd, String email, int gender, String phone, String birth, String userimage) {
		super();
		this.userid = userid;
		this.pwd = pwd;
		this.email = email;
		this.gender = gender;
		this.phone = phone;
		this.birth = birth;
		this.userimage = userimage;
	}

	public MemberDto(String userid, int auth) {
		super();
		this.userid = userid;
		this.auth = auth;
	}

	public MemberDto(int membernum, String userid, String email, int gender, int clubmaster, String userimage) {
		super();
		this.membernum = membernum;
		this.userid = userid;
		this.email = email;
		this.gender = gender;
		this.clubmaster = clubmaster;
		this.userimage = userimage;
		
	}
	
	
	public MemberDto(int membernum, String userid, int auth) {
		super();
		this.membernum = membernum;
		this.userid = userid;
		this.auth = auth;
	}
	
	public MemberDto(int membernum, String userid, int auth, String userimage) {
		super();
		this.membernum = membernum;
		this.userid = userid;
		this.auth = auth;
		this.userimage = userimage;
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

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public int getActivity() {
		return activity;
	}

	public void setActivity(int activity) {
		this.activity = activity;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	public int getClubmaster() {
		return clubmaster;
	}

	public void setClubmaster(int clubmaster) {
		this.clubmaster = clubmaster;
	}

	public String getUserimage() {
		return userimage;
	}

	public void setUserimage(String userimage) {
		this.userimage = userimage;
	}

	@Override
	public String toString() {
		return "MemberDto [membernum=" + membernum + ", userid=" + userid + ", pwd=" + pwd + ", email=" + email
				+ ", gender=" + gender + ", phone=" + phone + ", birth=" + birth + ", activity=" + activity + ", auth="
				+ auth + ", clubmaster=" + clubmaster + ", userimage=" + userimage + "]";
	}
	

	
}

