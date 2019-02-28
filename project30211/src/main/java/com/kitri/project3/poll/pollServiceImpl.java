package com.kitri.project3.poll;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("pollService")
public class pollServiceImpl implements pollService {
@Resource(name="sqlSession")
	private SqlSession sqlSession;
	private pollDao dao;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		this.dao = sqlSession.getMapper(pollDao.class);
	}
	@Override
	public void makePoll(Poll p) {
		this.dao = sqlSession.getMapper(pollDao.class);
		dao.insertPoll(p);
	}

	@Override
	public void makePollCan(Poll_Can pc) {
		this.dao = sqlSession.getMapper(pollDao.class);
		dao.insertPollCan(pc);
	}

	@Override
	public void increasePollVoter(int poll_num) {
		this.dao = sqlSession.getMapper(pollDao.class);
		dao.updatePollVoter(poll_num);
	}

	@Override
	public void increasePollCanVote(int poll_candidate_num) {
		this.dao = sqlSession.getMapper(pollDao.class);
		
		dao.updatePollCanVote(poll_candidate_num);
	}

	@Override
	public Poll getPoll(int poll_num) {
		this.dao = sqlSession.getMapper(pollDao.class);
		return dao.selectPoll(poll_num);
	}

	@Override
	public ArrayList<Poll_Can> getPollCan(int poll_num) {
		this.dao = sqlSession.getMapper(pollDao.class);
		
		return dao.selectPollCan(poll_num);
	}

	@Override
	public ArrayList<Poll> getAllPoll(PagingVO pvo) {
		this.dao = sqlSession.getMapper(pollDao.class);
		return dao.selectAllPoll(pvo);
	}
	@Override
	public Poll_Can getvote(int poll_candidate_num) {
		this.dao = sqlSession.getMapper(pollDao.class);
		return dao.selectvote(poll_candidate_num);
	}
	@Override
	public pollCheck checkPoll(pollCheck pcheck) {
		this.dao = sqlSession.getMapper(pollDao.class);
		return dao.idcheck(pcheck);
	}
	@Override
	public void makeCheck(pollCheck pcheck) {
		this.dao = sqlSession.getMapper(pollDao.class);
		dao.insertpcheck(pcheck);
	}
	@Override
	public int getTotalPaging() {
		this.dao = sqlSession.getMapper(pollDao.class);
		return dao.selectTotalPaging();
	}
	@Override
	public void delete(int poll_num) {
		this.dao = sqlSession.getMapper(pollDao.class);
		dao.deletePoll(poll_num);
	}
	@Override
	public ArrayList<Poll> getMainPoll() {
		this.dao = sqlSession.getMapper(pollDao.class);
		return dao.selectMainPoll();
	}

}
