package com.kitri.project3.paging;

public class PagingVO {
	private int pageCnt; // 출력할 페이지번호 개수
	private int index;   // 출력할 페이지 번호
	private int pageStartNum; // 출력할 페이지 시작 번호
	private int listCnt;    // 출력할 리스트 갯수
	private int total;      // 리스트 총 개수
	
    {
        pageCnt = 5;
        index = 0;
        pageStartNum = 1;
        listCnt = 10;
    }

	public PagingVO() {}
	
	public int getStart() {
		return index * listCnt+1;
	}
	
	public int getLast() {
		return (index * listCnt)+listCnt; 
	}
	
	public int getPageLastNum() { //6~10페이지
		int remainListCnt = total - listCnt * (pageStartNum-1); //34-5*(6-1)= 9   //34-5*(1-1)=34
		int remainPageCnt = remainListCnt/listCnt;              //9/5       = 1   //34/5=6
		
		if(remainListCnt%listCnt !=0) {
			remainPageCnt++;            //remainListCnt9, remainPageCnt 2//remainListCnt34, remainPageCnt 7
		}
		
		int pageLastNum = 0;
		if(remainListCnt <= listCnt) {                // 9<=5 false      //34<=5 false
			pageLastNum = pageStartNum;                                  //pageStartNum1, pageLastNum1
		} else if (remainPageCnt <= pageCnt) {        // 2<=5 true       //7<=5 false    
			pageLastNum = remainPageCnt + pageStartNum - 1; // 6         //pageStartNum1, pageLastNum7
		} else {
			pageLastNum = pageCnt + pageStartNum - 1; //5+6-1=10         //pageStartNum1, pageLastNum5 (O)
		}
		return pageLastNum;
	}
	
	public boolean getLastChk() {
		 int n = (int)Math.ceil((double)total/listCnt);
		 return getPageLastNum()==n ? false : n==0 ? false : true;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public int getPageStartNum() {
		return pageStartNum;
	}

	public void setPageStartNum(int pageStartNum) {
		this.pageStartNum = pageStartNum;
	}

	public int getListCnt() {
		return listCnt;
	}

	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "PagingVO [pageCnt=" + pageCnt + ", index=" + index + ", pageStartNum=" + pageStartNum + ", listCnt="
				+ listCnt + ", total=" + total + "]";
	}
	
	
	
	
	
	
	
    
	
	
	
	
}
