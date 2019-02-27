package com.kitri.project3.poll;

import java.util.ArrayList;
import java.util.Map;

public interface pollDao {
	void insertPoll(Poll p);
	void insertPollCan(Poll_Can pc);
	void updatePollVoter(int poll_num);
	void updatePollCanVote(int poll_candidate_num);
	Poll selectPoll(int poll_num);
	ArrayList<Poll_Can> selectPollCan(int poll_num);
	ArrayList<Poll> selectAllPoll(PagingVO pvo);
	int selectTotalPaging();
	Poll_Can selectvote(int poll_candidate_num);
	pollCheck idcheck(pollCheck pcheck);
	void insertpcheck(pollCheck pcheck);
	void deletePoll(int poll_num);
	//메인용 투표
	ArrayList<Poll> selectMainPoll();
}
