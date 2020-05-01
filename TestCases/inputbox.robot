*** Settings ***

Documentation     Open a Web Page using Lenovo new
Library           Collections
Library     SeleniumLibrary




*** Variables ***


${URL}      https://demo.nopcommerce.com
${browser}      headLessFirefox

*** Test Cases ***


OpenNavigator
    openbrowserpathapplication
    Go To    ${url}
    sleep  5s

Compare the title
    titleofthepage

Insert the email name
    insertemailname

Insert the password field
    insertpasswordfiel

Click login button page
    clickloginbutton

Close navigator page
    closenavigator



*** Keywords ***

openbrowserpathapplication
    log to console      "Running Test into Windows 10"
    open browser  ${URL}    ${browser}
    maximize browser window
    sleep  1
    set selenium speed  0.2
    ${page_title}       get title
    log                 ${page_title}


titleofthepage
    sleep  3s
    title should be    nopCommerce demo store


Insertemailname
    click link  xpath://a[@class='ico-login']
    ${"email_txt"}  set variable  id:Email
    element should be visible  ${"email_txt"}
    element should be enabled  ${"email_txt"}
    input text  ${"email_txt"}    vinicius.mpinho@gmail.com
    sleep  1s
    clear element text  ${"email_txt"}
    sleep  1s
    input text   ${"email_txt"}    vinicius.mpinho@gmail.com

insertpasswordfiel
    input password  id:Password     Test@123
    click element  xpath://input[@class='button-1 login-button']
    sleep  1s


clickloginbutton
    click link  xpath://a[@class='ico-account']
    sleep   1s

closenavigator
    close browser
# DEVE RODAR SOZINHO APOS GIT