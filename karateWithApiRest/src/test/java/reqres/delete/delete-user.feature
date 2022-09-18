Feature: Delete user.
  As an admin user
  I need delete users
  For complete admins procedures for operation business.

  Scenario: Delete an user.
    Given url 'https://reqres.in/api/users/2'
    When method delete
    Then status 204
    And match response == ''