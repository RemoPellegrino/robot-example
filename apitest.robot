*** Settings ***
Library    RequestsLibrary

*** Variables ***
${URL}    https://availabilitymonitoringdemo.elia.be/

*** Test Cases ***
Get all CMUs - Validate valid get RequestsLibrary - status code
    Create Session    CMUs    ${URL}
    ${response}=    GET On Session    CMUs    /core/b2binterface/v1/cmus
    Should Be Equal As Numbers    ${response.status_code}    200
