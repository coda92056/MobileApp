*** Settings ***
Library    AppiumLibrary    


*** Test Cases ***
Launch_App
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=8.1    deviceName=Pixel XL API 27    app=C:\\mobile_apk\\original.apk    appPackage=com.example.myapplication
    Page Should Contain Text    Fly with peace          
