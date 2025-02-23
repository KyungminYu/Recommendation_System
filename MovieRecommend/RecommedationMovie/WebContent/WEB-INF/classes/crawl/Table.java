package crawl;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class Table {
	Connection conn = null;
    Statement stmt = null;
	ResultSet rs = null;
	public Table(Connection conn, Statement stmt, ResultSet rs) {
		this.conn = conn;
		this.stmt = stmt;
		this.rs = rs;
	};
	public void createtable(){
		try {
			stmt = conn.createStatement();
			stmt.executeUpdate("CREATE TABLE IF NOT EXISTS Movie ( "
					//+ "movieid		int NOT NULL AUTO_INCREMENT, "
					+ "movieCd		varchar(15), "
					+ "movieNm		varchar(100), "
					+ "movieNmEn	varchar(100), "
					+ "prdtYear		varchar(15), "
					+ "openDt		varchar(15), "
					+ "typeNm		varchar(20), "
					+ "prdtStatNm	varchar(20), "
					+ "nationAlt	varchar(20), "
					+ "genreAlt		varchar(30), "
					+ "repNationNm	varchar(20), "
					+ "repGenreNm	varchar(20), "
					+ "Genrescore	double, "
					+ "scoresum		double, "
					+ "scorenum		double, "
					+ "URL			varchar(150), "
					+ "primary key (movieCd))");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("Movie Table 생성 오류");
		}
		
		
		try {
			stmt = conn.createStatement();
			stmt.executeUpdate("CREATE TABLE IF NOT EXISTS User ("
						+ "Userid		varchar(20), "
						+ "Password		varchar (20), "
						+ "Name			varchar (20), "
						+ "Birth		varchar (20), "
						//+ "Emailadd		varchar(30), "
						+ "primary key (Userid))");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("User Table 생성 오류");
		}
		
		try {
			stmt = conn.createStatement();
			stmt.executeUpdate("CREATE TABLE IF NOT EXISTS Eval ("
					+ "Userid   varchar(20), "
					+ "movieCd	varchar(15), "
					+ "Evalsc	varchar (60), "
					+ "Text		varchar(15), "
					+ "primary key (Userid, movieCd), "
					+ "foreign key (movieCd) references Movie(movieCd), "
					+ "foreign key (Userid) references User(Userid));");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("Eval Table 생성 오류");
		}
		//getterid 없애기 senderid와 movieCd를 primarykey로 만들기
		try {
			stmt = conn.createStatement();
			stmt.executeUpdate("CREATE TABLE IF NOT EXISTS Movierecom ("
					+ "Senderid		varchar(20),"
					+ "movieCd		varchar(15),"
					+ "primary key (Senderid, movieCd), "
					+ "foreign key (Senderid) references User(Userid), "
					+ "foreign key (movieCd) references Movie(movieCd));");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("Movierecom Table 생성 오류");
		}
		try {
			stmt = conn.createStatement();
			stmt.executeUpdate("CREATE TABLE IF NOT EXISTS Friends ( "
					+ "F1		varchar(20),"
					+ "F2		varchar (20),"
					+ "primary key (F1, F2), "
					+ "foreign key (F1) references User(Userid), "
					+ "foreign key (F2) references User(Userid));");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("Friends Table 생성 오류");
		}
	}
}
