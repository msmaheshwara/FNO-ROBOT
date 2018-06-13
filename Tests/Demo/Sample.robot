*** Settings ***
Library   robot.libraries.DateTime

*** Test Cases ***
Test case test time stamp
    ${da} =  get current date   result_format=timestamp

    log  ${da}