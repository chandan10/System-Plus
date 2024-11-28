*** Settings ***
Resource    ../libraries/resource_libraries.robot

*** Keywords ***
Find Center
    [Arguments]    ${Search_Center}
    [Documentation]    This keyword is used to click on find center button, input center name and press enter
    #Click on Find a Center option
    Wait Until Page Contains Element    ${Find_Center}    timeout=${TIMEOUT}
    Click Element    ${Find_Center}
    #Verify URL Contains '/child-care-locator'
    ${current_url}=    Get Location
    Should Contain    ${current_url}    ${Locator_URL}    error=URL doesnot contain '/child-care-locator'
    #Input provied search center in location search box and press Enter
    Input Text    ${Location_Search}    ${Search_Center}
    sleep    ${DELAY}
    Press Keys    ${Location_Search}    ENTER
    #Retry if center list count is not visible
    ${Bool}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${Center_List_Count}    timeout=20s    error=Center Count is not available
    IF  "${Bool}"=="False"
        clear element text    ${Location_Search}
        Input Text    ${Location_Search}    ${Search_Center}
        sleep    ${DELAY}
        Press Keys    ${Location_Search}    ENTER
        Wait Until Page Contains Element    ${Center_List_Count}    timeout=${TIMEOUT}   error=Center Count is not available
    END