package recommend;

import crawl.MovieData;

public class MovieInfo {
	private MovieData data;
	private double[] weights;
	private String[] genreName = {"","���","�ڹ̵�","�׼�", "���/�θǽ�", "������", "�̽��͸�", "����(ȣ��)", "��庥ó",
			"����", "����", "��Ÿ��", "SF", "���α�(������)", "���", "�ִϸ��̼�" ,"��ť���͸�","����","������",
			"���ι�(����)", "����", "��Ÿ"};//21�� �帣
	//private String[] genreName = {"","���","�ڹ̵�","�׼�", "���/�θǽ�", "����"};//test
	public MovieInfo(String movieCd,String movieNm,String movieNmEn,String prdtYear,
			String openDt,String typeNm, String prdtStatNm,String nationAlt,String genreAlt,
			String repNationNm,String repGenreNm, String URL){
		data = new MovieData(movieCd, movieNm, movieNmEn, prdtYear, openDt, typeNm, prdtStatNm, nationAlt, genreAlt, repNationNm, repGenreNm, URL);
		initWeight(22);
	}
	public MovieData getMovieData(){
		return data;
	}
	public String getMovieCd(){
		return data.getMovieCd();
	}
	public String getMovieName(){
		return data.getMovieNm();
	}
	public String getMovieNameEn(){
		return data.getMovieNmEn();
	}
	public String getOpenYr(){
		return data.getOpenDt();
	}
	public String getNation(){
		return data.getNationAlt();
	}
	public String getGenre(){
		return data.getGenreAlt();
	}
	public String getURL(){
		return data.getURL();
	}

	public double[] getWeights(){
		return weights;
	}
	public double getWeight(int ind){
		return weights[ind];
	}

	
	private void initWeight(int size){
		weights = new double[size];
		weights[0] = 1.0;
		for(int i=1;i<size;i++)
			weights[i] = 0.0;
		for(int i=0;i<data.getGenreList().size();i++){
			for(int j=1;j<size;j++){
				if(data.getGenreList().get(i).equals(genreName[j])){
					weights[j] = 0.75;
				}
			}
		}
		for(int j=1;j<size;j++){
			if(data.getRepGenreNm().equals(genreName[j])){
				weights[j] += 0.25;
			}
		}
	}
	
}
