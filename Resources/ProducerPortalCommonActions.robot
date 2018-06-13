*** Settings ***
Resource   PO/LoginPage.robot





*** Keywords ***

Login With Valid Credentials
   [Arguments]   ${data}
   LoginPage.Login To Application   ${data}
