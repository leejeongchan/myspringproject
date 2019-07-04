package com.jeongchan.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@Getter
@AllArgsConstructor
public class ReplyPageDTO {
	//댓글 페이징을 위해서는 댓글 개수와 댓글 목록을 넘겨야함. 댓글은 게시글 안에 있는 것이기 때문에!! 자바스크립트 내 댓글 수 사용하기 위함
	private int replyCnt;
	private List<ReplyVO> list;
}
