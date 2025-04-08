import pandas as pd
from sqlalchemy import create_engine
import pymysql
pymysql.install_as_MySQLdb()
import requests
from bs4 import BeautifulSoup as bs
import time
from datetime import datetime


def dbconnect():
    engine = create_engine("mysql+pymysql://root:1234@localhost:3306/stock_info")
    conn = engine.connect()
    return conn


def to_book_db(keyword, df):
    """
    keword, df를 입력받아 네이버 도서에서 검색하고 5페이지 결과를
    {검색어 명}_book_info  테이블을 mysql에 저장
    """
    # Database 쿼리창 오픈
    conn = dbconnect()
    df.to_sql(f'{keyword}_book_info', con=conn, if_exists="append", index=False)
    conn.close()
    return 