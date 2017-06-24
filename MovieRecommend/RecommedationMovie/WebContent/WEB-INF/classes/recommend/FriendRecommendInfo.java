package recommend;

public class FriendRecommendInfo {

	private String ID;
	private String MovieCd;
	
	
	public FriendRecommendInfo(String iD, String movieCd) {
		super();
		ID = iD;
		MovieCd = movieCd;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getMovieCd() {
		return MovieCd;
	}
	public void setMovieCd(String movieCd) {
		MovieCd = movieCd;
	}
	
}
