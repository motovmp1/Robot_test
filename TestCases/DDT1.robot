*** Settings ***

Library    Selenium2Library

# Resource will come from resources page
Resource        /home/elsys/PycharmProjects/robot_frame/resources/login.resources.robot

Suite Setup     Open my Browser
Suite Teardown   Closing Browsers
Test Template  Invalid Login

*** Variables ***
${userfield}     admin@yourstore.com

*** Test Cases ***
                            #username               #password
Rgight user empty pwd       ${userfield}           ${EMPTY}



*** Keywords ***

Invalid Login
    [Arguments]     ${username}     ${password}
    # this is come from resources page
    Input Username field        ${username}
    Input PWD   ${password}
    Click in login button
    Error Message should be visible