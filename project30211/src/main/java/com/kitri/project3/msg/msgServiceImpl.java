package com.kitri.project3.msg;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.kitri.project3.member.Member;

@Component("msgService")
public class msgServiceImpl implements msgService {
@Resource(name="sqlSession")
private SqlSession sqlSession;
private msgDao dao;

public void setSqlSession(SqlSession sqlSession) {
	this.sqlSession = sqlSession;
	this.dao = sqlSession.getMapper(msgDao.class);
}
	@Override
	public Message readMsg(int message_num) {
		this.dao = sqlSession.getMapper(msgDao.class);
		return dao.selectMessage(message_num);
	}

	@Override
	public ArrayList<Message> msgList(PagingVO pvo) {
		this.dao = sqlSession.getMapper(msgDao.class);
		return dao.selectMessageList(pvo);
	}

	@Override
	public void sendMsg(Message m) {
		this.dao = sqlSession.getMapper(msgDao.class);
		dao.insertMessage(m);

	}

	@Override
	public boolean idCheck(String id) {
		this.dao = sqlSession.getMapper(msgDao.class);
		String a = dao.idSelect(id);
		if(a != null) { //id가 존재하면 트루
			return true;
		}
		else return false;
	}

	@Override
	public void delMsg(int message_num) {
		this.dao = sqlSession.getMapper(msgDao.class);
		dao.deleteMessage(message_num);
	}
	@Override
	public void Read(int message_num) {
		this.dao = sqlSession.getMapper(msgDao.class);
		dao.updateRead(message_num);
	}
	@Override
	public ArrayList<Message> MsgCheck(String id) {
		this.dao = sqlSession.getMapper(msgDao.class);
		return dao.newMessage(id);
		
	}
	@Override
	public int getMsgCnt(String id) {
		this.dao = sqlSession.getMapper(msgDao.class);
		return dao.selectTotalPaging(id);
	}
	@Override
	public ArrayList<Member> getGrp(String id) {
		this.dao = sqlSession.getMapper(msgDao.class);
		return dao.selectGrp(id);
	}
	@Override
	public ArrayList<Message> getMyMessage(PagingVO pvo) {
		this.dao = sqlSession.getMapper(msgDao.class);
		return dao.selectMyMessage(pvo);
	}
	@Override
	public int getTotalMyPaging(String id) {
		this.dao = sqlSession.getMapper(msgDao.class);
		return dao.selectTotalMyPaging(id);
	}

}
