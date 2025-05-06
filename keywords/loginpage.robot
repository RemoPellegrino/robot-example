*** Settings ***
Library    login_page_methods.py
Resource    pagechecks.robot
*** Keywords ***
Login With Credentials
    [Arguments]    ${username}    ${password}
    ${result}=    login_page_methods.login    ${username}    ${password}
    Should Be True    ${result}
Get Error Message
    ${result}=    login_page_methods.retrieve_error_message
    RETURN    ${result}