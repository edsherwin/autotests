*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SELENIUM_URL}   http://localhost:4444/wd/hub
${BROWSER}        chrome  # or 'firefox' depending on your needs

*** Test Cases ***
Open Google and Search
    [Tags]    Smoke
    Open Browser    ${SELENIUM_URL}    browser=${BROWSER}
    Go To           https://www.google.com
    Input Text      name=q    Robot Framework
    Press Keys      name=q    \\13  # Pressing ENTER key
    Wait Until Page Contains    Robot Framework
    Page Should Contain Element    css=#search
    Close Browser

Open Bing and Search
    [Tags]    Smoke
    Open Browser    ${SELENIUM_URL}    browser=${BROWSER}
    Go To           https://www.bing.com
    Input Text      name=q    Robot Framework
    Press Keys      name=q    \\13  # Pressing ENTER key
    Wait Until Page Contains    Robot Framework
    Page Should Contain Element    css=#b_results
    Close Browser

Open Browser Test
    [Timeout]    5s
    Open Browser    https://www.example.com    chrome
    Maximize Browser Window
    Sleep           5s
    Close Browser

