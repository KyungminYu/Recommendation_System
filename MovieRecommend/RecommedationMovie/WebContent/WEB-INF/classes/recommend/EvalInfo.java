package recommend;

public class EvalInfo {

	private String ID;
	private String MovieCd;
	private double Eval;
	private String Text;
	
	
	public EvalInfo(String iD, String movieCd, double eval, String text) {
		super();
		ID = iD;
		MovieCd = movieCd;
		Eval = eval;
		Text = text;
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
	public double getEval() {
		return Eval;
	}
	public void setEval(double eval) {
		Eval = eval;
	}
	public String getText() {
		return Text;
	}
	public void setText(String text) {
		Text = text;
	}
	
}
