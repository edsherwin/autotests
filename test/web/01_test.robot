*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${SELENOID_URL}   http://172.25.186.29:4444/wd/hub

*** Test Cases ***
Open Google and Search Robot Framework
    Open Browser Testing    https://www.google.com    ${BROWSER}
    Input Text      name=q    Robot Framework
    Press Keys       name=q    \\\\13  # Simulate Enter key press
    Wait Until Page Contains    Robot Framework
    Capture Page Screenshot
    Close Browser

*** Keywords ***
Open Browser Testing
    [Arguments]     ${url}      ${browser}
    Open Browser    ${url}      browser=${browser}    remote_url=${SELENOID_URL}

Capture Page Screenshot
    Capture Page Screenshot