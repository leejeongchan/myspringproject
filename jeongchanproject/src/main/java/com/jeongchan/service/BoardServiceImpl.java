package com.jeongchan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.jeongchan.domain.BoardAttachVO;
import com.jeongchan.domain.BoardVO;
import com.jeongchan.domain.Criteria;
import com.jeongchan.domain.Criteria2;
import com.jeongchan.mapper.BoardAttachMapper;
import com.jeongchan.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_=@Autowired)
	private BoardMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	private BoardAttachMapper attachMapper;
	
	@Transactional
	@Override
	public void register(BoardVO board) {
		// TODO Auto-generated method stub
		log.info("register...."+board);
		
		mapper.insertSelectKey(board);
		//게시글에 첨부파일 없으면 그냥 등록
		if(board.getAttachList() ==null || board.getAttachList().size()<=0) {
			return;
		}
		
		//첨부파일 있으면
		board.getAttachList().forEach(attach->{
			mapper.updatefileCnt(board.getBno(), 1);
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
	}
	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public BoardVO get(Long bno) {
		// TODO Auto-generated method stub
		mapper.updateViewcnt(bno);
		return mapper.read(bno);
	}
	@Override
	public BoardVO get2(Long bno) {
		// TODO Auto-generated method stub
		
		return mapper.read(bno);
	}
	
	@Override
	public boolean modify(BoardVO board) {
		// TODO Auto-generated method stub
		log.info("modify....."+board);
		//삭제하고 다시 추가하는 방식
		//삭제 하면 우선 기존 첨부 개수만큼 뺴주면 0이 된다. 즉 파일 개수 초기화
		log.info("1. 수정 누르고 개수: "+attachMapper.getCount(board.getBno()));
		mapper.updatefileCnt(board.getBno(), -attachMapper.getCount(board.getBno()));
		
		attachMapper.deleteAll(board.getBno());
		log.info("2. 수정 누르고 개수: "+attachMapper.getCount(board.getBno()));

		boolean modifyResult = mapper.update(board)==1;
		log.info("3. 수정 누르고 개수: "+attachMapper.getCount(board.getBno()));
		//수정후 파일 있을 경우
		if(modifyResult && board.getAttachList().size()>0) {
			board.getAttachList().forEach(attach->{
				attach.setBno(board.getBno());
				attachMapper.insert(attach);
				log.info("4. 수정 누르고 개수: "+attachMapper.getCount(board.getBno()));
				
			});
			mapper.updatefileCnt(board.getBno(), attachMapper.getCount(board.getBno()));
		}
		return modifyResult;
	}
	@Transactional
	@Override
	public boolean remove(Long bno) {
		// TODO Auto-generated method stub
		
		log.info("remove......"+bno);
		
		//첨부파일 개수 얻어와서 그 개수만큼 update 마이너스 해주기
		//mapper.updatefileCnt(bno, attachMapper.getCount(bno));
		
		//첨부파일도 삭제
		attachMapper.deleteAll(bno);
		
		return mapper.delete(bno)==1;
	}

	//@Override
	//public List<BoardVO> getList() {
		// TODO Auto-generated method stub
		
	//	log.info("getList.....");
		
	//	return mapper.getList();
	//}
	
	@Override
	public List<BoardVO> getList(Criteria cri){
		log.info("get List with cirteria: "+cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		log.info("get Total count");
		return mapper.getTotalCount(cri);
	}
	//파일 조회
	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		// TODO Auto-generated method stub
		log.info("get Attach List by bno: "+bno);
		
		return attachMapper.findByBno(bno);
	}
	@Override
	public List<BoardVO> getMyList(Criteria2 cri, String writer) {
		// TODO Auto-generated method stub
		log.info("getMyList service : "+cri);
		log.info("getMyList Service : "+writer);
		return mapper.getMyList(cri, writer);
	}
	@Override
	public int getMyTotal(String writer) {
		// TODO Auto-generated method stub
		return mapper.getMyTotalCount(writer);
	}

}
