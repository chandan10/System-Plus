*** Settings ***
Resource    ../libraries/resource_libraries.robot
Resource    ../resources/find_center.robot
Suite Teardown    Close All Browsers

*** Test Cases ***
Bright Horizons New York Center Search
    [Tags]      Sanity
    [Documentation]    Automate Bright Horizons New York Center Search
    Launch Application
    Maximize Browser Window
    Verify find center functionality    New York

*** Keywords ***
Verify find center functionality
    [Arguments]    ${Search_Center}
    Find Center    ${Search_Center}
    ${centers_list}=    Get Element Count    ${Center_List_Count}
    ${centers_count}=    Get Text    ${Center_count}
    ${centers_count}=    Convert To Integer    ${centers_count}
    Should Be Equal    ${centers_list}    ${centers_count}    msg=Center Count is not maching with the dispalyed centers
    # Click on the first center and verify name and address
    ${first_center_name}=    Get Text    ${First_Center_Name}
    ${first_center_address}=    Get Text    ${First_Center_Address}
    sleep    ${DELAY}
    Wait Until Page Contains Element    ${Result_List}
    Click Element    ${Result_List}
    sleep    ${DELAY}
    Wait Until Page Contains Element    ${First_Center_Name_Popup}    timeout=20s    error=Pop up is not getting displyed for Center Information
    ${popup_center_name}=    Get Text    ${First_Center_Name_Popup}
    ${popup_center_address}=    Get Text    ${First_Center_Address_Popup}
    ${popup_center_address}=    Replace String    ${popup_center_address}    \n    ${SPACE}
    Should Be Equal    ${first_center_name}    ${popup_center_name}    msg=First center name is not getting match with First Center name on displayed pop up
    Should Be Equal    ${first_center_address}    ${popup_center_address}    msg=First center address is not getting match with First Center address on displayed pop up
