

function removeCheck() {
	  if (confirm("정말 삭제하시겠습니까??") == true){    
	      location.href='boardDelete?num=${board.num}';
	  }else{   //취소
	      return false;
	  }
	}
	


function removeComment(cno,num) {
  if (confirm("정말 삭제하시겠습니까??") == true){    
      location.href='commentDelete?cno='+cno+'&num='+num;
  }else{   //취소
      return false;
  	}
}
