pip install selenium
conda install selenium

import re
from bs4 import BeautifulSoup # url 열고 soup화 시키기위해 , parser하기위해
import urllib
from urllib.request import urlopen # url 열기위해
import time # 시간 지연을 두기위해
import pandas as pd
from pandas import Series, DataFrame # 데이터프레임형식을 쓰기위해
from selenium import webdriver # 셀레니움을 쓰기위한 패키지
from selenium.webdriver.common.by import By # 클릭이라는 모션을 사용하기위해


게시판 타입  : db 컬럼에 넣을 때 
교회타입
1. 주일예배
2. 수요예베
3. 금요예배
4. 공지사항
5. 교우소식
6. 교회학교
7. 청년부


cnt = 97 # 크롤링하면서 게시글 번호 붙일거 


driver = webdriver.Chrome("c:/data/chromedriver.exe") # 셀리니움 을 위한 드라이버는 파이선 py파일과 동일위

# 데이터 넣을 프레임
data_df = DataFrame(columns=['bno','title','url','content','writer','regdate','updatedate','board_type'])


# 게시판 타입
board_type = 3


sss = ''


for y in range(0,3):
    print(str(y+1) + '페이지')
    

    url = 'http://www.glory153.org/home/b0'+str(3)+'/view_list/page/'+str(12 * y)  #  페이지
    
    driver.get(url)
    
    
    html = driver.page_source
    soup = BeautifulSoup(html,'html.parser')
    stat_table = soup.select('div.board_wrap > div > div >  table > tbody > tr')
    
    for i in range(1,len(stat_table)+1): # 그 페이지의 i 번째 게시글
        # 게시글 선택
        cookie_btn = driver.find_element(By.XPATH,'//*[@id="_core_content_wrapper_"]/div[4]/div[1]/div/div/table/tbody/tr['+str(i)+']/td[2]/a/span')
        cookie_btn.click()
        

        html = driver.page_source
        soup = BeautifulSoup(html,'html.parser')
        
        
        title_i = soup.select_one(' div.video-wrapper.col-md-12 > div.col-md-7 > div.board_con.col-md-12 > h3').text # 제목
        
        
        name_date = soup.select_one(' div.video-wrapper.col-md-12 > div.col-md-7 > div.board_con.col-md-12 > span:nth-child(4)').text # 이름, 날짜
        
        name = name_date[:name_date.find('-')-5] + sss   # 이름
        date = name_date[name_date.find('-')-4:]    # 날짜
        date = date[date.find('-')-2:].replace('-','/') # DB의  date타입에 맞게 변환
        
        
        url_x = soup.select_one('div.video-wrapper.col-md-12 > div.col-md-7 > iframe')# url
        
        url_y = str(url_x) # 문자열로 형변환
        
        s = url_y.find('https')
        e = url_y.find('width="')
        url_ture = url_y[s:e-2]+sss # 찐 url
        
        
        data_df = data_df.append({'bno' : cnt,'title' : title_i,'url' : url_ture,'content' : '' ,'writer' : name,'regdate' : date,'updatedate' : date,'board_type' : board_type},ignore_index=True)
        print(cnt)
        
        cnt += 1
        time.sleep(1.5) # 게시글당 딜레이시간
        driver.back() # 뒤로가기 버튼 : 게시글에서 게시판으로
        
        
    time.sleep(2) # 페이지당 딜레이시간
    





data_df



data_df.to_excel("c:/data/board3.xlsx")


    
to_excel("test.xlsx")



dataset2 = pd.read_excel('c:/data/board1.xlsx', index_col = 0)

dataset2.

board_data = pd.concat([dataset2,data_df], ignore_index=True)
board_data.to_excel("c:/data/board_data.xlsx")


예배 게시판 1~3 까지 마지막 bno 167

------------------------------------------------------------------------------------------------------------------------

나눔


cnt = 169 # 크롤링하면서 게시글 번호 붙일거 


driver = webdriver.Chrome("c:/data/chromedriver.exe") # 셀리니움 을 위한 드라이버는 파이선 py파일과 동일위

# 데이터 넣을 프레임
data_df = DataFrame(columns=['bno','title','url','content','writer','regdate','updatedate','board_type'])

# 작성자는 김병건 담임목사 님으로 고정

# 게시판 타입
board_type = 4


sss = ''


for y in range(0,21):
    print(str(y+1) + '페이지')
    

    url = 'http://www.glory153.org/home/e01/view_list/page/'+str(12 * y)  #  페이지
    
    driver.get(url)
    
    
    html = driver.page_source
    soup = BeautifulSoup(html,'html.parser')
    stat_table = soup.select('div.board_wrap > div > div >  table > tbody > tr')
    
    for i in range(1,len(stat_table)+1): # 그 페이지의 i 번째 게시글
        # 게시글 선택
        cookie_btn = driver.find_element(By.XPATH,'//*[@id="_core_content_wrapper_"]/div[4]/div[1]/div/div/table/tbody/tr['+str(i)+']/td[2]/a/span')
        cookie_btn.click()
        

        html = driver.page_source
        soup = BeautifulSoup(html,'html.parser')
        
        
        title_i = soup.select_one('div > div:nth-child(2) > table > tbody > tr:nth-child(1) > td').text.strip() # 제목
        
        
        date_1 = soup.select_one('#_core_content_wrapper_ > div > div:nth-child(2) > table > tbody > tr:nth-child(2) > td > table > tbody > tr > td').text #날짜
        
        date = date_1[date_1.find('-')-2:date_1.find('-')+6]  # DB의  date타입에 맞게 변환
        data = date.replace('-','/')
        
        # url 없
        url_ture = sss # 찐 url
        
        data_df = data_df.append({'bno' : cnt,'title' : title_i,'url' : url_ture,'content' : '' ,'writer' : '김병건 담임목사','regdate' : date,'updatedate' : date,'board_type' : board_type},ignore_index=True)
        print(cnt)
        
        cnt += 1
        time.sleep(1.5) # 게시글당 딜레이시간
        driver.back() # 뒤로가기 버튼 : 게시글에서 게시판으로
        
    time.sleep(2) # 페이지당 딜레이시간
 # 엑셀파일로 저


data_df['regdate'] = data_df['regdate'].apply(lambda x: re.sub('-','/',x))
data_df['updatedate'] = data_df['updatedate'].apply(lambda x: re.sub('-','/',x))



data_df.to_excel("c:/data/board4.xlsx")



board_data = pd.read_excel('c:/data/board_1_4.xlsx', index_col = 0)

board_data = board_data.iloc[:168]

board_data = pd.concat([board_data,data_df], ignore_index=True)
board_data.to_excel("c:/data/board_1_4.xlsx")


------------------------------------------------------------------------------------------------------------------------

교우소식


cnt = 421 # 크롤링하면서 게시글 번호 붙일거 


driver = webdriver.Chrome("c:/data/chromedriver.exe") # 셀리니움 을 위한 드라이버는 파이선 py파일과 동일위

# 데이터 넣을 프레임
data_df = DataFrame(columns=['bno','title','url','content','writer','regdate','updatedate','board_type'])

# 작성자는 김병건 담임목사 님으로 고정

# 게시판 타입
board_type = 5


sss = ''

    url = 'http://www.glory153.org/home/e03/view_list/page/0'  #  페이지
    
    driver.get(url)
    
    
    html = driver.page_source
    soup = BeautifulSoup(html,'html.parser')

    
    for i in range(1,11): # 그 페이지의 i 번째 게시글
        # 게시글 선택
        cookie_btn = driver.find_element(By.XPATH,'//*[@id="_core_content_wrapper_"]/div[4]/div[1]/div/div/table/tbody/tr['+str(i)+']/td[2]/a/span')
        cookie_btn.click()
        

        html = driver.page_source
        soup = BeautifulSoup(html,'html.parser')
        
        
        title_i = soup.select_one('div > div:nth-child(2) > table > tbody > tr:nth-child(1) > td').text.strip() # 제목
        
        
        date_1 = soup.select_one('#_core_content_wrapper_ > div > div:nth-child(2) > table > tbody > tr:nth-child(2) > td > table > tbody > tr > td').text #날짜
        
        date = date_1[date_1.find('-')-2:date_1.find('-')+6]  # DB의  date타입에 맞게 변환
        data = date.replace('-','/')
        
        # url 없
        url_ture = sss # 찐 url
        
        
        data_df = data_df.append({'bno' : cnt,'title' : title_i,'url' : url_ture,'content' : '' ,'writer' : '김병건 담임목사','regdate' : date,'updatedate' : date,'board_type' : board_type},ignore_index=True)
        print(cnt)
        
        cnt += 1
        time.sleep(1.5) # 게시글당 딜레이시간
        driver.back() # 뒤로가기 버튼 : 게시글에서 게시판으로
        
   

    
data_df['regdate'] = data_df['regdate'].apply(lambda x: re.sub('-','/',x))
data_df['updatedate'] = data_df['updatedate'].apply(lambda x: re.sub('-','/',x))
    
   
data_df.to_excel("c:/data/board5.xlsx") # 엑셀파일로 저


board_data = pd.read_excel('c:/data/board_1_4.xlsx', index_col = 0)

board_data = pd.concat([board_data,data_df], ignore_index=True)
board_data.to_excel("c:/data/board_1_5.xlsx")


------------------------------------------------------------------------------------------------------------------------

교회학


cnt = 431 # 크롤링하면서 게시글 번호 붙일거 


driver = webdriver.Chrome("c:/data/chromedriver.exe") # 셀리니움 을 위한 드라이버는 파이선 py파일과 동일위

# 데이터 넣을 프레임
data_df = DataFrame(columns=['bno','title','url','content','writer','regdate','updatedate','board_type'])

# 작성자는 김병건 담임목사 님으로 고정

# 게시판 타입
board_type = 6


sss = ''



    for j in range(0,3):
        url = 'http://www.glory153.org/home/f0102/view_list/page/'+str(j*20)  #  페이지
        
        driver.get(url)
        
        
        html = driver.page_source
        soup = BeautifulSoup(html,'html.parser')
    
        
    
        for i in range(1,21):# 그 페이지의 i 번째 게시글
    
            # 게시글 선택
            cookie_btn = driver.find_element(By.XPATH,'//*[@id="_core_content_wrapper_"]/div[4]/div[1]/div/div/table/tbody/tr['+str(i)+']/td[2]/a/span')
            cookie_btn.click()
            
    
            html = driver.page_source
            soup = BeautifulSoup(html,'html.parser')
            
            
            title_i = soup.select_one('div > div:nth-child(2) > table > tbody > tr:nth-child(1) > td').text.strip() # 제목
            
            
            date_1 = soup.select_one('#_core_content_wrapper_ > div > div:nth-child(2) > table > tbody > tr:nth-child(2) > td > table > tbody > tr > td').text #날짜
            
            date = date_1[date_1.find('-')-2:date_1.find('-')+6]  # DB의  date타입에 맞게 변환
            data = date.replace('-','/')
            
            # url 없
            url_x = soup.select_one('div > div:nth-child(2) > table > tbody > tr:nth-child(3) > td > iframe')# url
            
            url_y = str(url_x) # 문자열로 형변환
            
            s = url_y.find('https')
            e = url_y.find('width="')
            url_ture = url_y[s:e-2]+sss # 찐 url
            
            
            data_df = data_df.append({'bno' : cnt,'title' : title_i,'url' : url_ture,'content' : '' ,'writer' : '김병건 담임목사','regdate' : date,'updatedate' : date,'board_type' : board_type},ignore_index=True)
            print(cnt)
            
            cnt += 1
            time.sleep(1.5) # 게시글당 딜레이시간
            driver.back() # 뒤로가기 버튼 : 게시글에서 게시판으로

        time.sleep(2) # 페이지당 딜레이시간
    
    
data_df.to_excel("c:/data/board_1_6.xlsx") # 엑셀파일로 저장


board_data2 = pd.read_excel('c:/data/board_1_6.xlsx', index_col = 0)

board_data['bno'].iloc[-10:] = board_data['bno'].iloc[-10:].apply(lambda x: x-10)

board_data2 = board_data2.iloc[430:]

board_data = pd.concat([board_data,board_data2], ignore_index=True)
board_data.to_excel("c:/data/board_1_6.xlsx")



board_data.to_csv("c:/data/board_1_6_csv.csv")

