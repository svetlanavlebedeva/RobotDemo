*** Settings ***
Library    RequestsLibrary
Test Setup       	Create Session    my_session    ${HOST}    verify=False


*** Variables ***
${HOST}    https://jsonplaceholder.typicode.com


*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
Send GET Request to Google
    ${response}    GET On Session    my_session    /todos
    Should Be Equal As Strings    ${response.status_code}    200

Send POST Request to Example API
    ${headers}   Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${data}      Create Dictionary    key1=value1    key2=value2
    ${response}  POST On Session    my_session    /posts     data=${data}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    201


