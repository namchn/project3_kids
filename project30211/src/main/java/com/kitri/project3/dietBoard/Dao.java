package com.kitri.project3.dietBoard;

import java.util.ArrayList;

import com.kitri.project3.member.Member;
import com.kitri.project3.paging.PagingVO2;

public interface Dao {

	ArrayList<DietBoard> selectAll(PagingVO2 paging);
	void insert();
	void update(DietBoard db);
	void delete(int diet_num);
	void insert(DietBoard db);
	DietBoard selectDietNum(int diet_num);
	void updateExceptImg(DietBoard db);
	int selectTotalPaging();
	//홈메인에 띄울 식단표
	DietBoard selectRecent();
	
}
