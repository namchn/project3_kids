package com.kitri.project3.boardReply;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("boardReplyService")
public class ReplyServiceImpl implements ReplyService {
	
	
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	private ReplyDao dao;

	@Override
	public int getNum() {
		dao = sqlSession.getMapper(ReplyDao.class);
		return dao.makeNum();
	}

	@Override
	public void addReply(Reply r) {
		dao = sqlSession.getMapper(ReplyDao.class);
		dao.insert(r);
	}

	@Override
	public ArrayList<Reply> getAll() {
		dao = sqlSession.getMapper(ReplyDao.class);
		return dao.selectAll();
	}

	@Override
	public Reply getByNum(int num) {
		dao = sqlSession.getMapper(ReplyDao.class);
		return dao.selectByNum(num);
	}


	@Override
	public ArrayList<Reply> getByBulletinNum(int bulletin_num) {
		dao = sqlSession.getMapper(ReplyDao.class);
		return dao.selectByBulletinNum(bulletin_num);
	}

	@Override
	public ArrayList<Reply> getByGalleryNum(int gallery_num) {
		dao = sqlSession.getMapper(ReplyDao.class);
		return dao.selectByGalleryNum(gallery_num);
	}

	@Override
	public ArrayList<Reply> getByNoticeNum(int notice_num) {
		dao = sqlSession.getMapper(ReplyDao.class);
		return dao.selectByNoticeNum(notice_num);
	}

	@Override
	public void editReply(Reply r) {
		dao = sqlSession.getMapper(ReplyDao.class);
		dao.update(r);
	}
	
	@Override
	public void delReply(int num) {
		dao = sqlSession.getMapper(ReplyDao.class);
		dao.delete(num);
	}
}
