*** Settings ***
Library    RequestsLibrary
Test Setup  	Create Session    my_session    ${HOST}    verify=False


*** Variables ***
${HOST}    https://jsonplaceholder.typicode.com


*** Test Cases ***
Send GET Request to JsonPlaceholder
    ${params}   Create Dictionary    key1=value1
    ${response}    GET On Session    my_session    /todos   params=${params}    expected_status=200
    Should Be Equal As Strings    ${response}    200

Send POST Request to Example API
    ${headers}   Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${data}      Create Dictionary    key1=value1    key2=value2    key3=value3
    ${response}  POST On Session    my_session    /posts     data=${data}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    201
