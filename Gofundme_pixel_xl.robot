*** Settings *** 
Library    AppiumLibrary    


*** Test Cases ***
Launch_App
    [tags]  sanity
   AppiumLibrary.Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=8.1  deviceName=Pixel XL API 27  app=C:\\mobile_apk\\GofundMe.apk    appPackage=com.GoFundMe.GoFundMe  appWaitActivity=*.*
      #Log To Console  Validating Page Text
   AppiumLibrary.Page Should Contain Text    The #1  
   AppiumLibrary.Click Element  id=sign_up_button
   sleep  5
   AppiumLibrary.Page Should Contain Text    Already have an account?
   AppiumLibrary.Click Text  First name
   AppiumLibrary.Input Text  xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.EditText  Koda
   
   AppiumLibrary.Click Text  Last name
   AppiumLibrary.Input Text  xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.EditText  Bear
   
   AppiumLibrary.Click Text  Email
   AppiumLibrary.Input Text  xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.EditText  coda92056@gmail.com
   

   AppiumLibrary.Click Text  Password
   Sleep  5
   AppiumLibrary.Input Password    xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.EditText  !Password123
   Sleep  2
   AppiumLibrary.Hide Keyboard    
   AppiumLibrary.Click Element  id=sign_up_button
    
 
 #  sleep  5
 #  AppiumLibrar