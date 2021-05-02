package schedule;

import java.io.Serializable;

public class ScheduleDto implements Serializable{
	
	private int scheduleseq;
	private int booknum;
	private int membernum;
	private int subscribe;
	private String schstart;
	private String schend;
	private String booktitle;
	
	public ScheduleDto() {
	}

			
	public ScheduleDto(int scheduleseq, int booknum, int membernum, int subscribe, String schstart, String schend,
			String booktitle) {
		super();
		this.scheduleseq = scheduleseq;
		this.booknum = booknum;
		this.membernum = membernum;
		this.subscribe = subscribe;
		this.schstart = schstart;
		this.schend = schend;
		this.booktitle = booktitle;
	}

	

	public ScheduleDto(int booknum, int membernum, int subscribe, String schstart, String schend, String booktitle) {
		super();
		this.booknum = booknum;
		this.membernum = membernum;
		this.subscribe = subscribe;
		this.schstart = schstart;
		this.schend = schend;
		this.booktitle = booktitle;
	}


	public ScheduleDto(int booknum, String schstart, String schend) {
		super();
		this.booknum = booknum;
		this.schstart = schstart;
		this.schend = schend;
	}

	public int getScheduleseq() {
		return scheduleseq;
	}

	public void setScheduleseq(int scheduleseq) {
		this.scheduleseq = scheduleseq;
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

	public int getSubscribe() {
		return subscribe;
	}

	public void setSubscribe(int subscribe) {
		this.subscribe = subscribe;
	}

	public String getSchstart() {
		return schstart;
	}

	public void setSchstart(String schstart) {
		this.schstart = schstart;
	}

	public String getSchend() {
		return schend;
	}

	public void setSchend(String schend) {
		this.schend = schend;
	}


	public String getBooktitle() {
		return booktitle;
	}


	public void setBooktitle(String booktitle) {
		this.booktitle = booktitle;
	}


	@Override
	public String toString() {
		return "ScheduleDto [scheduleseq=" + scheduleseq + ", booknum=" + booknum + ", membernum=" + membernum
				+ ", subscribe=" + subscribe + ", schstart=" + schstart + ", schend=" + schend + ", booktitle="
				+ booktitle + "]";
	}

	
	
	
	
}
