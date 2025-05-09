import pandas as pd
from sqlalchemy import create_engine
import pymysql
pymysql.install_as_MySQLdb()
import requests
from bs4 import BeautifulSoup as bs
import time
from sqlalchemy import create_engine, text

stock_company_info = []
page = 1
while True:
    url ="https://kind.krx.co.kr/corpgeneral/corpList.do"
    payload = dict(method="searchCorpList", pageIndex=page,
                 currentPageSize=100,
                 orderMode=3, orderStat="D", searchType=13,
                 fiscalYearEnd="all", location="all")
    r = requests.post(url, data=payload)
    soup = bs(r.content, 'lxml')
    total_page = int(soup.select_one(".info.type-00 > em").text.replace(",", "")) // 100 + 1
    
    for idx, tr in enumerate(soup.select("tbody > tr")):
        print(f'{page}/{total_page}중, {idx}/{len(soup.select("tbody > tr"))} 작업중', end="\r")
        stock_type = tr.select_one("td:nth-child(1) > img")['alt']
        company_name = tr.select_one("td:nth-child(1) > a")["title"]
        stock_code = tr.select_one("td:nth-child(1) > a")["onclick"].split("'")[1]
        business_type = tr.select_one("td:nth-child(2)").text
        product = tr.select_one("td:nth-child(3)").text
        resi_date = tr.select_one("td:nth-child(4)").text
        settlement = tr.select_one("td:nth-child(5)").text
        ceo = tr.select_one("td:nth-child(6)").text
        hompage = tr.select_one("td:nth-child(7) > a")["href"] if tr.select_one("td:nth-child(7) > a") != None else ""
        region = tr.select_one("td:nth-child(8)").text
        stock_company_info.append((stock_type, company_name, stock_code, business_type,
                            product, resi_date, settlement, ceo, hompage, region))

    if page < total_page:
        page += 1
    else:
        break

columns = soup.select_one("table")["summary"].split(", ")
columns.insert(0, "증권종류")
columns.insert(2, "종목코드")
df = pd.DataFrame(stock_company_info, columns=columns)

engine = create_engine("mysql+pymysql://root:1234@localhost:3306/korean_stock")
conn = engine.connect()
df.to_sql("company_info", con=conn, if_exists='replace', index=False)
conn.close()

# .exe 파일을 만들었는데 100mb가 넘어서 첨부가 되지 않습니다. 따로 코드 추가하겠습니다.
# pyinstaller -F stock_company_info_임병준.py