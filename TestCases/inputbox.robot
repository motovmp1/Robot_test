*** Settings ***

Documentation     Open a Web Page using Lenovo new
Library           Collections
Library     SeleniumLibrary




*** Variables ***


${URL}      https://demo.nopcommerce.com
${browser}      Chrome

*** Test Cases ***


LoginTest

    openbrowserpathapplication
    Go To    ${url}
    sleep  5s
    userandpasswordapplication




*** Keywords ***

openbrowserpathapplication
    log to console      "Running Test into Windows 10"
    open browser  ${URL}    ${browser}
    maximize browser window
    sleep  4
    set selenium speed  1
    ${page_title}       get title
    log                 ${page_title}


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
