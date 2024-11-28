*** Settings ***
Resource    ../libraries/resource_libraries.robot

*** Keywords ***
Launch Application
    [Documentation]    *Keyword Description*:Keyword is used to launch portal application
    Select Browser
    ${Bool}    Run Keyword And Return Status    Wait Until Element Is Visible    ${Find_Center}    timeout=10s    error=Page is not visible after 10 seconds
    Run Keyword If    '${Bool}'== 'True'    log    ${\n}Application Login Successfully
    ...    ELSE    log    ${\n}Application Login Failed
    ${Bool}=    Run Keyword And Return Status    Wait Until Element Is Visible    //div/button[text()='Accept All']
    IF    ${Bool}==True
    Click Button    //div/button[text()='Accept All']
    END

Select Browser
    [Documentation]    *Keyword Description*:Keyword can be used to select browser at execution time
    IF    '${BROWSER}'=='Firefox'
    Launch Firefox Browser
    ELSE IF    '${BROWSER}'=='Chrome'
    Launch Chrome Browser
    ELSE
    Log To Console    Browser not mentioned
    END

Launch Firefox Browser
    [Documentation]    *Keyword Description*:Keyword can be used to open firefox browser
    ${gekodriver_path}=    Get Gekodriver Path
    Create Webdriver    Firefox
    Go To    ${BASE_URL}
    Maximize Browser Window

Launch Chrome Browser
    [Documentation]    *Keyword Description*:Keyword can be used to open chrome browser
    ${chromedriver_path}=    Get Chromedriver Path
    Create Webdriver    Chrome
    Go To    ${BASE_URL}
    Maximize Browser Window
