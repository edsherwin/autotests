*** Settings ***
Library            SeleniumLibrary
Library            Collections
Library            OperatingSystem

*** Variables ***
${SELENOID_URL}         http://10.0.0.25:4444/wd/hub
${BROWSER_NAME}         chrome
${BROWSER_VERSION}      91.0
${PLATFORM}             LINUX
${SCREEN_RESOLUTION}    2560x1440x24
${PAGE_LOAD_STRATEGY}   eager

*** Test Cases ***
Execute Tests in Selenoid
    [Documentation]   Execute automation tests in Selenoid environment
    Execute Tests in Selenoid Env

*** Keywords ***
Execute Tests in Selenoid Environment
    [Documentation]   Run various tests in Selenoid environment
    ${selenoid_caps}=   Create Dictionary   browserName=${BROWSER_NAME}   version=${BROWSER_VERSION}   platform=${PLATFORM}     enableVideo=${True}
    Open Browser        remote_url=${SELENOID_URL}   desired_capabilities=${selenoid_caps}
    Sleep       10
    Maximize Browser Window
    Go To   https://www.example.com
    Title Should Be   Example Domain
    # Close Browser
    Go To   https://www.robotframework.org
    Title Should Be   Robot Framework
    Close Browser

Execute Tests in Selenoid Env
    [Documentation]    Run various tests in Selenoid Environment
    ${selenoid_caps}=   Create Dictionary
    ...       browserName=${BROWSER_NAME}
    ...       version=${BROWSER_VERSION}
    ...       platform=${PLATFORM}
    ...       enableVideo=${True}
    ...       screenResolution=${SCREEN_RESOLUTION}
    ...       pageLoadStrategy=${PAGE_LOAD_STRATEGY}
    ...       enableVNC=${True}
    Open Browser        remote_url=${SELENOID_URL}   desired_capabilities=${selenoid_caps}
    Maximize Browser Window
    Sleep       10
    Go To   https://www.example.com
    Title Should Be   Example Domain
    # Close Browser
    Go To   https://www.robotframework.org
    Title Should Be   Robot Framework
    Close Browser

Execute Tests in Local
    [Documentation]    Run automatted tests in local machine
    Open Browser
    Close Browser

Execute Selenoid WebDriver Environment
    [Arguments]    ${downloadsDir}    ${application_url}    ${userAgent}    ${selenoid_url}
    ${options}    Create Dictionary
    Set To Dictionary    ${options}    browserVersion    ${BROWSER_VERSION}
    Set To Dictionary    ${options}    enableVNC    ${True}
    Set To Dictionary    ${options}    enableVideo    ${True}
    Set To Dictionary    ${options}    screenResolution    2560x1440x24
    Set To Dictionary    ${options}    pageLoadStrategy    eager
    ${name}    Catenate    SEPARATOR=    ENV: ${application_url}; USERDIR: ${CURDIR}
    Set To Dictionary    ${options}    name    ${name}
    Set To Dictionary    ${options}    timeZone    Europe/Moscow
    Run Keyword If    ${userAgent}    Set To Dictionary    ${options}    userAgent    ${userAgent}
    # Append To Dictionary    ${options}    arguments    --disable-site-isolation-trials
    # Append To Dictionary    ${options}    arguments    --disable-features=msDownloadsHub
    Set To Dictionary    ${options}    acceptInsecureCerts    ${True}
    ${driver}    Open Browser   remote_url=${SELENOID_URL}    desired_capabilities=${options}
    ${driver_id}    Execute JavaScript    return window.sessionStorage.getItem('session_id');
    ${remote_url}    Catenate    SEPARATOR=    ${SELENOID_URL}sessions/${driver_id}
    Log    Starting remote session: ${remote_url}
    [Return]    ${driver}