*** Settings ***
Library  Selenium2Library
Resource  ../Common.robot


*** Variables ***
${EpLoginPageUserName} =  xpath=.//input[@id='username']
${EpLoginPagePassword} =  xpath=.//input[@id='passwordInput']
${EpLoginSubmitButton} =    xpath=.//input[@value='Log in']


*** Keywords ***

Navigate to EP Login Page
     ${LoginUrl} =  catenate  SEPARATOR=   ${BASEURLPP.${ENV}}    ${LoginPageEP}
     go to  ${LoginUrl}

Enter credentials in EP
    [Arguments]    ${username}  ${password}
    run keyword unless  '${userName}' == ${None}     input text  ${EPLOGINPAGEUSERNAME}  ${userName}
    run keyword unless  '${password}' == ${None}     input text  ${EPLOGINPAGEPASSWORD}  ${password}

Click On Login Button
    click element  ${EpLoginSubmitButton}


Login To EP
    [Arguments]   ${userName}  ${password}
    Navigate to EP Login Page
    Enter credentials in EP   ${userName}  ${password}
    click on login button

