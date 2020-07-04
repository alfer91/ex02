-- 검색기능 sql

-- 단일 항목 검색
select *
from (
    select /*+ index_desc(tbl_board pk_board) */ rownum rn, bno, title, content, writer, regdate, updateDate
    from tbl_board
    where title like '%수정된%' 
    and rownum <= 20
    )
where rn > 10;

-- 다중 항목 검색
select *
from (
    select /*+ index_desc(tbl_board pk_board) */ rownum rn, bno, title, content, writer, regdate, updateDate
    from tbl_board
    where (title like '%수정된%' or content like '%테스트%')
    and rownum <= 20
    )
where rn > 10;


