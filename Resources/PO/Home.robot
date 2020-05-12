*** Settings ***
Library    AppiumLibrary

*** Variables ***
${i}       0
${present}   False
${important}   False

*** Keywords ***

StartCampaign
      #Log To Console   start new campaign click button
      AppiumLibrary.Click Element    id=action_start_campaign  
      #Log To Console    Wait for Page contains New Fundraiser
      Sleep  2      
      AppiumLibrary.Wait Until Page Contains     New fundraiser
      #Log To Console    Check Text Elements
      AppiumLibrary.Element Should Contain Text    id=campaign_title_edit_text    For Koda Relief Fund 
      AppiumLibrary.Element Should Contain Text    id=menu_next    NEXT  
      Sleep  2
      AppiumLibrary.Go Back
      
SignOut
    AppiumLibrary.Page Should Contain Text    Nearby fundraiser
    #Log To Console    clicking Me    
    AppiumLibrary.Click Element    xpath=//android.widget.FrameLayout[@content-desc="Me"]/android.widget.ImageView
    #Log To Console    checking Page for "Settings"   
    AppiumLibrary.Wait Until Page Contains    Settings
    AppiumLibrary.Element Should Contain Text    xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[2]/android.widget.LinearLayout/android.widget.LinearLayout[1]/android.widget.LinearLayout/android.widget.TextView    Account
    #Log To Console    Clicking on Sign out
    AppiumLibrary.Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[2]/android.widget.LinearLayout/android.widget.LinearLayout[5]/android.widget.LinearLayout/android.widget.TextView
    #Log To Console    Clicking popup to Sign out
    AppiumLibrary.Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.TextView[2]
    #Log To Console    Should be back at Sign in screen    
    AppiumLibrary.Page Should Contain Text    Sign in 
    AppiumLibrary.Hide Keyboard    
    Sleep  1
    
  
ScrollHome
    Sleep  10
    #Confirm that home page is a top
    AppiumLibrary.Page Should Contain Text    Nearby fundraiser
   
    #Loop
    @{count}    create list    1  2  3  4  5  6  7
    FOR   ${i}    IN  @{count}
     AppiumLibrary.swipe       0    1100    0    0
     #Exit For Loop If    ${i}==3
     #check if element is present
     ${present}=  Run Keyword And Return Status    AppiumLibrary.Page Should Contain Text  Popular now    
     #Log to console  ${present}
     #iF Popular now present exit loop
     Exit For Loop If    ${present}==True
    END
     Run Keyword If    ${i}==7     Log to Console  Popular now not found!!
     Run Keyword If    ${i}==7     Quit Application   
    #Put first Popular Campaign in screen
    AppiumLibrary.swipe       0    1100    0    300 
    #${window_height}    AppiumLibrary.Get Window Height
    #log to console   ${window_height}
    #Validate Campaign page elements
     AppiumLibrary.Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/androidx.viewpager.widget.ViewPager/android.view.ViewGroup/android.view.ViewGroup[2]/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout/android.widget.ImageView
     Sleep  5
     AppiumLibrary.Element Should Be Visible    id=profile_image
     AppiumLibrary.Element Should Be Visible    id=likeButton   
     AppiumLibrary.Element Should Be Visible    id=shareButton  
     Sleep  2
     AppiumLibrary.Go Back
     Sleep  5

      

    
StartDonation
      #Log To Console   start new Donation
      Sleep  10
     #Confirm that home page is a top
     AppiumLibrary.Page Should Contain Text    Nearby fundraiser
   
    #Loop
    @{count}    create list    1  2  3  4  5  6  7
    FOR   ${i}    IN  @{count}
     AppiumLibrary.swipe       0    1100    0    0
      #Exit For Loop If    ${i}==3
      #check if element is present
      ${important}=  Run Keyword And Return Status    AppiumLibrary.Page Should Contain Text  Support important causes   
      #Log to console  ${present}
      #Log to console  ${important}
      Exit For Loop If    ${important}==True
      END
      Run Keyword If    ${i}==2    Log to Console  Support important causes not found
      Run Keyword If    ${i}==2     Quit Application  
    #Log To Console    Position First Image to center
    AppiumLibrary.swipe       0    500    0    300 
    #Log To Console    Clickin on Support important Image
    sleep  2
    #Log TO Console  wait for page to load topic name
    AppiumLibrary.Click Element    id=topic_name
      #Log To Console    checking if Page is loaded
      Sleep  5
      AppiumLibrary.Wait Until Page Contains     Stories
      #Log To Console    clicking on Donate button
      AppiumLibrary.Click Element  id=donate_button
      #Log To Console    Wait for Donation page and checking page
      Sleep  10
      Set Appium Timeout    1000
      AppiumLibrary.Wait Until Page Contains    Enter your Donation
      #Log To Console    Validating donation page text has
      AppiumLibrary.Page Should Contain Text   GoFundMe has a 0% platform fee
      #Log To Console  Click Navigate Back
      AppiumLibrary.Click Element  xpath=//android.widget.ImageButton[@content-desc="Navigate up"]
      Sleep  2
      AppiumLibrary.Go Back
      
ShareCampaign
    #Log To Console   start new Donation
      Sleep  10
     #Confirm that home page is a top
     AppiumLibrary.Page Should Contain Text    Nearby fundraiser
   
    #Loop
    @{count}    create list    1  2  3  4  5  6  7
    FOR   ${i}    IN  @{count}
     AppiumLibrary.swipe       0    1100    0    0
      #Exit For Loop If    ${i}==3
      #check if element is present
      ${important}=  Run Keyword And Return Status    AppiumLibrary.Page Should Contain Text  Support important causes   
      #Log to console  ${present}
      #Log to console  ${important}
      Exit For Loop If    ${important}==True
      END
      Run Keyword If    ${i}==2    Log to Console  Support important causes not found
      Run Keyword If    ${i}==2     Quit Application  
    #Log To Console    Position First Image to center
    AppiumLibrary.swipe       0    500    0    300 
    #Log To Console    Clickin on Support important Image
    sleep  2 
    AppiumLibrary.Click Element    id=topic_name
      #Log To Console    checking if Page is loaded
      Sleep  10
      AppiumLibrary.Wait Until Page Contains     Stories
      #Log To Console    clicking on Share
      AppiumLibrary.Click Element  id=shareText
      Sleep  15
      Set Appium Timeout    1000
      AppiumLibrary.Page Should Contain Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.webkit.WebView    
      Sleep  2
  