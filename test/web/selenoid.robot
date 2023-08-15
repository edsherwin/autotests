*** Settings ***
Library       SeleniumLibrary

# *** Variables ***
# &{DESIRED_CAPABILITIES}    name=browserTest    enableVideo=${True}

*** Variables ***
${SELENOID_URL}   http://10.0.0.25:8080/wd/hub
${BROWSER_NAME}   chrome
${BROWSER_VERSION}   92.0
${PLATFORM}       LINUX

*** Test Cases ***
# Issue554
#     Open Browser     https://tut.by    Chrome    remote_url=http://localhost:4444/wd/hub    desired_capabilities=${DESIRED_CAPABILITIES}
#     Sleep    30


*** Test Cases ***
Execute Tests in Selenoid
    [Documentation]   Execute automation tests in Selenoid environment
    ${selenoid_caps}=   Create Dictionary   browserName=${BROWSER_NAME}   version=${BROWSER_VERSION}   platform=${PLATFORM}
    Open Browser   about:blank   remote_url=${SELENOID_URL}   desired_capabilities=${selenoid_caps}
    Go To   https://www.example.com
    Title Should Be   Example Domain
    Close Browser

*** Keywords ***
Title Should Be
    [Arguments]   ${expected_title}
    Wait Until Page Contains   ${expected_title}