*** Settings ***
Library           SeleniumLibrary

*** Variables ***
# ${BROWSER}        chrome
# ${URL}            https://www.example.com

# *** Test Cases ***
# Open Browser and Verify Title
#     Open Browser    ${URL}    ${BROWSER}
#     Title Should Be    Example Domain
#     Close Browser

# *** Variables ***
${BROWSER}        chrome
${URL}            https://www.example.com
${SELENOID_URL}   http://localhost:8081/wd/hub

*** Test Cases ***
Open Browser and Verify Title
    Open Browser    ${URL}    ${BROWSER}    remote_url=${SELENOID_URL}
    Title Should Be    Example Domain
    Close Browser
