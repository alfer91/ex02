-- �˻���� sql

-- ���� �׸� �˻�
select *
from (
    select /*+ index_desc(tbl_board pk_board) */ rownum rn, bno, title, content, writer, regdate, updateDate
    from tbl_board
    where title like '%������%' 
    and rownum <= 20
    )
where rn > 10;

-- ���� �׸� �˻�
select *
from (
    select /*+ index_desc(tbl_board pk_board) */ rownum rn, bno, title, content, writer, regdate, updateDate
    from tbl_board
    where (title like '%������%' or content like '%�׽�Ʈ%')
    and rownum <= 20
    )
where rn > 10;


