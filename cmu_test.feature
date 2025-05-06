Feature: Capacity Market Unit

Scenario: Correct status code for valid request
Given user has a connection to the api endpoint
When user retrieves all capacity market units
Then the status code is 200