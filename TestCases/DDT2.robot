*** Settings ***

Library     Selenium2Library

Resource   ../resources/login.resources.robot

Library     DataDriver   ../Test_data/logindata.xlsx

# Run only one test time every test
Suite Setup      Open my Browser
Suite Teardown   Closing Browsers
Test Template    Invalid login

*** Test Cases ***


Loginwithexcel using ${username} ${password}


*** Keywords ***

Invalid Login
    # This is must be the same as excel file
    [Arguments]     ${username}     ${password}
    Input Username field        ${username}
    sleep  1
    Input PWD   ${password}
    sleep  1
    Click in login button
    sleep  2
    Error Message should be visible
    sleep  2