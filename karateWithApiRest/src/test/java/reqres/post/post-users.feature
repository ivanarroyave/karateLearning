Feature: Create users.
  Like an system admin in the platform
  I need to create users information
  for procedure with other actions.

  Background:
    * def base = 'https://reqres.in/'
    * def name = 'Iván'
    * def job = 'QA leader'

  Scenario: Create user.
    Given url base + 'api/users'
    And request
    """
      {
        "name": #(name),
        "job": #(job)
      }
    """
    When method post
    Then status 201
    And match $.name == name
    And match $.job == job
    And match $.id == '#string'
    And match $.id == '#string'

