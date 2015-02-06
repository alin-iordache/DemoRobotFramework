*** Settings ***
Suite Teardown    Close All Browsers
Resource          Resources/keywords.txt

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

BDT - The second search
    Given the Google page is opened
    When the user types "test better"
    And clicks the search button
    Then I see a lot of results

HLT - Another search
    Search    lullabies

DDT - The third search
    [Template]    Search
    robotframework
    python
    gogu
