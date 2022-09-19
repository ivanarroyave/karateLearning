Feature: Login a user.

  As a normal user
  I need login in the system
  for start the operations.

  Background:
    * def base = 'https://reqres.in/'

  Scenario: Successful login.
    Given url base + 'api/login'
    When request
    """
      {
        "email": "eve.holt@reqres.in",
        "password": "cityslicka"
      }
    """
    And method post
    Then status 200
    And match $.token == "#string"

  Scenario: Unsuccessful login.
    Given url base + 'api/register'
    When request
    """
      {
        "email": "peter@klaven",
      }
    """
    And method post
    Then status 400
    And match $.error == "Missing password"