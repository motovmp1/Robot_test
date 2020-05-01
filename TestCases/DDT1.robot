*** Settings ***

Library    Selenium2Library

# Resource will come from resources page
Resource        ../resources/login.resources.robot

Suite Setup     Open my Browser
Suite Teardown   Closing Browsers
Test Template  Invalid Login

*** Variables ***

${right_passaword}      admin
${userfield}            admin@yourstore.com
${wrong_pass1}          xzsdd
${wrong_user1}          admin123@yourstore.com



*** Test Cases ***
                            #username             #password
Right user empty pwd       ${userfield}           ${EMPTY}
Right user wrong pwd       ${userfield}           ${wrong_pass1}}
wrong user right pass      ${wrong_user1}         ${right_passaword}
wrong user empty pass      ${wrong_user1}         ${EMPTY}

*** Keywords ***

Invalid Login
    [Arguments]     ${username}     ${password}
    # this is come from resources page
    Input Username field        ${username}
    sleep  1
    Input PWD   ${password}
    sleep  1
    Click in login button
    sleep  2
    Error Message should be visible
    sleep  2