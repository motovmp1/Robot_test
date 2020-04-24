*** Settings ***

Library     Selenium2Library


*** Variables ***

${URL}      https://admin-demo.nopcommerce.com
${browser}      Chrome

*** Keywords ***

Open my Browser
    open browser  ${URL}    ${browser}
    maximize browser window
    sleep  4
    set selenium speed  1

Closing Browsers
    close all browsers

# option case to open
Open and Login Page
    go to   ${URL}

Input Username field
    [Arguments]     ${username}
    input text      id:Email        ${username}


Input PWD
    [Arguments]     ${password}
    input text      id:Password     ${password}

Click in login button
    click element   xpath://input[@class='button-1 login-button']

Click in logout button
    click link      Logout

Error Message should be visible
    page should contain     Login was unsuccessful.

Dashboard page should be visible
    page should contain     Dashboard

