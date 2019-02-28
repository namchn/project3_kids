package com.kitri.project3.poll;

public class Poll_Can {
	private int poll_candidate_num;
	private String poll_candidate;
	private int poll_num;
	private int vote_num;
	
	public Poll_Can() {
		
	}
	
	public Poll_Can(int poll_candidate_num, String poll_candidate, int poll_num, int vote_num) {
		this.poll_candidate_num = poll_candidate_num;
		this.poll_candidate = poll_candidate;
		this.poll_num = poll_num;
		this.vote_num = vote_num;
	}

	public int getPoll_candidate_num() {
		return poll_candidate_num;
	}
	public void setPoll_candidate_num(int poll_candidate_num) {
		this.poll_candidate_num = poll_candidate_num;
	}
	public String getPoll_candidate() {
		return poll_candidate;
	}
	public void setPoll_candidate(String poll_candidate) {
		this.poll_candidate = poll_candidate;
	}
	public int getPoll_num() {
		return poll_num;
	}
	public void setPoll_num(int poll_num) {
		this.poll_num = poll_num;
	}
	public int getVote_num() {
		return vote_num;
	}
	public void setVote_num(int vote_num) {
		this.vote_num = vote_num;
	}
	
}
