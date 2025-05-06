*** Settings ***
Library    OperatingSystem
Library    Collections
Library    inventory_page_methods.py
Library    login_page_methods.py
Library    SeleniumLibrary

*** Keywords ***
User Is On Login Page
    ${result}=    login_page_methods.is_on_login_page
    Should Be True    ${result}

User Is On Inventory Page
    ${result}=    inventory_page_methods.is_on_inventory_page
    Should Be True    ${result}