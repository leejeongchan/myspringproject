/**
 * 
 */
console.log("Reply Module....");
// 즉시 처리 함수
var replyService = (function() {

	// 댓글 등록 모듈
	function add(reply, callback, error) {
		console.log("reply........");

		$.ajax({
			type : 'post',
			url : '/replies/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		})
	}

	// 댓글 목록
	function getList(param, callback, error) {
		var bno = param.bno;
		var page = param.page || 1;

		$.getJSON("/replies/pages/" + bno + "/" + page + ".json",
				function(data) {
					if (callback) {
						//callback(data); // 댓글 목록만 가져오는 경우
						callback(data.replyCnt,data.list);
					}
				}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}

	// 댓글 삭제
	function remove(rno, callback, error) {
		$.ajax({
			type : 'delete',
			url : '/replies/' + rno,
			success : function(deleteResult, status, xhr) {
				if (callback) {
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}

	// 댓글 수정
	function update(reply, callback, error) {
		console.log("RNO: " + reply.rno);
		$.ajax({
			type : 'put',
			url : '/replies/' + reply.rno,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result); // success
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}
	
	//특정 댓글 조회
	function get(rno,callback,error){
		$.get("/replies/"+rno+".json",function(result){
			if(callback){
				callback(result);
			}
			
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
			
		});
	}
	
	//시간 처리
	function displayTime(timeValue){
		var today = new Date();
		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);
		var str = "";
		
		//하루가 지나지 않았을 때는 시간 분 초 만 표현 
		if (gap < (1000*60*60*24)){
			
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [(hh > 9 ? '':'0')+hh,':',(mi > 9 ? '':'0')+mi,':',(ss > 9 ? '':'0')+ss].join('');
		}
		else{//하루가 지난 후 년 월 일로 표시
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth()+1;
			var dd = dateObj.getDate();
			
			return [yy,'/',(mm>9?'':'0')+mm,'/',(dd>9?'':'0')+dd].join('');
		}
	}
	return {
		add : add,
		getList : getList,
		remove : remove,
		update : update,
		get:get,
		displayTime:displayTime
	};
})();
