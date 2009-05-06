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

  Scenario: Typeahead should return 2 users that match but not a third
    Given "Mickey Mouse" is a user living at "123 Main Street"
      And "Donald Duck" is a user living at "123 Pond Lane"
      And "Minnie Mouse" is a user living at "123 Disney Avenue"
    When I am on the homepage
      And I typeahead in "Which user" with "Mi"
    Then I should see in my typeahead "Mickey Mouse"
      And I should see in my typeahead "Minnie Mouse"
      And I should not see in my typeahead "Donald Duck"

    


