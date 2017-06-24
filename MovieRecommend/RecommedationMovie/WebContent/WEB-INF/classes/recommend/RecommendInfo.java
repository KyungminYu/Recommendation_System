package recommend;
public class RecommendInfo {
	private String MovieCd;
	private String MovieName;
	private double MovieRate;
	
	public RecommendInfo(String Cd, String Name, double Rate){
		MovieCd = Cd;
		MovieName = Name;
		MovieRate = Rate;
	}

	public String getName(){
		return MovieName;
	}
	public String getCd(){
		return MovieCd;
	}
	public double getRate(){
		return MovieRate;
	}
}
