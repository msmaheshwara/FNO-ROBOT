*** Settings ***
Library    Selenium2Library




*** Variables ***
${EpCreateAccountPageAccountId} =  xpath=//input[@name='organizationName']
${EpCreateAccountPageAccountName} =  xpath=//input[@name='displayName']
${EpCreateAccountPageSaveButton} =  xpath=//a[@id='CreateLG_Save']
${EpCreateAccountPageCountry} =  xpath=//select[@name='country']
${EpCreateAccountPageMessage} =  xpath=//div[@role='alert']/span[1]/following::p[1]
*** Keywords ***

Enter Account ID
    [Arguments]  ${AccountId}
    input text  ${EpCreateAccountPageAccountId}  ${AccountId}

Enter Account Name
    [Arguments]  ${AccountName}
    input text  ${EpCreateAccountPageAccountName}   ${AccountName}

Click on Save Button
    click link  ${EPCREATEACCOUNTPAGESAVEBUTTON}

Get Country List
    ${countryList} =  get list items  ${EpCreateAccountPageCountry}
    [Return]   ${countryList}

Get Actual Message
    ${ActualMesage} =  get text  ${EpCreateAccountPageMessage}
    [Return]   ${ActualMesage}