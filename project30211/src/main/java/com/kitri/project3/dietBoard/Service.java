package com.kitri.project3.dietBoard;

import java.util.ArrayList;

import com.kitri.project3.boardNotice.NoticeBoard;
import com.kitri.project3.paging.PagingVO2;


public interface Service {

	ArrayList<DietBoard> getDietList(PagingVO2 paging);
	void editDiet(DietBoard db);
	void deleteDiet(int diet_num);
	void uploadDiet(DietBoard db);
	DietBoard getDietNum(int diet_num);
	void editDietExceptImg(DietBoard db);
	int getTotalPaging();
	//홈메인에 띄울 식단표
	DietBoard getRecentDiet();


	
}
