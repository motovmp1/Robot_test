*** Settings ***

Documentation     Open a Web Page using Lenovo new
Library           Collections
Library     SeleniumLibrary




*** Variables ***


${url}  https://demo.nopcommerce.com/
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
    title should be    nopCommerce demo store
    click link  xpath://a[@class='ico-login']
    ${"email_txt"}  set variable  id:Email
    element should be visible  ${"email_txt"}
    element should be enabled  ${"email_txt"}
    input text  ${"email_txt"}    vinicius.mpinho@gmail.com
    sleep  3s
    clear element text  ${"email_txt"}
    sleep  3s
    input text   ${"email_txt"}    vinicius.mpinho@gmail.com
    input password  id:Password     Test@123
    click element  xpath://input[@class='button-1 login-button']
    sleep  3s
    click link  xpath://a[@class='ico-account']
    sleep   3s
    close browser
