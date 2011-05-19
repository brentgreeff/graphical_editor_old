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
  
  Scenario: Draw a 4 X 4 image
    When I run `ruby run_editor.rb` interactively
    And I type "I 2 2"
    And I type "S"
    And I type "X"
    Then the output should contain:
      """
      0000
      0000
      """


