*** Settings ***
Library  Selenium2Library
Resource  ../Common.robot

*** Variables ***
${LoginPageUserName} =      xpath=//input[@id='username']
${LoginPagePassword} =      xpath=//input[@id='password']
${LoginPageloginButton} =            Log in
${HomePageHeaderLink} =      xpath=//a[@id='Header_Profile_Link']


*** Keywords ***

Navigate To Login Page PP
    ${LoginUrl} =   catenate  SEPARATOR=  ${BASEURLPP.${Env}}     ${LoginPagePP}
    go to  ${LoginUrl}

Enter Credentials PP
    [Arguments]    ${userName}  ${password}
    run keyword unless  '${userName}' == ${None}    input text  ${LoginPageUserName}  ${userName}
    run keyword unless  '${password}' == ${None}    input text  ${LoginPagePassword}  ${password}

Click on Submit to Login
    [Arguments]   ${expectedResult}
    set selenium timeout  40s
    click button   ${LoginPageloginButton}
    wait until page contains element  ${HomePageHeaderLink}
    element should contain   ${HomePageHeaderLink}   ${expectedResult}



Login To Application
    [Arguments]   ${dataLocation}
    Navigate To Login Page PP
    Enter Credentials PP         ${userName}   ${password}
    Click on Submit to Login     ${expectedString}


