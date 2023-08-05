*** Settings ***
Documentation     Test suite for medium post "Browsers in containers with selenoid and test automation using robotframework selenium"
...               This is just a demo

Resource          /code/resource/keywords/web_app_keywords.robot

Suite Teardown    Close Browser

*** Test Cases ***
finding selenoid in the deep ocean
    [Documentation]    test inspired by movie finding Nemo
    ...               and searching selenoid in the deep blue ocean
    [Tags]
    Open Browser to Page
    search googl.com for aerokube/selenoid
    Page Should Contain    https://github.com › aerokube › selenoid

