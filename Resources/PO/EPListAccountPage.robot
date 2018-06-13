*** Settings ***
Library  Selenium2Library
Resource  ../Common.robot

*** Variables ***
${EPListAccountPageSearchCategory} =           xpath=//select[@name='searchCategory']
${EPListAccountPageSearchType} =               xpath=//select[@name='searchQualifier']
${EPListAccountPageSearchPhrase} =             xpath=//input[@name='searchPhrase']
${EPListAccountPageSearchButton} =             xpath=//input[@name='searchPhrase']/following::a[1]
${EPListAccountPageActionsButton} =            xpath=//span[text()='Actions']
${EPListAccountPageCreateSubAccountButton} =   xpath=//a[contains(text(),'Create sub-account')]
${EPListAccountPageDeleteAccountButton} =      xpath=//a[contains(text(),'Delete account')]
${EPListAccountPageMessage} =                  xpath=//div[@role='alert']/p[1]


*** Keywords ***

Select Search Crategory
    [Arguments]    ${Crategory}
    wait until element is visible   ${EPListAccountPageSearchCategory}
    select from list by label   ${EPListAccountPageSearchCategory}     ${Crategory}

Select Search Qualifier
    [Arguments]   ${Qualifier}
    wait until element is visible   ${EPListAccountPageSearchType}
    select from list    ${EPListAccountPageSearchType}   ${Qualifier}

Enter Search Phrase
    [Arguments]    ${SearchPhrase}
    wait until element is visible   ${EPListAccountPageSearchPhrase}
    input text  ${EPListAccountPageSearchPhrase}   ${SearchPhrase}

Click on Search Button
    #wait until element is visible  ${EPListAccountPageSearchButton}
    run keyword and ignore error  click element   ${EPListAccountPageSearchButton}

Select check box of searched Organization
    [Arguments]   ${AccountID}
    select checkbox   xpath=//*[contains(text(),'${AccountID}')]/preceding::input[1]


Click On Create Sub Organization Button
    mouse over  ${EPListAccountPageActionsButton}
    wait until page contains element  ${EPListAccountPageCreateSubAccountButton}
    click link  ${EPListAccountPageCreateSubAccountButton}

Delete Account
    [Arguments]   ${AccountId}
    mouse over  ${EPListAccountPageActionsButton}
    wait until page contains element   ${EPListAccountPageDeleteAccountButton}
    click link  ${EPListAccountPageDeleteAccountButton}
    ${actualMessgae} =  get alert message
    ${expectedString} =  set variable  Are you sure you want to delete these items?
    SHOULD BE EQUAL AS STRINGS   ${actualMessgae}  ${expectedString}
    choose ok on next confirmation
    ${ActualMessage} =  get text  ${EPListAccountPageMessage}
    ${ExpectedMessage} =  catenate  Accounts   ${AccountId}  deleted successfully.
    should be equal  ${ActualMessage}  ${ExpectedMessage}











