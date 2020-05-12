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

Launch_App
   [tags]  Sanity
   [Documentation]  App shall launch on Device
   App.Launch_App
  
Sign_up_Page  
   [tags]  Smoke
   [Documentation]  User can Access the Sign up Page
   App.Launch_App
   App.Sign_up
    
Sign_in_Page  
   [tags]  Smoke
   [Documentation]  User can as Access the Sign in Page
   App.Launch_App
   App.Sign_in
   
Enter_Signup_credentials
   [tags]  Smoke
   [Documentation]  User can enter credentials  to Signup 
   App.Launch_App
   App.Sign_up 
   App.Enter Sign_up_credentials
Log_in
   [tags]  Sanity
   [Documentation]  User can Sign in
   App.Launch_App
   App.Valid_user_sign_in
   
Sign_out
    [tags]  Sanity
   [Documentation]  User can Sign Out
   App.Launch_App
   App.Valid_user_sign_in
   App.Log_Out

Start_a_Campaign 
    [tags]  Smoke
    [Documentation]  User can start a campaign
    App.Launch_App
    App.Valid_user_sign_in
    App.Start_a_Campaign 
   
Select and View Campaign
   [tags]  Feature
   [Documentation]  User can scroll thru Popular campaigns and view campaign page
   App.Launch_App
   App.Valid_user_sign_in
   Sleep  2
   App.Select_Campaign
   
    
Start New Donation
    [tags]  Smoke
    [Documentation]  User initate a donation
    App.Launch_App
    App.Valid_user_sign_in 
    App.Start_New_Donation 
    
Sharing a Campaign 
    [tags]  Smoke
    [Documentation]  User cannot share without having logged into FB
    App.Launch_App
    App.Valid_user_sign_in
    App.Share
