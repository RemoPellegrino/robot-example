*** Settings ***
Library    RequestsLibrary

*** Variables ***
${URL}    https://availabilitymonitoringdemo.elia.be/
${cmuId}    82a71e03-878d-4b18-bc25-4b87fd6ccc38
${expectedCmu}    CMU-9O4JS
${deliveryperiod}    2023-2024
${unknownId}    foobar

*** Test Cases ***
Retrieve NRP for known cmuId should give status 200
    Create Session    CMUs    ${URL}
    ${resource}=    Set Variable  /core/b2binterface/v1/cmus/${cmuId}/nrp
    ${response}=    GET On Session    CMUs    ${resource}
    Should Be Equal As Numbers    ${response.status_code}    200

Retrieve NRP for unknown cmuId should give status ?
    Create Session    CMUs    ${URL}
    ${resource}=    Set Variable  /core/b2binterface/v1/cmus/${unknownId}/nrp
    ${response}=    GET On Session    CMUs    ${resource}
    Should Be Equal As Numbers    ${response.status_code}    200
    