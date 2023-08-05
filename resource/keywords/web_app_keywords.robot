*** Settings ***

Documentation   Importing web and robotframework built-in keywords.
Library  SeleniumLibrary   timeout=10
Library    Collections
Library    OperatingSystem
Library    FakerLibrary
Variables         ../../resource/settings/const.py
Resource        ../../resource/settings/page_objects.robot
*** Variables ***
${BROWSER}        chrome
${DELAY}          0.5
${SELENOID_SERVER}    http://127.0.0.1:4444/wd/hub

*** Keywords ***
Open Browser to Page
    [Documentation]
    ${desired_caps} =   create dictionary  enableVNC=${True}
    Open Browser    ${PAGE_URL}    ${BROWSER}    None    remote_url=${SELENOID_SERVER}    desired_capabilities=${desired_caps}

    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

search googl.com for ${search term}
    [Documentation]
    Wait Until Page Contains Element    ${google search field}
    Input Text    ${google search field}   ${search term}
    Wait Until Page Contains Element    ${google search button}
    Click Element     ${google search button}

