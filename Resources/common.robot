*** Settings ***
Library    AppiumLibrary 

#date 031020  Marcos
*** Variables ***
${status}   No

*** Keywords ***
Begin Mobile Test   
    AppiumLibrary.Close All Applications
    AppiumLibrary.Open Application  http://localhost:4723/wd/hub    platformName=Android    platformVersion=8.1  deviceName=Pixel XL API 27  app=C:\\mobile_apk\\GofundMe.apk    appPackage=com.GoFundMe.GoFundMe  appWaitActivity=*.*
    AppiumLibrary.Hide Keyboard
    #${status}=  Run Keyword And Return Status   AppiumLibrary.Hide Keyboard
    #Log to Console  ${Status}
    #Run Keyword If  ${Status}==Yes  AppiumLibrary.Hide Keyboard    
    #Log To Console   Common Begin Keyword closing app  
End Mobile Test
    AppiumLibrary.Close All Applications
    #Log AppiumLibrary.Hide Keyboard    To Console    Common End Keyword closing app  
