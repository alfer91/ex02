-- 오라클 데이터 베이스 페이징 처리 (계획 설명)

--select * from tbl_board order by bno + 1 desc;	
--select * from tbl_board order by bno desc;	


--select /*+ index_desc(tbl_board pk_board) */ * from tbl_board where bno > 0;
--select * from tbl_board where bno = 190;
--select * from tbl_board order by bno;


--select * from tbl_board order by bno desc;

-- 인덱스와 오라클 힌트 
--select /*+ index_desc(tbl_board pk_board) */ * from tbl_board;
--select /*+ full(tbl_board) */ * from tbl_board order by bno desc;
--select /*+ index_asc(tbl_board pk_board) */ * from tbl_board where bno > 0;


-- 테이블 조회 -> 정렬 -> rownum 붙이기
--select /*+ full(tbl_board) */ rownum rn, bno, title from tbl_board where bno > 0 order by bno;

-- index로 테이블 조회 -> rownum 붙이기 (정렬 부분을 없앨 수 있음)
--select /*+ index_asc(tbl_board pk_board) */ rownum rn, bno, title, content from tbl_board;
--select /*+ index_desc(tbl_board pk_board) */ rownum rn, bno, title, content from tbl_board where bno > 0;


-- index로 테이블 조회 -> rownum <= 10 -> rownum 붙이기
--select /*+ index_desc(tbl_board pk_board) */ rownum rn, bno, title, content from tbl_board where rownum <= 10;

-- index로 테이블 조회 -> rownum > 10 조건 때문에 데이터 조회 x, 모든 행에 rownum = 1을 붙임
--select /*+ index_desc(tbl_board pk_board) */ rownum rn, bno, title, content from tbl_board where rownum > 10 and rownum <= 20;

--select /*+ index_desc(tbl_board pk_board) */ rownum rn, bno, title, content from tbl_board where rownum <= 20;

-- inline view에서 index로 테이블 조회, rownum <= 20, rownum 붙이기 -> rownum > 10 데이터 조회
--select rn, bno, title, content 
--from (select /*+ index_desc(tbl_board pk_board) */ rownum rn, bno, title, content from tbl_board where rownum <= 20) 
--where rn > 10;


--select * from user_cons_columns order by position;