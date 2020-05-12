*** Settings ***
Library    AppiumLibrary

*** Keywords ***
SignupPage
    #Log To Console  ${GLOBAL_MESSAGE}
   AppiumLibrary.Click Element  id=sign_up_button
   sleep  5
   AppiumLibrary.Page Should Contain Text    Already have an account?
   
EnterCreds
   AppiumLibrary.Hide Keyboard 
   AppiumLibrary.Click Text  First name
   AppiumLibrary.Input Text  xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.EditText  Koda
   
   AppiumLibrary.Click Text  Last name
   AppiumLibrary.Input Text  xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.EditText  Bear
   
   AppiumLibrary.Click Text  Email
   AppiumLibrary.Input Text  xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.EditText  coda92056@gmail.com
   

   AppiumLibrary.Click Text  Password
   Sleep  5
   AppiumLibrary.Input Password    xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.EditText  !Password123
   AppiumLibrary.Hide Keyboard   
   Sleep  5 
   AppiumLibrary.Click Element  id=sign_up_button
   Sleep  5