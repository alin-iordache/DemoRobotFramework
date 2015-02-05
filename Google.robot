*** Settings ***
Suite Teardown    Close All Browsers
Library           Selenium2Library
Resource          Keywords/keywords.txt
Resource          Keywords/locators.txt

*** Variables ***
${Build}          4.2.6
@{testers}        Alina    Laurentiu

*** Test Cases ***
Search
    Open Browser    http://www.google.ro
    Input Text    gbqfq    test better
    Wait Until Element Is Visible    //*[@role="listbox"]
    Click Button    gbqfb
    Log    ${Build}
    Count Elements    ${result_entry}
    ${found}    Get Matching Xpath Count    ${result_entry}
