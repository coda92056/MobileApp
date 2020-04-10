*** Settings ***
Library    AppiumLibrary    


*** Test Cases ***
Launch_App
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=8.1    deviceName=Pixel XL API 27    app=C:\\mobile_apk\\original.apk    appPackage=com.example.myapplication
    Page Should Contain Text    Fly with peace          
    Close All Applications
Redirect_to_links
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=8.1    deviceName=Pixel XL API 27    app=C:\\mobile_apk\\original.apk    appPackage=com.example.myapplication
    Wait Until Page Contains     Fly with peace   
    AppiumLibrary.Click Element    id=practice
    Wait Until Page Contains   SUBMIT
    AppiumLibrary.Go Back
    Wait Until Page Contains     Fly with peace          
    Close All Applications
Redirect_to_webview
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=8.1    deviceName=Pixel XL API 27    app=C:\\mobile_apk\\original.apk    appPackage=com.example.myapplication
    Wait Until Page Contains     Fly with peace  
    AppiumLibrary.Click Element    id=weblogin
    Set Appium Timeout   10s  
    Wait Until Page Contains    Login to Flight Application
    
Enter_Info
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=8.1    deviceName=Pixel XL API 27    app=C:\\mobile_apk\\original.apk    appPackage=com.example.myapplication
    Wait Until Page Contains    Fly with peace   
    AppiumLibrary.Click Element    id=practice
    Wait Until Page Contains   SUBMIT
    AppiumLibrary.Clear Text    id=editText1  
    AppiumLibrary.Input Text    id=editText1  Koda
    AppiumLibrary.Input Password   id=editText2  password
    AppiumLibrary.Click Element    id=radioButtonFlight
    AppiumLibrary.Click Element    id=radioButtonFlightHotel
    
 
   

