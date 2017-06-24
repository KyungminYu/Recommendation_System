package recommend;

import crawl.MovieData;

public class MovieInfo {
	private MovieData data;
	private double[] weights;
	private String[] genreName = {"","드라마","코미디","액션", "멜로/로맨스", "스릴러", "미스터리", "공포(호러)", "어드벤처",
			"범죄", "가족", "판타지", "SF", "서부극(웨스턴)", "사극", "애니메이션" ,"다큐멘터리","전쟁","뮤지컬",
			"성인물(에로)", "공연", "기타"};//21개 장르
	//private String[] genreName = {"","드라마","코미디","액션", "멜로/로맨스", "가족"};//test
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
