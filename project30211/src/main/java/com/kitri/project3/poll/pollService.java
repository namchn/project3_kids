package com.kitri.project3.poll;

import java.util.ArrayList;

public interface pollService {
	void makePoll(Poll p);
	void makePollCan(Poll_Can pc);
	void increasePollVoter(int poll_num);
	void increasePollCanVote(int poll_candidate_num);
	Poll getPoll(int poll_num);
	ArrayList<Poll_Can> getPollCan(int poll_num);
	ArrayList<Poll> getAllPoll(PagingVO pvo);
	int getTotalPaging();
	Poll_Can getvote(int poll_candidate_num);
	pollCheck checkPoll(pollCheck pcheck);
	void makeCheck(pollCheck pcheck);
	void delete(int poll_num);
	//메인용 투표
	ArrayList<Poll> getMainPoll();
}
