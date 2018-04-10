Feature: Engine
  Test the engine module to see that everything works properly
  
  Scenario: To google
    When I go to google
    And I search for cheese
    Then I should see cheese
    
  Scenario: Add 2 and 1
    When I add 2 and 1
    Then I should see 3