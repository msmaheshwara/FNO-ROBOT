*** Settings ***
Library    Selenium2Library

*** Variables ***
${EPListAccountPageSearchCategory} =           xpath=//select[@name='searchCategory']
${EPListAccountPageSearchType} =               xpath=//select[@name='searchQualifier']
${EPListAccountPageSearchPhrase} =             xpath=//input[@name='searchPhrase']


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

