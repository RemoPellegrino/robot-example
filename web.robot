*** Settings ***
Resource    keywords/pagechecks.robot
Resource   keywords/loginpage.robot
Library    SeleniumLibrary
Library    RobotEnv/Lib/site-packages/robot/libraries/String.py

*** Variables ***
${BROWSER}    ${BROWSER}
${BASE_URL_WEB}    ${BASE_URL_WEB}    

*** Test Cases ***
Check login page
    Open Browser    ${BASE_URL_WEB}    ${BROWSER}
    User Is On Login Page
    Capture Page Screenshot    screenshots/login_page.png
    Close Browser

Login with wrong credentials
    Open Browser    ${BASE_URL_WEB}    ${BROWSER}
    User Is On Login Page
    Login With Credentials    Foo    Bar
    Capture Page Screenshot    screenshots/login_wrong_credentials.png
    ${error_message}=    Get Error Message
    Should Be Equal As Strings    ${error_message}    Epic sadface: Username and password do not match any user in this service
    Close Browser

Login with no password
    Open Browser    ${BASE_URL_WEB}    ${BROWSER}
    User Is On Login Page
    Login With Credentials    Foo    ${EMPTY}
    Capture Page Screenshot    screenshots/login_no_pass.png
    ${error_message}=    Get Error Message
    Should Be Equal As Strings    ${error_message}    Epic sadface: Password is required
    Close Browser

Login with no username
    Open Browser    ${BASE_URL_WEB}    ${BROWSER}
    User Is On Login Page
    Login With Credentials    ${EMPTY}    Bar
    Capture Page Screenshot    screenshots/login_no_username.png
    ${error_message}=    Get Error Message
    Should Be Equal As Strings    ${error_message}    Epic sadface: Username is required
    Close Browser

Login with correct credentials
    Open Browser    ${BASE_URL_WEB}    ${BROWSER}
    User Is On Login Page
    Login With Credentials    standard_user    secret_sauce
    Capture Page Screenshot    screenshots/correct_login.png
    User Is On Inventory Page

Login with locked out user
    Open Browser    ${BASE_URL_WEB}    ${BROWSER}
    User Is On Login Page
    Login With Credentials    locked_out_user    secret_sauce
    Capture Page Screenshot    screenshots/locked_out.png
    ${error_message}=    Get Error Message
    Should Be Equal As Strings    ${error_message}    Epic sadface: Sorry, this user has been locked out.