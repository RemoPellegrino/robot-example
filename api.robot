*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL_API}    ${BASE_URL_API}

*** Test Cases ***
Get Pet By ID
    [Documentation]    Test retrieving pet data by ID
    Create Session    petstore    ${BASE_URL_API}
    ${response}    GET On Session    petstore    /pet/1
    Log    ${response.json()}
    Should Be Equal As Numbers    ${response.status_code}    200
    Should Contain    ${response.json()}    id

Add New Pet
    [Documentation]    Test adding a new pet to the store
    Create Session    petstore    ${BASE_URL_API}
    ${body}=    Create Dictionary    id=1001    name=Rex    status=available
    ${response}    POST On Session    petstore    /pet    json=${body}
    Log    ${response.json()}
    Should Be Equal As Numbers    ${response.status_code}    200
    Should Be Equal    ${response.json()["name"]}    Rex

Delete Pet
    [Documentation]    Test deleting a pet by ID
    Create Session    petstore    ${BASE_URL_API}
    ${response}    DELETE On Session    petstore    /pet/1001
    Log    ${response.json()}
    Should Be Equal As Numbers    ${response.status_code}    200

Search Pets By Status
    [Template]    Test Searching Pets By Status
    available
    pending
    sold

*** Keywords ***
Test Searching Pets By Status
    [Arguments]    ${status}
    Create Session    petstore    ${BASE_URL_API}
    ${path}     Set Variable   /pet/findByStatus
    ${params}     Set Variable    status=${status}
    ${response}    GET On Session    petstore    ${path}    params=${params}
    Should Be Equal As Numbers    ${response.status_code}    200
    ${pets}    Get From List    ${response.json()}    0
    FOR    ${pet}    IN    ${pets}
        Log    ${pet}
        Should Be Equal    ${pet['status']}    ${status}
    END