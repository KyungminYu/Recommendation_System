package recommend;
import java.util.ArrayList;
import java.util.List;

public class PersonInfo {

	private String ID;
	private String PASSWORD;
	private String NAME;
	private String BIRTH;
	private List<Object> rateList = new ArrayList<Object>();
	
	public PersonInfo(){
		
	}

	public PersonInfo(String iD, int movieSize) {
		super();
		NAME = iD;
		for(int i=0;i<movieSize;i++)
			rateList.add(-1.0);
	}

	public PersonInfo(String iD, String pASSWORD, String nAME, String bIRTH, int movieSize) {
		super();
		ID = iD;
		PASSWORD = pASSWORD;
		NAME = nAME;
		BIRTH = bIRTH;
		for(int i=0;i<movieSize;i++)
			rateList.add(-1.0);
	}

	public String getNAME(){
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getPASSWORD() {
		return PASSWORD;
	}
	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}
	public String getBIRTH() {
		return BIRTH;
	}
	public void setBIRTH(String bIRTH) {
		BIRTH = bIRTH;
	}
	public void setRate(int ind, double rate) {
		// TODO Auto-generated method stub
		rateList.set(ind, rate);	
	}

	public List<Object> getRates(){
		return rateList;
	}
	public double getRate(int ind){
		return (double)rateList.get(ind);
	}
	
	public void addMovie(){
		rateList.add(-1.0);
	}
}
