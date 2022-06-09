*** Settings ***
Library    DateTime
Library    Selenium2Library
Library    BuiltIn
Library    openpyxl

*** Test Cases ***
Get Date and Time
    ${time}    Get Time                    
    Log To Console    \n${time}                                        #Ex.2022-06-05 16:15:22
    ${date_time}    Get Current Date                                   
    Log To Console    \n${date_time}                                    #Ex.2022-06-05 16:15:22.257
    ${date_time}    Convert Date    ${date_time}    result_format=%d-%m-%Y %H-%M-%S    # จัดการ format วันเวลา
    Log To Console    \n${date_time}\n                                 #Ex.05-06-2022 16-15-22
    Set Global Variable    ${date_time}                                # Set Global Variable  set date time ให้สามารถใช้งานได้กับ keyword หรือ test case ต่อไปได้

Capture JPG
    Open Browser    https://robotframework.org/    Chrome
    Maximize Browser Window
    Set Selenium Speed    0.2
    Capture Page Screenshot    ${CURDIR}/Capture-${date_time}.png        # set ชื่อรูป รูปถูกเก็บไว้ที่ folder project
    Capture Page Screenshot    %{userprofile}/Capture-${date_time}.png   # รูปถูกเก็บไว้ที่ folder user -> C:\Users
    #Capture Page Screenshot    ${CURDIR}                                 # selenium-screenshot-1 ชื่อไฟล์จะรันเลขเอง
    Log To Console    Capture-${date_time}
