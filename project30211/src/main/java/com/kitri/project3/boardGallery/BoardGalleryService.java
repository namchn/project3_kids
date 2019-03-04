package com.kitri.project3.boardGallery;

import java.util.ArrayList;
import java.util.HashMap;

import com.kitri.project3.paging.PagingVO2;


public interface BoardGalleryService {
	int getNum();
	void addBoard(GalleryBoard b);
	
	ArrayList<GalleryBoard> getAll(PagingVO2 p);
	int getTotalPaging();
	
	ArrayList<GalleryBoard> getByGallery(HashMap<String, Object> hashMap);
	   int getTotalPagingByGallery(String mng_group); 
	   
	GalleryBoard getByNum(int num);
	ArrayList<GalleryBoard> getByTitle(HashMap<String, Object> hashMap);
	   ArrayList<GalleryBoard> getById(HashMap<String, Object> hashMap);
	   
	   int getTotalPagingByTitle(HashMap<String, String> hashMap);
	   int getTotalPagingById(HashMap<String, String> hashMap);   

	   
	void editViewCount(int num);
	
	void editBoard(GalleryBoard b);
	void delBoard(int num);
}
