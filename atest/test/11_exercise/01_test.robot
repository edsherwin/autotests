*** Settings ***
Library    Browser

*** Test Cases ***
Open Google and Search
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       https://marketsquare.github.io/robotframework-browser/Browser.html
    Get Title      ==    Browser
    Get Text    a[class='libdoc-title'] h1    ==    Browser
    Close Browser

Verify Title and URL
    Open Browser    https://www.robotframework.org    firefox
    Set Browser Implicit Wait    5 seconds
    ${title}=    Get Title
    Should Contain    ${title}    Robot Framework
    ${url}=    Get Location
    Should Contain    ${url}    robotframework
    Capture Page Screenshot
    Close Browser

Click Element and Verify Text
    Open Browser    https://www.example.com    edge
    Set Browser Implicit Wait    5 seconds
    Click Element    xpath://a[@id='link']
    Wait Until Element Is Visible    xpath://h1[contains(text(),'Example Domain')]
    ${text}=    Get Text    xpath://h1[contains(text(),'Example Domain')]
    Should Be Equal    ${text}    Example Domain
    Capture Page Screenshot
    Close Browser
