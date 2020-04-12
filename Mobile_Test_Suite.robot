*** Settings ***
Library    AppiumLibrary    


*** Test Cases ***
Launch_App
    [tags]  sanity
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=8.1    deviceName=Pixel XL API 27    app=C:\\mobile_apk\\original.apk    appPackage=com.example.myapplication
    Page Should Contain Text    Fly with peace          
    AppiumLibrary.Close Application
Redirect_to_links
    [tags]  smoke
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=8.1    deviceName=Pixel XL API 27    app=C:\\mobile_apk\\original.apk    appPackage=com.example.myapplication
    Wait Until Page Contains     Fly with peace   
    AppiumLibrary.Click Element    id=practice
    Sleep  5
    Wait Until Page Contains   SUBMIT
    AppiumLibrary.Go Back
    Wait Until Page Contains     Fly with peace          
    AppiumLibrary.Close Application
Redirect_to_webview
    [tags]  full   
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=8.1    deviceName=Pixel XL API 27    app=C:\\mobile_apk\\original.apk    appPackage=com.example.myapplication
    Wait Until Page Contains     Fly with peace 
    Sleep    2 
    AppiumLibrary.Click Element    id=weblogin
    Sleep   10 
    Wait Until Page Contains    Login to Flight Application
    AppiumLibrary.Close Application
Enter_Info
    [tags]  full
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=8.1    deviceName=Pixel XL API 27    app=C:\\mobile_apk\\original.apk    appPackage=com.example.myapplication
    Wait Until Page Contains    Fly with peace   
    AppiumLibrary.Click Element    id=practice
    Sleep   5 
    Wait Until Page Contains   SUBMIT
    AppiumLibrary.Click Element    id=editText1 
    AppiumLibrary.Clear Text    id=editText1  
    AppiumLibrary.Input Text    id=editText1  Koda
    AppiumLibrary.Hide Keyboard  
    AppiumLibrary.Click Element    id=editText2   
    AppiumLibrary.Input Password   id=editText2  password
    AppiumLibrary.Hide Keyboard
    AppiumLibrary.Click Element    id=radioButtonFlight
    AppiumLibrary.Click Element    id=radioButtonFlightHotel
    AppiumLibrary.Close Application
    
Get_LastEntry_In_Table
    [tags]  full
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=8.1    deviceName=Pixel XL API 27    app=C:\\mobile_apk\\original.apk    appPackage=com.example.myapplication
    Wait Until Page Contains    Fly with peace   
    AppiumLibrary.Click Element    id=practice
    Sleep  5
    Wait Until Page Contains   SUBMIT   
    ${LastCountry}    AppiumLibrary.Get Text    //*[contains(@text,"Country")]/../../*[last()]/*[1]
    #Log To Console    ${LastCountry}    
    Should contain   ${LastCountry}    Canada
    ${LastPM }    AppiumLibrary.Get Text    //*[contains(@text,"Country")]/../../*[last()]/*[2]
    #Log To Console    ${LastCountry}    
    Should contain   ${LastPM}    Trudeau 
    AppiumLibrary.Close Application
    
Select_options
    [tags]  working
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=8.1    deviceName=Pixel XL API 27    app=C:\\mobile_apk\\original.apk    appPackage=com.example.myapplication
    Wait Until Page Contains    Fly with peace   
    AppiumLibrary.Click Element    id=practice
    Sleep  5
    Wait Until Page Contains   SUBMIT   
    AppiumLibrary.Click Element    id=spinnerFrom
    AppiumLibrary.Click Element    xpath=//*[@text="BMW"]
    Sleep  1
    AppiumLibrary.Click Element    id=toggleButton
    AppiumLibrary.Click Text    Switch
    AppiumLibrary.Click Element    id=checkBox
    AppiumLibrary.Close Application
    
