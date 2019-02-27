package com.kitri.project3.boardGallery;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class GalleryBoard {
	private int gallery_num;
	private String id;
	private String mng_group;
	private String title;
	private String content;
	private Date time;
	private int viewcount;
	private String img1;
	private String img2;
	private String img3;
	private String img4;
	private String img5;	
	private String img6;
	private String img7;
	private String img8;
	private String img9;
	private String img10;
	
	private MultipartFile file1;
	private MultipartFile file2;
	private MultipartFile file3;	
	private MultipartFile file4;
	private MultipartFile file5;
	private MultipartFile file6;	
	private MultipartFile file7;
	private MultipartFile file8;	
	private MultipartFile file9;
	private MultipartFile file10;
	
	
	public GalleryBoard() {}
	public GalleryBoard(int gallery_num, String id, String mng_group, String title, String content, Date time, int viewcount, 
			String img1, String img2, String img3, String img4, String img5, String img6, String img7, String img8, String img9, String img10) {
		this.gallery_num = gallery_num;
		this.id = id;
		this.mng_group = mng_group;
		this.title = title;
		this.content = content;
		this.time = time;
		this.viewcount = viewcount;
		this.img1 = img1;
		this.img2 = img2;
		this.img3 = img3;
		this.img4 = img4;
		this.img5 = img5;
		this.img6 = img6;
		this.img7 = img7;
		this.img8 = img8;
		this.img9 = img9;
		this.img10 = img10;
	}
	
	
	public int getGallery_num() {
		return gallery_num;
	}
	public void setGallery_num(int gallery_num) {
		this.gallery_num = gallery_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMng_group() {
		return mng_group;
	}
	public void setMng_group(String mng_group) {
		this.mng_group = mng_group;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getViewcount() {
		return viewcount;
	}
	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getImg2() {
		return img2;
	}
	public void setImg2(String img2) {
		this.img2 = img2;
	}
	public String getImg3() {
		return img3;
	}
	public void setImg3(String img3) {
		this.img3 = img3;
	}
	public String getImg4() {
		return img4;
	}
	public void setImg4(String img4) {
		this.img4 = img4;
	}
	public String getImg5() {
		return img5;
	}
	public void setImg5(String img5) {
		this.img5 = img5;
	}
	public String getImg6() {
		return img6;
	}
	public void setImg6(String img6) {
		this.img6 = img6;
	}
	public String getImg7() {
		return img7;
	}
	public void setImg7(String img7) {
		this.img7 = img7;
	}
	public String getImg8() {
		return img8;
	}
	public void setImg8(String img8) {
		this.img8 = img8;
	}
	public String getImg9() {
		return img9;
	}
	public void setImg9(String img9) {
		this.img9 = img9;
	}
	public String getImg10() {
		return img10;
	}
	public void setImg10(String img10) {
		this.img10 = img10;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	public MultipartFile getFile2() {
		return file2;
	}
	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}
	public MultipartFile getFile3() {
		return file3;
	}
	public void setFile3(MultipartFile file3) {
		this.file3 = file3;
	}
	public MultipartFile getFile4() {
		return file4;
	}
	public void setFile4(MultipartFile file4) {
		this.file4 = file4;
	}
	public MultipartFile getFile5() {
		return file5;
	}
	public void setFile5(MultipartFile file5) {
		this.file5 = file5;
	}
	public MultipartFile getFile6() {
		return file6;
	}
	public void setFile6(MultipartFile file6) {
		this.file6 = file6;
	}
	public MultipartFile getFile7() {
		return file7;
	}
	public void setFile7(MultipartFile file7) {
		this.file7 = file7;
	}
	public MultipartFile getFile8() {
		return file8;
	}
	public void setFile8(MultipartFile file8) {
		this.file8 = file8;
	}
	public MultipartFile getFile9() {
		return file9;
	}
	public void setFile9(MultipartFile file9) {
		this.file9 = file9;
	}
	public MultipartFile getFile10() {
		return file10;
	}
	public void setFile10(MultipartFile file10) {
		this.file10 = file10;
	}
	
	
	@Override
	public String toString() {
		return "GalleryBoard [gallery_num=" + gallery_num + ", id=" + id + ", mng_group=" + mng_group + ", title="
				+ title + ", content=" + content + ", time=" + time + ", viewcount=" + viewcount + ", img1=" + img1
				+ ", img2=" + img2 + ", img3=" + img3 + ", img4=" + img4 + ", img5=" + img5 + ", img6=" + img6
				+ ", img7=" + img7 + ", img8=" + img8 + ", img9=" + img9 + ", img10=" + img10 + "]";
	}
	

}


		
