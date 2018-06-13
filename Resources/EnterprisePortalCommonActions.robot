*** Settings ***
Resource   PO/EpLoginPage.robot
Resource   PO/HomePageEp.robot
Resource   PO/EPListAccountPage.robot
Resource   PO/EpCreateAccountPage.robot
Resource   PO/EPSearchEntityInAnyPage.robot
Resource  PO/EpListEntitlementsPage.robot


*** Keywords ***
Login With Valid Credentials EP
    [Arguments]    ${userName}  ${password}
    Login To EP     ${userName}  ${password}
    Verify Login To Ep


Navigate to List Accounts Page
    Mouse over on Accounts And Users
    click on list accounts page

Navigate to List Entitlements Page
    HomePageEp.Click on List Entitlements Link
    check nivagated to list entitlements page





Search with parameters
   [Arguments]   ${SearchPhrase}   ${category}  ${Qualifier}
   [Documentation]    Searchphrase= search paramter you want to use
   ...                Category= what you want to search
   ...                Qalifier= Search type ex starts with ends with etc...
   log   ${category}
   run keyword if   '${category}' != 'NA'    EPSearchEntityInAnyPage.Select Search Crategory      ${category}
   run keyword if  '${Qualifier}' != 'NA'  EPSearchEntityInAnyPage.Select Search Qualifier      ${Qualifier}
   EPSearchEntityInAnyPage.Enter Search Phrase   ${SearchPhrase}
   EPSearchEntityInAnyPage.Click on Search Button


Validate data in list Entitlement Page
    [Arguments]   ${EntitlementID}  ${ActivationID}  ${SoldToID}  ${Product}  ${productVersion}  ${AvaibleCount}  ${TotalCount}  ${Expiration}
    run keyword if  '${EntitlementID}' != 'NA'   Check Entitlement ID in List Entitlement Page   ${EntitlementID}
    run keyword if  '${ActivationID}' != 'NA'    Check Activation ID in List Entitlement Page    ${ActivationID}
    run keyword if  '${SoldToID}' != 'NA'     check Sold To in List Entitlement Page             ${SoldToID}
    run keyword if   '${Product}' != 'NA'                check product in List Entitlement Page  ${Product}
    run keyword if   '${productVersion}' != 'NA'   check product version in List Entitlement Page  ${productVersion}
    run keyword if   '${AvaibleCount}' != 'NA'   check available count in List Entitlement page  ${AvaibleCount}
    run keyword if   '${TotalCount}' != 'NA'     check total count in list Entitlement page      ${TotalCount}
    run keyword if   '${Expiration}' != 'NA'  check expiration date in list Entitlement page   ${Expiration}


Navigate to Create Sub Account Page
    [Arguments]     ${AccountName}
    Select check box of searched Organization   ${AccountName}
    Click On Create Sub Organization Button

Create Account from EP
    [Arguments]   ${AccountId}  ${AccountName}
    Enter Account ID  ${AccountId}
    Enter Account Name  ${AccountName}
    EpCreateAccountPage.Click on Save Button
    ${ActualMessage} =  Get Actual Message
    ${ExpectedMessage} =  catenate   Account   ${AccountId}   successfully added.
    ${FailureMessage} =   set variable   Account creation message did not match
    should be equal as strings   ${ActualMessage}  ${ExpectedMessage}  msg=${FailureMessage}

Compare Country Drop Down in Create Account Page EP
    ${actualListOfCountry} =   EpCreateAccountPage.Get Country List
    log  ${actualListOfCountry}
    ${expectedListOfCountry} =  create list  Afghanistan  Aland Islands  Albania  Algeria  American Samoa  Andorra  Angola  Anguilla  Antarctica  Antigua and Barbuda  Argentina  Armenia  Aruba  Australia  Austria  Azerbaijan  Bahamas  Bahrain  Bangladesh  Barbados  Belarus  Belgium  Belize  Benin  Bermuda  Bhutan  Bolivia  Bonaire, Sint Eustatius, and Saba  Bosnia and Herzegovina  Botswana  Bouvet Island  Brazil  British Indian Ocean Territory  British Virgin Islands  Brunei  Bulgaria  Burkina Faso  Burundi  Cambodia  Cameroon  Canada  Cape Verde  Cayman Islands  Central African Republic  Chad  Chile  China  Christmas Island  Cocos Islands  Colombia  Comoros  Congo  Congo, Democratic Republic of  Cook Islands  Costa Rica  Croatia  Cuba  Curacao  Cyprus  Czech Republic  Denmark  Djibouti  Dominica  Dominican Republic  East Timor  Ecuador  Egypt  El Salvador  Equatorial Guinea  Eritrea  Estonia  Ethiopia  Falkland Islands  Faroe Islands  Fiji  Finland  France  French Guiana  French Polynesia  French Southern Territories  Gabon  Gambia  Georgia  Germany  Ghana  Gibraltar  Greece  Greenland  Grenada  Guadeloupe  Guam  Guatemala  Guernsey  Guinea  Guinea-Bissau  Guyana  Haiti  Heard and McDonald Islands  Honduras  Hong Kong  Hungary  Iceland  India  Indonesia  Iran  Iraq  Ireland  Isle of Man  Israel  Italy  Ivory Coast  Jamaica  Japan  Jersey  Jordan  Kazakhstan  Kenya  Kiribati  Kosovo (User-defined XK)  Kuwait  Kyrgyzstan  Laos  Latvia  Lebanon  Lesotho  Liberia  Libya  Liechtenstein  Lithuania  Luxembourg  Macau  Macedonia  Madagascar  Malawi  Malaysia  Maldives  Mali  Malta  Marshall Islands  Martinique  Mauritania  Mauritius  Mayotte  Mexico  Micronesia  Moldova  Monaco  Mongolia  Montenegro  Montserrat  Morocco  Mozambique  Myanmar  Namibia  Nauru  Nepal  Netherlands  Netherlands Antilles  New Caledonia  New Zealand  Nicaragua  Niger  Nigeria  Niue  Norfolk Island  North Korea  Northern Mariana Islands  Norway  Oman  Pakistan  Palau  Palestine, State of  Panama  Papua New Guinea  Paraguay  Peru  Philippines  Pitcairn Island  Poland  Portugal  Puerto Rico  Qatar  Reunion  Romania  Russia  Rwanda  Samoa  San Marino  Sao Tome and Principe  Saudi Arabia  Senegal  Serbia  Serbia and Montenegro  Seychelles  Sierra Leone  Singapore  Sint Maarten (Dutch)  Slovakia  Slovenia  Solomon Islands  Somalia  South Africa  South Georgia and S. Sandwich Islands  South Korea  South Sudan  Spain  Sri Lanka  St. Barthelemy  St. Helena  St. Kitts and Nevis  St. Lucia  St. Martin (French)  St. Pierre and Miquelon  St. Vincent and the Grenadines  Sudan  Suriname  Svalbard and Jan Mayen Islands  Swaziland  Sweden  Switzerland  Syria  Taiwan  Tajikistan  Tanzania  Thailand  Timor-Leste  Togo  Tokelau  Tonga  Trinidad and Tobago  Tunisia  Turkey  Turkmenistan  Turks and Caicos Islands  Tuvalu  U.S. Minor Outlying Islands  U.S. Virgin Islands  Uganda  Ukraine  United Arab Emirates  United Kingdom  United States  Unspecified  Uruguay  Uzbekistan  Vanuatu  Vatican City  Venezuela  Vietnam  Wallis and Futuna Islands  Western Sahara  Yemen  Zambia  Zimbabwe
    ${len} =  get length  ${actualListOfCountry}
    log  ${len}
    ${len} =  get length  ${expectedListOfCountry}
    log  ${len}
    lists should be equal   ${expectedListOfCountry}   ${actualListOfCountry}  case_insensitive=False  whitespace_insensitive=False


Advanced search in list Entitlement page
    [Arguments]  ${EntID}  ${EntCat}  ${ActId}  ${ActCat}

    click on advance search button
    switch to advanced search window
    run keyword if  '${EntCat}' != 'NA'  Select Search category of Ent Id on Acvanced Search  ${EntCat}
    run keyword if  '${EntID}' != 'NA'   Enter EntID details in Advanced search page  ${EntID}
    run keyword if  '${ActCat}' != 'NA'   Select Search Category for Act in Advanced Search  ${ActCat}
    run keyword if   '${ActId}' != 'NA'   Enter ActID details in Advanced search page  ${ActId}
    click on search button in advanced search button
    switch to window








