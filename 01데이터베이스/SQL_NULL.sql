# 경기도에 위치한 식품창고 목록 출력하기
# COALESCE (null 변환)
SELECT WAREHOUSE_ID, WAREHOUSE_NAME, ADDRESS, COALESCE(FREEZER_YN, "N") AS FREEZER_YN from FOOD_WAREHOUSE WHERE ADDRESS LIKE "%경기도%" order by WAREHOUSE_ID asc;

# 이름이 없는 동물의 아이디
SELECT ANIMAL_ID FROM ANIMAL_INS where NAME is null order by ANIMAL_ID asc;

# 이름이 있는 동물의 아이디
select ANIMAL_ID from ANIMAL_INS where NAME is not null order by ANIMAL_ID asc;

# NULL 처리하기
SELECT ANIMAL_TYPE, coalesce(NAME, "No name"), SEX_UPON_INTAKE from ANIMAL_INS;

# 나이 정보가 없는 회원 수 구하기
SELECT count(*) as USERS from USER_INFO where AGE is null;

# ROOT 아이템 구하기
select ITEM_INFO.ITEM_ID, ITEM_NAME from ITEM_INFO left join ITEM_TREE 
on ITEM_INFO.ITEM_ID = ITEM_TREE.ITEM_ID where PARENT_ITEM_ID is null order by ITEM_ID

# 잡은 물고기의 평균 길이 구하기
select round(avg(coalesce(LENGTH, 10)), 2) as AVERAGE_LENGTH from FISH_INFO;