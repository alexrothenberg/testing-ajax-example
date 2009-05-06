Feature: Allow anyone to find a user and see their details
  In order to handle a large set of users 
  I want search with autocomplete 
  
  Scenario: View a candidate detail page without testing ajax
    Given "Mickey Mouse" is a user living at "123 Main Street"
    When I am on the homepage
      And I fill in "Which user" with "Mickey Mouse"
      And I press "Find"
    Then I should see "Mickey Mouse"
      And I should see "123 Main Street"
  
  Scenario: View a candidate detail page testing (most of) the ajax
    Given "Mickey Mouse" is a user living at "123 Main Street"
    When I am on the homepage
      And I typeahead in "Which user" with "Mickey Mouse"
      And I fill in "Which user" with the first typeahead result
      And I press "Find"
    Then I should see "Mickey Mouse"
      And I should see "123 Main Street"

    


