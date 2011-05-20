Feature: Edit images
  In order to draw ascii rendered images
  As an image designer
  I want to edit my image and display it
  
  Scenario: Draw a 2 x 3 image
    When I run `ruby run_editor.rb` interactively
    And I type "I 2 3"
    And I type "S"
    And I type "X"
    Then the output should contain:
      """
      00
      00
      00
      """
  
  Scenario: Draw a 4 X 2 image
    When I run `ruby run_editor.rb` interactively
    And I type "I 4 2"
    And I type "S"
    And I type "X"
    Then the output should contain:
      """
      0000
      0000
      """
  
  Scenario: Dont draw image if S command is not entered
    When I run `ruby run_editor.rb` interactively
    And I type "I 2 2"
    And I type "X"
    Then the output should not contain:
      """
      0
      """
  
  Scenario: plot a coloured pixel as detailed in the test
    When I run `ruby run_editor.rb` interactively
    And I type "I 5 6"
    And I type "L 2 3 A"
    And I type "S"
    And I type "X"
    Then the output should contain:
      """
      OOOOO
      OOOOO
      OAOOO
      OOOOO
      OOOOO
      OOOOO
      """
  
  Scenario: plot two coloured pixels
    When I run `ruby run_editor.rb` interactively
    And I type "I 2 2"
    And I type "L 1 1 F"
    And I type "L 2 2 C"
    And I type "S"
    And I type "X"
    Then the output should contain:
      """
      F0
      0C
      """

