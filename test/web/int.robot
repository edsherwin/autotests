*** Settings ***
Library           SeleniumLibrary
# Test Setup        Browser

*** Variables ***
${BROWSER}        chrome
${URL}            https://www.google.com

*** Test Cases ***
Open Browser and Verify Title
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    Google
    Close Browser
