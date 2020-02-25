*** Settings ***
Library         SeleniumLibrary
Resource        credentials.robot
*** Test Cases ***
Login op GUW Ketenportaal
    #Run Keyword If  ${PROJECT} == guw
    Run Keyword If
    ...	  "${PROJECT}" == "guw"     Login GUW
    ...	  ELSE IF    "${PROJECT}" == "cpr"        Login CPR
    ...	  ELSE IF    "${PROJECT}" == "oss"        Login OSS

*** Keywords ***
Login GUW
    Open Browser    ${GUW_URL}   Chrome
    Maximize Browser Window
    Input Text      id:input-relatienummer        ${GUW_RELATIENR}
    Input Text      id:input-gebruikersnaam       ${GUW_USERNAME}
    Input Text      id:input-wachtwoord           ${GUW_PASS}
    Click Element   xpath://*[@value="Inloggen"]

Login CPR
    Open Browser    ${CPR_URL}   Chrome
    Maximize Browser Window
    Input Text      id:Ecom_User_ID      ${CPR_USERNAME}
    Input Text      id:Ecom_Password     ${CPR_PASS}
    Click Element   id:loginButton2

Login OSS
    Open Browser    ${OSS_URL}   Chrome
    Maximize Browser Window
    Input Text      id:Ecom_User_ID      ${CPR_USERNAME}
    Input Text      id:Ecom_Password     ${CPR_PASS}
    Click Element   id:loginButton2
