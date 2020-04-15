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
    [tags]  sanity
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
    [tags]  sanity
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
    [tags]  sanity
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
    
EndtoEnd
    Login
    Book
    VerifyConfirmation

*** Keywords ***
Login
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=8.1    deviceName=Pixel XL API 27    app=C:\\mobile_apk\\original.apk    appPackage=com.example.myapplication
    Page Should Contain Text    Fly with peace
    AppiumLibrary.Click Element    id=login
    Wait Until Page Contains       Enter username
    AppiumLibrary.Input Text       id=username  support@ngendigital.com
    AppiumLibrary.Input Text       id=password  abc123   
    AppiumLibrary.Hide Keyboard    
    AppiumLibrary.Click Element    id=signIn
    Wait Until Page Contains       Fly with peace
    
Book
    AppiumLibrary.Click Element    id=book
    sleep  5
    AppiumLibrary.Click Element    id=spinnerFrom
    Wait Until Page Contains       Toronto
    AppiumLibrary.Click Element    xpath=//*[@text="Toronto"]
    AppiumLibrary.Click Element    id=spinnerTo
    Wait Until Page Contains       Ottawa
    AppiumLibrary.Click Element    xpath=//*[@text="Paris"]
    AppiumLibrary.Click Element    id=spinnerClass
    Wait Until Page Contains       Business
    AppiumLibrary.Click Element    xpath=//*[@text="Economy"]
    AppiumLibrary.Click Element    id=textStartDate
    Wait Until Page Contains       2019
    AppiumLibrary.Click Element    //android.view.View[@content-desc="11 December 2019"]
    Sleep  5
    AppiumLibrary.Click Text    OK    
    AppiumLibrary.Click Element    id=textEndDate
    Wait Until Page Contains       2019
    AppiumLibrary.Click Element    //android.view.View[@content-desc="20 December 2019"]
    Sleep  5
    AppiumLibrary.Click Text    OK    
    AppiumLibrary.Click Element    radioButtonFlight
    Wait Until Page Contains       Book
    AppiumLibrary.Click Element    book_flight
    Wait Until Page Contains       Click on the price to confirm your booking
    AppiumLibrary.Click Element    price5
    Wait Until Page Contains       Confirm
    AppiumLibrary.Click Element    confirm_order    

VerifyConfirmation
    Wait Until Page Contains    Your flight is booked.  
    AppiumLibrary.Page Should Contain Text    Your flight is booked. Reservation number is CADX2214  
    #fist 4 are characters and last 4 are digits
    AppiumLibrary.Element Attribute Should Match    id=checkedTextView    text     Your flight is booked. Reservation number is \\w{4}\\d{4}  regexp=True
    #8 totals characters
    AppiumLibrary.Element Attribute Should Match    id=checkedTextView    text     Your flight is booked. Reservation number is \.{8}  regexp=True
    #should not start with a digit
    AppiumLibrary.Element Attribute Should Match    id=checkedTextView    text     Your flight is booked. Reservation number is [^\\d]\\w+  regexp=True
     #should  end with digit
    AppiumLibrary.Element Attribute Should Match    id=checkedTextView    text     Your flight is booked. Reservation number is \.*\\d$  regexp=True