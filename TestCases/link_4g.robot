*** Settings ***

Documentation     Open a WeB page Amplimax
Library           Collections
Library     SeleniumLibrary




*** Variables ***


${url}  http://192.168.10.254/index.html?link
${browser}  firefox

*** Test Cases ***


LoginTest

    openbrowserpathapplication
    Go To    ${url}
    sleep  5s
    userandpasswordapplication




*** Keywords ***

openbrowserpathapplication
    ${ff default caps}    Evaluate    sys.modules['selenium.webdriver'].common.desired_capabilities.DesiredCapabilities.FIREFOX    sys,selenium.webdriver
    Set To Dictionary    ${ff default caps}    marionette=${True}
    Create Webdriver    Firefox    executable_path=/home/elsys/PycharmProjects/robot_frame/TestCases/geckodriver
    maximize browser window

userandpasswordapplication
    sleep  3s
    title should be    Elsys - AmpliMAX
    sleep  3s
    click element  xpath://img[@id='icon_status']
    sleep  10s
    ${for_value}=   page should contain element  xpath://span[@class='tecnologia']//img[@id='icon_3g']
    log to console  ${for_value},    stream=STDOUT, no_newline=False
    Log    Started Noisy Test Case ...    console=${True}
    Log     ${for_value}    console=${True}
    ${for_value}    convert to string  ${for_value}
    Log     ${for_value}    console=${True}
