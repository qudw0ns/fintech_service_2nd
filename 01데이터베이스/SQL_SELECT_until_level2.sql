# 모든 레코드 조회하기
SELECT * from ANIMAL_INS;

# 가장 큰 물고기 10마리 구하기
select ID, LENGTH from FISH_INFO where LENGTH>10 order by LENGTH desc, ID asc limit 10;

# 잔챙이 잡은 수 구하기
select count(*) as FISH_COUNT from FISH_INFO where LENGTH IS NULL;

# Python 개발자 찾기
select ID, EMAIL, FIRST_NAME, LAST_NAME from DEVELOPER_INFOS 
where skill_1="python" or SKILL_2="python" or SKILL_3="python" order by ID asc;

# 조건에 부합하는 중고거래 댓글 조회하기
select TITLE, USED_GOODS_BOARD.BOARD_ID, REPLY_ID, USED_GOODS_REPLY.WRITER_ID, USED_GOODS_REPLY.CONTENTS, DATE_FORMAT(USED_GOODS_REPLY.CREATED_DATE, "%Y-%m-%d") as CREATED_DATE
from USED_GOODS_BOARD inner join USED_GOODS_REPLY
on USED_GOODS_BOARD.BOARD_ID = USED_GOODS_REPLY.BOARD_ID
where USED_GOODS_BOARD.CREATED_DATE like "%2022-10%" order by USED_GOODS_REPLY.CREATED_DATE asc, TITLE asc;

# 특정 물고기를 잡은 총 수 구하기
select count(*) FISH_COUNT from FISH_INFO a inner join FISH_NAME_INFO b
on a.FISH_TYPE = b.FISH_TYPE where FISH_NAME = "BASS" or FISH_NAME = "SNAPPER";

# 업그레이드 된 아이템 구하기
# 서브쿼리 개수 파악하기 (1개 이상이면 IN 사용)
SELECT T.ITEM_ID, ITEM_NAME, RARITY FROM ITEM_INFO I INNER JOIN ITEM_TREE T ON I.ITEM_ID = T.ITEM_ID
WHERE PARENT_ITEM_ID IN (SELECT ITEM_ID FROM ITEM_INFO WHERE RARITY="RARE") ORDER BY T.ITEM_ID DESC;
