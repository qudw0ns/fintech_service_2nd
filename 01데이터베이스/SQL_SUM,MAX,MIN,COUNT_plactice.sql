# 가장 비싼 상품 구하기
SELECT max(PRICE) MAX_PRICE from PRODUCT;

# 최댓값 구하기
SELECT max(DATETIME) from ANIMAL_INS;

# 잡은 물고기 중 가장 큰 물고기의 길이 구하기
# 문자를 연결하는 함수 concat
select concat(max(LENGTH), "cm") MAX_LENGTH from FISH_INFO;

# 가격이 제일 비싼 식품의 정보 출력하기
# 서브쿼리에 대한 연습이 더 필요
SELECT * FROM FOOD_PRODUCT WHERE PRICE=(SELECT MAX(PRICE) FROM FOOD_PRODUCT);

# 최솟값 구하기
SELECT MIN(DATETIME) FROM ANIMAL_INS;

# 동물 수 구하기
SELECT COUNT(ANIMAL_ID) FROM ANIMAL_INS;

# 중복 제거하기
# Distinct 중복제거
SELECT COUNT(distinct NAME) from ANIMAL_INS;

# 조건에 맞는 아이템들의 가격의 총합 구하기
select sum(price) TOTAL_PRICE from ITEM_INFO where RARITY="LEGEND";