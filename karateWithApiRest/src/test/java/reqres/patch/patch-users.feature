Feature: Update users.
  Like an system admin in the platform
  I need to update users information
  for procedure with other actions.

  Background:
    * def base = 'https://reqres.in/'
    * def name = 'morpheus'
    * def job = 'zion resident'

  Scenario: Create user.
    Given url base + 'api/users/2'
    And request
    """
      {
        "name": #(name),
        "job": #(job)
      }
    """
    When method patch
    Then status 200
    And match $.name == name
    And match $.job == job
    And match $.updatedAt == '#string'

