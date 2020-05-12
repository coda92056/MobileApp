*** Settings ***
Library    AppiumLibrary

*** Variables ***
#Global Variables
${dc}  http://localhost:4723/wd/hub    platformName=Android    platformVersion=8.1  deviceName=Pixel XL API 27  app=C:\\mobile_apk\\GofundMe.apk    appPackage=com.GoFundMe.GoFundMe  appWaitActivity=*.*
${GLOBAL_MESSAGE}  Script loadining app


*** Keywords ***
Load
    #Log To Console  ${GLOBAL_MESSAGE}
    #AppiumLibrary.Open Application  http://localhost:4723/wd/hub    platformName=Android    platformVersion=8.1  deviceName=Pixel XL API 27  app=C:\\mobile_apk\\GofundMe.apk    appPackage=com.GoFundMe.GoFundMe  appWaitActivity=*.*
    #Move above code to Common and only validating page is loaded below
    AppiumLibrary.Wait Until Page Contains   The #1   
    AppiumLibrary.Page Should Contain Text    By continuing, you agree with the GoFundMe terms and privacy policy