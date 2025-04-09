from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time
import pandas as pd
from sqlalchemy import create_engine, text
import pymysql
pymysql.install_as_MySQLdb()

keyword = input("검색어를 입력하세요")


options = Options()
options.add_experimental_option("detach", True)
options.add_argument("start-maximized")
options.add_argument("Chrome/134.0.0.0")
options.add_argument("lang=ko_KR")


driver = webdriver.Chrome(
    service=Service(ChromeDriverManager().install()),
    options=options
    )
driver.get("https://translate.google.co.kr/?sl=ko&tl=en&op=translate")
wait = WebDriverWait(driver, 10)

search_text_box = wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, "div > textarea")))
search_text_box.send_keys(keyword)
search_text_box.send_keys(Keys.ENTER)