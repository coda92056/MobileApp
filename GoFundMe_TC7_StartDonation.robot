*** Settings *** 
### Command line execution:
### C:\Users\delllaptop\eclipse-python\MobileApp>python -m robot -d results Gofundme_nexus5.robot
Resource  Resources/App.robot
Resource  Resources/Common.robot

Library    AppiumLibrary  
Test Setup     Common.Begin Mobile Test
Test Teardown  Common.End Mobile Test

*** Variables ***
#Global Variables
${dc}  http://localhost:4723/wd/hub    platformName=Android    platformVersion=8.1  deviceName=Pixel XL API 27  app=C:\\mobile_apk\\GofundMe.apk    appPackage=com.GoFundMe.GoFundMe  appWaitActivity=*.*
${GLOBAL_MESSAGE}  Script is running

*** Test Cases ***

    
Start New Donation
    [tags]  Smoke
    [Documentation]  User initate a donation
    App.Launch_App
    App.Valid_user_sign_in 
    App.Start_New_Donation 