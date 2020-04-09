*** Settings ***
Library    AppiumLibrary






*** Variables ***
${User1}    Koda
${i}        0


${animal}   whale

@{animals}    dog    cat    snake





&{usercred}    Username=Koda    Password=123456


*** Test Cases **
TC1
    Log To Console    Hello ${User1}
    Should Be Equal As Strings    ${User1}    Koda    
    Should Not Be Equal As Strings    @animals[0]    @animals[1]
    Should Not Be Equal As Strings    &{usercred}[Username]    &{usercred}[Password]
TC2
        Log to Console    Meow
          
TC3
    :FOR  ${animal}  IN  zcat  zdog  zcow
    \   log to console  ${animal}
   
TC4
    :FOR  ${i}   IN  1 2 3 4 5 6 7 8 9 10
    \    log to console  ${i}

TC5
    FOR  ${i}   IN RANGE  1  10
      log to console  ${i}
    END
    
TC6
#FOR LOOP WITY LIST   
    @{items}    create list  1 2 3 4 5 
    FOR  ${i}   IN   @{items}
      log to console  ${i}
    END
    
TC7
#FOR LOOP exit  
     FOR  ${z}   IN RANGE  100
       log to console  ${z}
       Exit For Loop If  ${z} == 5
     END