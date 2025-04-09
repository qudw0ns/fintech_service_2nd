import pandas as pd
from sqlalchemy import create_engine
import pymysql
pymysql.install_as_MySQLdb()
import requests
from bs4 import BeautifulSoup as bs
import time
from datetime import datetime

def dbconnect():
    engine = create_engine("mysql+pymysql://root:1234@localhost:3306/excnage_rate")
    conn = engine.connect()
    return conn

def to_ex_db(df):
    # Database 쿼리창 오픈
    conn = dbconnect()
    time.sleep(1)
    df.to_sql(f'excnage_rate', con=conn, if_exists="append", index=False)
    conn.close()
    return 