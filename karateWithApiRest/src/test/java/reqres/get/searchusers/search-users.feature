Feature: Search users.
  Like an system admin in the platform
  I need to search the users
  for procedure with other actions or just for get some particular information about them.

  Background:
    * def base = 'https://reqres.in/'

  Scenario: List users.
    Given url base + 'api/users?page=2'
    When method get
    Then status 200
    And match $ == read('list-users-response.json')

  Scenario Outline: List users - Examples in page <pageNumber>.
    Given url base + 'api/users?page=<pageNumber>'
    When method get
    Then status <httpStatus>
    Examples:
      | pageNumber | httpStatus |
      | 1          | 200        |
      | 2          | 200        |
      | 3          | 200        |

  Scenario: Single user.
    Given url base + 'api/users/2'
    When method get
    Then status 200
    And match $ == read('single-user-response.json')
    And match $.data.id == 2
    And match $.support.url == '#string'
    And match $.support.url contains 'https://reqres.in/'

  Scenario: Single user not found.
    Given url base + 'api/users/23'
    When method get
    Then status 404
    And match response == {}

  Scenario: Delayed response.
    Given url base + 'api/users?delay=3'
    When method get
    Then status 200
    And match response.page == 1
