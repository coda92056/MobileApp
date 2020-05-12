*** Settings ***
Library    AppiumLibrary

*** Keywords ***
SigninPage
   AppiumLibrary.Click Element  id=login_button
   sleep  5
   AppiumLibrary.Page Should Contain Text    Forgot your password?
   AppiumLibrary.Hide Keyboard    
   
Login
   AppiumLibrary.Click Element  id=login_button
   sleep  2
   AppiumLibrary.Click Element  id=text_email
   AppiumLibrary.Input Text  id=text_email  coda92056@gmail.com
   AppiumLibrary.Click Element   id=password_field 
   AppiumLibrary.Input Password  id=password_field  !Password123
   Sleep  1
   AppiumLibrary.Click Element  id=login_button
   Sleep  10
   AppiumLibrary.Wait Until Page Contains    Nearby fundraisers 
   AppiumLibrary.Page Should Contain Text    Start a GoFundMe
   AppiumLibrary.Page Should Contain Text    Fundraise for the people and causes you care about.