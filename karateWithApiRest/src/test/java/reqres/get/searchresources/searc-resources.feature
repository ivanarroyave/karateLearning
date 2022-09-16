Feature: Search resources.
  Like an system admin in the platform
  I need to search the resources
  for procedure with other actions or just for get some particular information about them.

  Background:
    * def base = 'https://reqres.in/'

  Scenario: List resources.
    Given url base + 'api/unknown'
    When method get
    Then status 200

  Scenario: Single resource.
    Given url base + 'api/unknown/2'
    When method get
    Then status 200

  Scenario: Single resource not found.
    Given url base + 'api/unknown/23'
    When method get
    Then status 404


