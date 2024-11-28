*** Settings ***
Resource    ../libraries/resource_libraries.robot
Suite Teardown    Close All Browsers

*** Variables ***
${SEARCH_TEXT}      Employee Education in 2018: Strategies to Watch

*** Test Cases ***
Verify search functionality
    [Tags]      Sanity    Search
    Launch Application
    Verify search functionality

*** Keywords ***
Verify search functionality
    [Documentation]     This keyword is used to validate search functionality
    #Click on the search/loop icon (top, right corner)
    Wait Until Page Contains Element    ${Search}    timeout=${TIMEOUT}    error=Search button is not visible in ${TIMEOUT}
    Click Element    ${Search}
    #Verify if the search field is visible on the page
    Wait Until Page Contains Element    ${Search_Field}    timeout=${TIMEOUT}    error=Search field is not available
    Element Should Be Visible    ${Search_Field}    msg=Search field is not available
    #Input search text in the search field
    Input Text    ${Search_Field}    ${SEARCH_TEXT}
    #Click the search button
    Click Button    ${Search_Button}
    #Wait for the search results to appear
    Wait Until Page Contains Element    ${Search_Result}
    # Verify if the search result matches the search term
    ${Search_result}=    Get Text    (//h3[@class='title'])[1]
    Should Be Equal    ${Search_result}    ${SEARCH_TEXT}    msg=Search result is not matches with the search text entered
