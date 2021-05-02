package schedule;

public class SchedulUtilDto {

	private int year;
	private int month;
	private String pp;
	private String p;
	private String nn;
	private String n;
	private int dayOfWeek;
	private int lastday;
	private int weekday;
	
	public SchedulUtilDto() {
	}
	
	public SchedulUtilDto(int year, int month, String pp, String p, String nn, String n, int dayOfWeek, int lastday,
			int weekday) {
		super();
		this.year = year;
		this.month = month;
		this.pp = pp;
		this.p = p;
		this.nn = nn;
		this.n = n;
		this.dayOfWeek = dayOfWeek;
		this.lastday = lastday;
		this.weekday = weekday;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public String getPp() {
		return pp;
	}

	public void setPp(String pp) {
		this.pp = pp;
	}

	public String getP() {
		return p;
	}

	public void setP(String p) {
		this.p = p;
	}

	public String getNn() {
		return nn;
	}

	public void setNn(String nn) {
		this.nn = nn;
	}

	public String getN() {
		return n;
	}

	public void setN(String n) {
		this.n = n;
	}

	public int getDayOfWeek() {
		return dayOfWeek;
	}

	public void setDayOfWeek(int dayOfWeek) {
		this.dayOfWeek = dayOfWeek;
	}

	public int getLastday() {
		return lastday;
	}

	public void setLastday(int lastday) {
		this.lastday = lastday;
	}

	public int getWeekday() {
		return weekday;
	}

	public void setWeekday(int weekday) {
		this.weekday = weekday;
	}		
}


