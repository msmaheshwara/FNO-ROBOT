*** Settings ***
Library   Selenium2Library
Resource  ../Common.robot


*** Variables ***
${HomePageEpHomeMenuItem} =             xpath=.//a[text()='Home']
${HomePageEpAccountsUsersMenuItem} =    xpath=.//a[contains(text(),'Accounts & Users')]
${HomePageEpListAccounts} =             xpath=.//a[contains(text(),'List accounts')]
${HomePageEpActivation&Entitlements} =  xpath=//a[contains(text(),'Activation & Entitlements')]
${HomePageEpListEntitlements} =         xpath=//a[contains(text(),'List Entitlements')]


*** Keywords ***


Verify Login To Ep
    wait until page contains element  ${HomePageEpHomeMenuItem}
    element should be visible  ${HomePageEpHomeMenuItem}


Mouse over on Accounts And Users
    mouse over    ${HomePageEpAccountsUsersMenuItem}

Click on List Accounts Page
    wait until element is visible  ${HomePageEpListAccounts}
    click element  ${HomePageEpListAccounts}

Click on List Entitlements Link
    mouse over  ${HomePageEpActivation&Entitlements}
    wait until element is visible   ${HomePageEpListEntitlements}
    click link  ${HomePageEpListEntitlements}






