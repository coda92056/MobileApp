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


   
Enter_Signup_credentials
   [tags]  Smoke
   [Documentation]  User can enter credentials  to Signup 
   App.Launch_App
   App.Sign_up 
   App.Enter Sign_up_credentials
