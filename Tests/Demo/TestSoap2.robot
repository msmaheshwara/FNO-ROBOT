*** Settings ***

Library  SudsLibrary
Library  XML
Library  OperatingSystem
Library  RequestsLibrary
Library  Collections
Library           robot.libraries.DateTime




*** Test Cases ***

Sample soap test


    set log level  DEBUG
   log variables
  Get Current Date
    Create Soap Client  https://fno-uat1.isys.intraware.com/flexnet/services/UserOrgHierarchyService?wsdl

   Set Http Authentication  1000admin  admin  type=ALWAYS_SEND

    ${organizationDataType} =    create wsdl object  organizationDataType
    log  ${organizationDataType}
    ${organizationDataType.name}  set variable  ORGMAY0542
    ${organizationDataType.displayName}  set variable  ORGMAY0542

    ${organizationDataType.orgType}  set variable  CUSTOMER




    ${result} =  run keyword and ignore error  call soap method  createOrganization  ${organizationDataType}

    ${soap_response}    Get Last Received
    Log    ${soap_response}
   # ${root} =     Parse XML      ${soap_response.createOrgResponse}
    #Log    ${root}
    #Should Be Equal  ${root.tag}    createOrgResponse


    ${reply1} =  set variable  ${result[1]}

    ${var1} =  set variable  ${reply1.statusInfo}
    ${status} =   Get Wsdl Object Attribute   ${var1}   status
    log  ${status}
