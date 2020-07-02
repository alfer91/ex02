-- ����Ŭ ������ ���̽� ����¡ ó�� (��ȹ ����)

--select * from tbl_board order by bno + 1 desc;	
--select * from tbl_board order by bno desc;	


--select /*+ index_desc(tbl_board pk_board) */ * from tbl_board where bno > 0;
--select * from tbl_board where bno = 190;
--select * from tbl_board order by bno;


--select * from tbl_board order by bno desc;

-- �ε����� ����Ŭ ��Ʈ 
--select /*+ index_desc(tbl_board pk_board) */ * from tbl_board;
--select /*+ full(tbl_board) */ * from tbl_board order by bno desc;
--select /*+ index_asc(tbl_board pk_board) */ * from tbl_board where bno > 0;


-- ���̺� ��ȸ -> ���� -> rownum ���̱�
--select /*+ full(tbl_board) */ rownum rn, bno, title from tbl_board where bno > 0 order by bno;

-- index�� ���̺� ��ȸ -> rownum ���̱� (���� �κ��� ���� �� ����)
--select /*+ index_asc(tbl_board pk_board) */ rownum rn, bno, title, content from tbl_board;
--select /*+ index_desc(tbl_board pk_board) */ rownum rn, bno, title, content from tbl_board where bno > 0;


-- index�� ���̺� ��ȸ -> rownum <= 10 -> rownum ���̱�
--select /*+ index_desc(tbl_board pk_board) */ rownum rn, bno, title, content from tbl_board where rownum <= 10;

-- index�� ���̺� ��ȸ -> rownum > 10 ���� ������ ������ ��ȸ x, ��� �࿡ rownum = 1�� ����
--select /*+ index_desc(tbl_board pk_board) */ rownum rn, bno, title, content from tbl_board where rownum > 10 and rownum <= 20;

--select /*+ index_desc(tbl_board pk_board) */ rownum rn, bno, title, content from tbl_board where rownum <= 20;

-- inline view���� index�� ���̺� ��ȸ, rownum <= 20, rownum ���̱� -> rownum > 10 ������ ��ȸ
--select rn, bno, title, content 
--from (select /*+ index_desc(tbl_board pk_board) */ rownum rn, bno, title, content from tbl_board where rownum <= 20) 
--where rn > 10;


--select * from user_cons_columns order by position;