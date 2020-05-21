package inhatc.capstone.movie.dto;




import org.springframework.stereotype.Repository;
//repository

public class MovieDTO {
	private String movieId;
	private String movieSeq;
	private String titleEtc;
	private String title;
	private String titleEng;
	private String age;
	private String genre;
	private String posters;
	private String img;
	private String directorNm;
	private String actors;
	private String plot;
	private String runtime;
	private String repRlsDate;
	
	
	public String getTitleEtc() {
		
		return titleEtc;
	}
	
	public void setTitleEtc(String titleEtc) {
		this.titleEtc = titleEtc;
	}
	public String getDirectorNm() {
		return directorNm;
	}
	public void setDirectorNm(String directorNm) {
		this.directorNm = directorNm;
	}
	public String getActors() {
		return actors;
	}
	/*
	 * public String[] getActors() {
		return actors;
	}
	 * public void setActors(String[] actors) {
		this.actors = actors;
	}
	 */
	public void setActors(String actors) {
		this.actors = actors;
	}
	public String getPlot() {
		return plot;
	}
	public void setPlot(String plot) {
		this.plot = plot;
	}
	public String getRuntime() {
		return runtime;
	}
	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}
	public String getRepRlsDate() {
		return repRlsDate;
	}
	public void setRepRlsDate(String repRlsDate) {
		this.repRlsDate = repRlsDate;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getMovieId() {
		return movieId;
	}
	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}
	public String getMovieSeq() {
		return movieSeq;
	}
	public void setMovieSeq(String movieSeq) {
		this.movieSeq = movieSeq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitleEng() {
		return titleEng;
	}
	public void setTitleEng(String titleEng) {
		this.titleEng = titleEng;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getPosters() {
		return posters;
	}
	public void setPosters(String posters) {
		this.posters = posters;
	}
}
