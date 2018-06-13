*** Settings ***
Library  Selenium2Library
Resource  ../Common.robot
Library  String

*** Variables ***
${EpListEntitlementsPageTitle} =  xpath=//span[@id='TitleDetail']
${EpListEntitlementsPageVersion} =  xpath=//table[@id='Activatable_Items_Results_Table']/tbody/tr/td[7]
${EpListEntitlementsPageAvailableCount} =  xpath=//table[@id='Activatable_Items_Results_Table']/tbody/tr/td[8]
${EpListEntitlementsTotalCount} =  xpath=//table[@id='Activatable_Items_Results_Table']/tbody/tr/td[9]
${EpListEntitlementsExpirationDate} =  xpath=//table[@id='Activatable_Items_Results_Table']/tbody/tr/td[10]
${EpListEntitlementsAdvancedSearchButton} =  xpath=//a[contains(text(),'Advanced Search')]
${EpListEntitlementsAdvancedSearchWinoActIDCategory} =  xpath=//select[@name='activationIdSearchQualifier']
${EpListEntitlementsAdvancedSearchWinoEntIDCategory} =  xpath=//select[@name='entitlementIdSearchQualifier']
${EpListEntitlementsAdvancedSearchWinActIDInputField} =  xpath=//input[@name='activationId']
${EpListEntitlementsAdvancedSearchWinEntIDInputField} =  xpath=//input[@name='entitlementId']
${EpListEntitlementsAdvancedSearchSearchButton} =        xpath=//a[contains(text(),'Search')]


*** Keywords ***

Check Nivagated to List Entitlements Page


    ${actualText} =  get text    ${EpListEntitlementsPageTitle}
    ${expectedText} =  set variable  List Entitlements
    should be equal  ${actualText}    ${expectedText}  msg=list entitlement page is not loaded

Check Activation ID in List Entitlement Page
    [Arguments]   ${ActivationID}
    ${Message} =    catenate  Activation   ${ActivationID}  not found oin list entitlement page
    wait until page contains element  xpath=//table[@id='Activatable_Items_Results_Table']/tbody/tr/td/a[contains(text(), ${ActivationID})]
    element should be visible  xpath=//table[@id='Activatable_Items_Results_Table']/tbody/tr/td/a[contains(text(), ${ActivationID})]    messaage=${Message}

Check Entitlement ID in List Entitlement Page
    [Arguments]   ${EntitlementID}
    ${Message} =    catenate  Entitlement   ${EntitlementID}  not found oin list entitlement page
    element should be visible   xpath=//table[@id='Activatable_Items_Results_Table']/tbody/tr/td[contains(text(),${EntitlementID})]   messaage=${Message}


check Sold To in List Entitlement Page
    [Arguments]   ${SoldToID}
     ${Message} =    catenate  SoldToID   ${SoldToID}  not found oin list entitlement page
     ${ActualString} =  get text  xpath=//table[@id='Activatable_Items_Results_Table']/tbody/tr/td[5]
     should contain  ${ActualString}  ${SoldToID}

check product in List Entitlement Page
    [Arguments]  ${ProductName}
    ${ActualProduct} =  get text  xpath=//table[@id='Activatable_Items_Results_Table']/tbody/tr/td/div[@id='prodName0']
    should be equal    ${ActualProduct}    ${ProductName}

check product version in List Entitlement Page
    [Arguments]   ${ProductVersion}
    ${ActualVersion} =  get text   ${EpListEntitlementsPageVersion}
    should be equal  ${ProductVersion}  ${ActualVersion}

check available count in List Entitlement page
    [Arguments]   ${AvailableCount}
    ${ActualAvailableCount} =  get text  ${EpListEntitlementsPageAvailableCount}
    should be equal  ${AvailableCount}   ${ActualAvailableCount}

check total count in list Entitlement page
    [Arguments]  ${TotalCount}
    ${ActualTotalAvialableCount} =  get text  ${EpListEntitlementsTotalCount}
    should be equal   ${ActualTotalAvialableCount}   ${TotalCount}

check expiration date in list Entitlement page
    [Arguments]   ${expirationDate}
    ${ActualExpirationDate} =  get text  ${EpListEntitlementsExpirationDate}
    should be equal  ${expirationDate}   ${ActualExpirationDate}

click on advance search button
    click link  ${EpListEntitlementsAdvancedSearchButton}

switch to advanced search window
    sleep  10s
    select window   name=advsearchwin

#Select ActID details in Advanced search page
#    [Arguments]  ${SearchCategoryActID}  ${ActID}
#    wait until page contains element  ${EpListEntitlementsAdvancedSearchWinoActIDCategory}
#    select from list by label  ${EpListEntitlementsAdvancedSearchWinoActIDCategory}   ${SearchCategoryActID}
#    input text  ${EpListEntitlementsAdvancedSearchWinActIDInputField}  ${ActID}

Enter EntID details in Advanced search page
    [Arguments]  ${EntID}
    wait until page contains element  ${EntID}
    input text  ${EpListEntitlementsAdvancedSearchWinEntIDInputField}  ${EntID}

Select Search category of Ent Id on Acvanced Search
    [Arguments]  ${EntCat}
    wait until page contains element  ${EpListEntitlementsAdvancedSearchWinoEntIDCategory}
    select from list by label  ${EpListEntitlementsAdvancedSearchWinoEntIDCategory}   ${EntCat}


Enter ActID details in Advanced search page
    [Arguments]  ${ActID}
    wait until page contains element  ${EpListEntitlementsAdvancedSearchWinActIDInputField}
    input text  ${EpListEntitlementsAdvancedSearchWinActIDInputField}  ${ActID}

Select Search Category for Act in Advanced Search
    [Arguments]  ${EntCat}
    wait until page contains element  ${EpListEntitlementsAdvancedSearchWinoActIDCategory}
    select from list by label  ${EpListEntitlementsAdvancedSearchWinoActIDCategory}  ${EntCat}


click on search button in advanced search button
    click link  ${EpListEntitlementsAdvancedSearchSearchButton}









