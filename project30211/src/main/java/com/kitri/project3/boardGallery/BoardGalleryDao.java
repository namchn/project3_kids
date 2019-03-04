package com.kitri.project3.boardGallery;

import java.util.ArrayList;
import java.util.HashMap;

import com.kitri.project3.paging.PagingVO2;

public interface BoardGalleryDao {
	int makeNum();
	void insert(GalleryBoard b);
	
	ArrayList<GalleryBoard> selectAll(PagingVO2 p);
	int selectTotalPaging();
	
	   ArrayList<GalleryBoard> selectByGallery(HashMap<String, Object> hashMap);
	   int selectTotalPagingByGallery(String mng_group);   


	   
	GalleryBoard selectByNum(int num);
	
	  
	   ArrayList<GalleryBoard> selectByTitle(HashMap<String, Object> hashMap);
	   ArrayList<GalleryBoard> selectById(HashMap<String, Object> hashMap);

	   
	   int selectTotalPagingByTitle(HashMap<String, String> hashMap);
	   int selectTotalPagingById(HashMap<String, String> hashMap);
	
	void updateViewCount(int num);
	
	void update(GalleryBoard b);
	void delete(int num);
	


}
