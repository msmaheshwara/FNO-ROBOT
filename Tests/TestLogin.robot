*** Settings ***
Resource  ../Resources/Common.robot
Suite Setup  Common.Begin Web Test
Suite Teardown  Common.End Web Test
Resource  ../Resources/ProducerPortalCommonActions.robot

*** Test Cases ***

Verify Login With Valid Credentials PP
   ${data} =  create dictionary   path=${PathToBasicData}   testCaseName=PP_Default_Credentials
   Login With Valid Credentials   ${data}
   log variables




