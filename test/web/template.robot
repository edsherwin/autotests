*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SELENOID_URL}    http://localhost:4444/wd/hub
${BROWSER_NAME}    chrome
${BROWSER_VERSION}    115.0
${PLATFORM}    LINUX


### WORKING SELENOID INTEGRATION ####
*** Test Cases ***
Test 001 - Template
    [Documentation]    This is a template    
    Execute Tests in Selenoid Environment
    Go To   https://www.example.com
    Sleep       30s
    Title Should Be   Example Domain
    Close Browser

*** Keywords ***
Title Should Be
    [Arguments]   ${expected_title}
    Wait Until Page Contains   ${expected_title}

Execute Tests inside Selenoid
    [Documentation]   Execute automation tests in Selenoid environment
    ${selenoid_caps}=   Create Dictionary
    ...       browserName=${BROWSER_NAME}
    ...       version=${BROWSER_VERSION}
    ...       platform=${PLATFORM}
    ...       enableVideo=${True}
    ...       enableVNC=${True}
    Open Browser   about:blank   remote_url=${SELENOID_URL}   desired_capabilities=${selenoid_caps}

Execute Tests in Selenoid
    [Documentation]   Execute automation tests in Selenoid environment
    ${selenoid_caps}=   Create Dictionary   browserName=${BROWSER_NAME}   version=${BROWSER_VERSION}   platform=${PLATFORM}     enableVideo=${True}     enableVNC=${True}
    Open Browser    remote_url=${SELENOID_URL}   desired_capabilities=${selenoid_caps}
    # Go To   https://www.example.com
    # Sleep       30s
    # Title Should Be   Example Domain
    # Close Browser

Execute Tests in Selenoid Environment
    [Documentation]   Run various tests in Selenoid environment
    ${selenoid_caps}=   Create Dictionary   browserName=${BROWSER_NAME}   version=${BROWSER_VERSION}   platform=${PLATFORM}     enableVideo=${True}     enableVNC=${True}
    Open Browser    remote_url=${SELENOID_URL}   desired_capabilities=${selenoid_caps}
    Sleep       30
    Go To   https://www.example.com
    Title Should Be   Example Domain
#    Close Browser

    Go To   https://www.robotframework.org
    Title Should Be   Robot Framework
    Close Browser