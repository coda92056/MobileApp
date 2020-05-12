*** Settings ***
Resource    ../Resources/PO/LaunchApp.robot
Resource    ../Resources/PO/Signup.robot
Resource    ../Resources/PO/Signin.robot 
Resource    ../Resources/PO/Home.robot



#date 031320  Marcos

*** Keywords ***
Launch_App
   LaunchApp.Load
Sign_up
   Signup.SignupPage
Sign_in
   Signin.SigninPage
Enter Sign_up_credentials
   Signup.EnterCreds
   
Valid_user_sign_in
   Signin.Login
Select_Campaign
   Home.ScrollHome
   
Start_New_Campaign
   Home.StartCampaign
   
Start_New_Donation
   Home.StartDonation

Share
    Home.ShareCampaign
    

Start_a_Campaign 
    Home.StartCampaign 
    
Log_Out
    Home.SignOut
