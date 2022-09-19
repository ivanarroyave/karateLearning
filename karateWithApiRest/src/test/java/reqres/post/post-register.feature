Feature: Register a user.

  As a normal user
  I need create an account in the system
  for start the operations.

  Background:
    * def base = 'https://reqres.in/'

  Scenario: Successful register.
    Given url base + 'api/register'
    When request
    """
      {
        "email": "eve.holt@reqres.in",
        "password": "pistol"
      }
    """
    And method post
    Then status 200
    And match $.id == "#number"
    And match $.token == "#string"

  Scenario: Unsuccessful register.
    Given url base + 'api/register'
    When request
    """
      {
        "email": "sydney@fife",
      }
    """
    And method post
    Then status 400
    And match $.error == "Missing password"