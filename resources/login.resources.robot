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

Click in login butto
    click element   xpath://input[@class='button-1 login-button']