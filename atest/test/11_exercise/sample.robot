*** Settings ***
Library   Browser

*** Variables ***
${SELENIUM_URL}   http://localhost:4444/wd/hub

*** Test Cases ***
Example Test
    New Browser    chromium
    New Page    https://playwright.dev
    Get Text    h1    contains    Playwright
    