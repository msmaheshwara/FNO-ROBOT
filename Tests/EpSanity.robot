*** Settings ***
Resource  ../Resources/EnterprisePortalCommonActions.robot
Resource  ../Resources/Common.robot
Suite Setup  Begin Web Test
Test Teardown  Common.Take Screen Shot On Failure
Suite Teardown  End Web Test



*** Test Cases ***

Creation Of Sub Organization from EP as Portal Admin USer
     [Documentation]  This test will test creation of sub organization in EP
     [Tags]  sanity

     #############################################################################
     ##################Read Data From Json file##################################
     ############################################################################
     ${testdata} =  Read Data From Json File   ${PathToTestDataEp}  ${TEST_NAME}
     ${username} =  get from dictionary  ${testdata}   userName
     ${pasword} =  get from dictionary   ${testdata}   password
     ${category} =  get from dictionary   ${testdata}   category
     ${Qualifier} =  get from dictionary  ${testdata}   Qualifier
     ${SearchPhrase} =  get from dictionary  ${testdata}   SearchPhrase
     ${AccIdTemp} =  get from dictionary  ${testdata}   TestAccountName
     ${AccNameTemp} =  get from dictionary  ${testdata}   TestAccountId
     ${LOG_LEVEL} =  set variable  DEBUG


     ########################Stesps to execute Test##############################
     Login With Valid Credentials EP   ${username}  ${pasword}
     Navigate to List Accounts Page
     Search with parameters    ${SearchPhrase}   ${category}   ${Qualifier}
     Navigate to Create Sub Account Page   ${SearchPhrase}
     ${TS} =   get time  epoch
     ${AccId} =  catenate  SEPARATOR=   ${AccIdTemp}  ${TS}
     ${AccName} =  catenate  SEPARATOR=   ${AccNameTemp}  ${TS}
     Create Account from EP   ${AccId}   ${AccName}
     #############################################################################


Delete Sub Account From EP
    [Documentation]   This test will check whether user can able to delete sub account from EP or not
    [Tags]    sanity
     #############################################################################
     ##################Read Data From Json file##################################
     ############################################################################
     ${testdata} =  Read Data From Json File   ${PathToTestDataEp}  ${TEST_NAME}
     ${username} =  get from dictionary  ${testdata}   userName
     ${pasword} =  get from dictionary   ${testdata}   password
     ${category} =  get from dictionary   ${testdata}   category
     ${Qualifier} =  get from dictionary  ${testdata}   Qualifier
     ${SearchPhrase} =  get from dictionary  ${testdata}   SearchPhrase
     ${AccIdTemp} =  get from dictionary  ${testdata}   TestAccountId
     ${AccNameTemp} =  get from dictionary  ${testdata}   TestAccountName


     ########################Stesps to execute Test##############################
     Login With Valid Credentials EP   ${username}  ${pasword}
     Navigate to List Accounts Page
     Search Account with parameters    ${SearchPhrase}   ${category}   ${Qualifier}
     Navigate to Create Sub Account Page   ${SearchPhrase}
     ${TS} =   get time  epoch
     ${AccId} =  catenate  SEPARATOR=   ${AccIdTemp}  ${TS}
     ${AccName} =  catenate  SEPARATOR=   ${AccNameTemp}  ${TS}
     Create Account from EP   ${AccId}   ${AccName}
     Navigate to List Accounts Page
     Search Account with parameters    ${AccId}  ${category}   ${Qualifier}
     Select check box of searched Organization   ${AccId}
     Delete Account  ${AccId}

     #############################################################################


Search Activation ID using Entitlement ID in EP
    [Documentation]  This will test whether user can search Activation ID using Entitlement ID
    ...   Steps to execute
    ...   Login to EP  and Navigate to List Entitlement Page and search for Activation ID using Entitlement ID and validate all details
    [Tags]    sanity
     #############################################################################
     ##################Read Data From Json file##################################
     ############################################################################
     ${testdata} =  Read Data From Json File   ${PathToTestDataEp}  ${TEST_NAME}
     ${username} =  get from dictionary  ${testdata}   userName
     ${pasword} =  get from dictionary   ${testdata}   password
     ${EntitlementId} =   get from dictionary  ${testdata}   EntitlementId
     ${ActivationID} =  get from dictionary  ${testdata}   ActivationID
     ${SoldTo} =  get from dictionary   ${testdata}  SoldTo
     ${SoldToType} =  get from dictionary  ${testdata}  SoldToType
     ${Product} =  get from dictionary  ${testdata}    Product
     ${Version} =  get from dictionary  ${testdata}   Version
     ${AvialableCount} =  get from dictionary  ${testdata}  AvialableCount
     ${TotalCount} =   get from dictionary   ${testdata}   TotalCount
     ${ExpirationDate} =  get from dictionary  ${testdata}   ExpirationDate


     ########################Stesps to execute Test##############################

     Login With Valid Credentials EP  ${username}   ${pasword}
     Navigate to List Entitlements Page
     Search with parameters    ${EntitlementId}  Entitlement ID   Equals
     Validate data in list Entitlement Page   ${EntitlementId}    ${ActivationID}   ${SoldTo}  ${Product}  ${Version}  ${AvialableCount}  ${TotalCount}  ${ExpirationDate}



Advanced Search using Activation ID
    [Documentation]  This will test whether user can search Activation ID advanced search option
     ...   Steps to execute
     ...   Login to EP  and Navigate to List Entitlement Page and search for Activation ID from advanced search option

    [Tags]    sanity

     #############################################################################
     ##################Read Data From Json file##################################
     ############################################################################
     ${testdata} =  Read Data From Json File   ${PathToTestDataEp}  ${TEST_NAME}
     ${username} =  get from dictionary  ${testdata}   userName
     ${pasword} =  get from dictionary   ${testdata}   password
     ${EntitlementId} =   get from dictionary  ${testdata}   EntitlementId
     ${ActivationID} =  get from dictionary  ${testdata}   ActivationID
     ${SoldTo} =  get from dictionary   ${testdata}  SoldTo
     ${SoldToType} =  get from dictionary  ${testdata}  SoldToType
     ${Product} =  get from dictionary  ${testdata}    Product
     ${Version} =  get from dictionary  ${testdata}   Version
     ${AvialableCount} =  get from dictionary  ${testdata}  AvialableCount
     ${TotalCount} =   get from dictionary   ${testdata}   TotalCount
     ${ExpirationDate} =  get from dictionary  ${testdata}   ExpirationDate


     ########################Stesps to execute Test##############################

     Login With Valid Credentials EP  ${username}   ${pasword}
     Navigate to List Entitlements Page
     Advanced search in list Entitlement page  NA  NA  ${ActivationID}  Equals
     Validate data in list Entitlement Page   ${EntitlementId}    ${ActivationID}   ${SoldTo}  ${Product}  ${Version}  ${AvialableCount}  ${TotalCount}  ${ExpirationDate}



















