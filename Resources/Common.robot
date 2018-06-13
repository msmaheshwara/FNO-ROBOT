*** Settings ***
Library  Selenium2Library   run_on_failure=none
Library  OperatingSystem
Library  RequestsLibrary
Library  Collections
*** Variables ***


#Environment selected to run tests
${ENV}  UAT
#Urls


#BAse URL of QA CI and UAT
&{BASEURLPP} =       QA=http://flexera1000-fnoqa1.isys.intraware.com  UAT=https://flex1233-fno-uat.flexnetoperations.com  CI=http://se02-fno-ci.isys.intraware.com

#Relative URL of Login Page PP
${LoginPagePP} =     /flexnet/operations/logon.do

#Relative Url to Login Page EP
${LoginPageEP} =  /flexnet/operationsportal/logon.do

#Browser Type
${BrowserType} =     Chrome

#Default user name to login from PP
${UserNamePP} =  ashyam@flexerasoftware.com

#Default password to login from PP
${password} =  Flexera1

#JSON File path
${PathToBasicData} =      Resources/Data/BasicData.json
${PathToTestDataEp} =     Resources/Data/TestDataEp.json



*** Keywords ***


Begin Web Test
    OPEN BROWSER   about:blank  ${BrowserType}
    set selenium timeout  80s

End Web Test
     close all browsers

Take Screen Shot On Failure
    ${timestamp} =  get time   epoch
    ${filename1} =  catenate  SEPARATOR=  ${TEST_NAME}  ${timestamp}  .png

    Run Keyword If Test Failed    Selenium2Library.Capture Page Screenshot   filename=${filename1}

Get Parent Window ID
    ${parentId} =  get window identifiers
    [Return]     ${parentId}


Switch to Window
    select window




Read Data From Json File
    [Arguments]     ${path}   ${testCaseName}
    ${data} =  Get Binary File   ${path}
    ${JsonData} =    To Json  ${data}
    #log  ${JsonData}
    ${dictdata} =  convert to dictionary  ${JsonData}
    ${Testdata} =  get from dictionary   ${dictdata}    ${testCaseName}
    LOG     ${Testdata}
    [Return]    ${Testdata}











