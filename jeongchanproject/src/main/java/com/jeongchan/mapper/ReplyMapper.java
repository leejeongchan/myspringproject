package com.jeongchan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.jeongchan.domain.Criteria;

import com.jeongchan.domain.ReplyVO;

public interface ReplyMapper {
	//댓글 등록
		public int insert(ReplyVO vo);
		
		//댓글 조회
		public ReplyVO read(Long rno);
		
		//댓글 삭제
		public int delete(Long rno);
		
		//댓글 수정
		public int update(ReplyVO reply);
		
		//댓글 페이징 목록 보여주기 두 파라미터 이상이므로 객체, 맵, 파람 중에 파람을 ㅅ ㅏ용,게시글 목록 페이징은 cri만 필요했지만 댓글은 특정 게시글이므로 게시글 번호가 필요
		public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri,@Param("bno") Long bno);
		
		public int getCountByBno(Long bno);

}
