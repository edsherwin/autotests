*** Settings ***
Documentation   Sample Robot Framework Test Suite with Selenoid
Library    SeleniumLibrary
Library    OperatingSystem
Test Setup      Open Browser

*** Variables ***
${BROWSER}              chrome
${BROWSER_VERSION}      latest
${SELENOID_URL}         http://localhost:4444/wd/hub

*** Test Cases ***
Example Test Case
    [Tags]    Example
    Open Test Page
    Title Should Be    Robot Framework Test Page
    Element Should Be Visible    //h1[text()='Welcome to Robot Framework']

*** Keywords ***
Open Browser
    [Documentation]    Open the browser with the specified capabilities (using Selenoid)
    Open Browser    about:blank    ${BROWSER}    version=${BROWSER_VERSION}    remote_url=${SELENOID_URL}
