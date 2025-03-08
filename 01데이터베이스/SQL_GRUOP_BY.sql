# 자동차 종류 별 특정 옵션이 포함된 자동차 수 구하기
# where in은 정확히 일치하는 것만 사용가능(in이 안되면 like를 이용하자)
select CAR_TYPE, count(*) as CARS from CAR_RENTAL_COMPANY_CAR
where OPTIONS like "%통풍시트%" or OPTIONS like "%열선시트%" or OPTIONS like "%가죽시트%"
group by CAR_TYPE order by CAR_TYPE asc;

# 성분으로 구분한 아이스크림 총 주문량
SELECT INGREDIENT_TYPE, sum(TOTAL_ORDER) as TOTAL_ORDER from FIRST_HALF left join ICECREAM_INFO
on FIRST_HALF.FLAVOR = ICECREAM_INFO.FLAVOR group by INGREDIENT_TYPE order by TOTAL_ORDER asc;

# 진료과별 총 예약 횟수 출력하기
SELECT MCDP_CD as "진료과 코드", count(*) as "5월예약건수" from APPOINTMENT 
where APNT_YMD like "%2022-05%" group by MCDP_CD order by count(*) asc, MCDP_CD asc;

# 고양이와 개는 몇 마리 있을까
SELECT ANIMAL_TYPE, count(*) from ANIMAL_INS group by ANIMAL_TYPE order by ANIMAL_TYPE asc;

# 동명 동물 수 찾기


# 입양 시각 구하기(1)
SELECT date_format(DATETIME, "%H") as HOUR, count(*) as COUNT from ANIMAL_OUTS 
WHERE date_format(DATETIME, "%H") between 9 and 19 group by date_format(DATETIME, "%H")
order by HOUR asc;

# 가격대 별 상품 개수 구하기
# truncate(값, 자릿수) 버림
SELECT truncate(price, -4) as PRICE_GROUP, count(*) as PRODUCTS from PRODUCT 
group by PRICE_GROUP order by PRICE_GROUP asc;

# 조건에 맞는 사원 정보 조회하기


# 물고기 종류 별 잡은 수 구하기
select count(*) as FISH_COUNT, FISH_NAME from FISH_INFO left join FISH_NAME_INFO
on FISH_INFO.FISH_TYPE = FISH_NAME_INFO.FISH_TYPE group by FISH_NAME
ORDER BY count(*) DESC;

# 월별 잡은 물고기 수 구하기
#  MONTH()는 월만 표시(1자리 월일 경우 1자리로 표시)
SELECT COUNT(*) AS FISH_COUNT, MONTH(TIME) AS MONTH from FISH_INFO 
where TIME is not null group by MONTH order by MONTH asc;