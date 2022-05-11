<h3>글 수정/삭제</h3>
    <form>
	    <table border="1">
	 		<tr>
	 			<th>글번호</th>
	 			<td><input type="text" name='board_no' readonly="readonly" value='<c:out value="${ board.board_no }"/>'></td>
	 		</tr>
	 		<tr>
	 			<th>제목</th>
	 			<td><input type="text" name='title' value='<c:out value="${ board.title }"/>'></td>
	 		</tr>
	 		<tr>
	 			<th>내용</th>
	 			<td>
	 				<textarea rows="5" cols="50" name="content"><c:out value="${ board.content }"/></textarea>
	 			</td>
	 		</tr>
	 		<tr>
	 			<th>작성자</th>
	 			<td><input type="text" name='writer' readonly="readonly" value='<c:out value="${ board.writer }"/>'></td>
	 		</tr>
	    </table>
	    
	    <!-- 페이지 값, 검색 조건 -->
		<input type="hidden" id="pageNum" name="pageNum" value="${ cri.pageNum }">
		<input type="hidden" id="amount" name="amount" value="${ cri.amount }">
		<input type="hidden" id="type" name="type" value="${ cri.type }">
		<input type="hidden" id="keyword" name="keyword" value="${ cri.keyword}">
		
		<button type="button" data-oper="modify">글 수정</button>
		<button type="button" data-oper="remove">글 삭제</button>
		<button type="button" data-oper="list">글 목록</button>
    </form>