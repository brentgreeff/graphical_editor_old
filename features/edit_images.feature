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
      OO
      OO
      OO
      """
  
  Scenario: Draw a 4 X 2 image
    When I run `ruby run_editor.rb` interactively
    And I type "I 4 2"
    And I type "S"
    And I type "X"
    Then the output should contain:
      """
      OOOO
      OOOO
      """
  
  Scenario: Dont draw image if S command is not entered
    When I run `ruby run_editor.rb` interactively
    And I type "I 2 2"
    And I type "X"
    Then the output should not contain:
      """
      O
      """
  
  Scenario: Plot a coloured pixel as detailed in the test
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
  
  Scenario: Plot two coloured pixels
    When I run `ruby run_editor.rb` interactively
    And I type "I 2 2"
    And I type "L 1 1 F"
    And I type "L 2 2 C"
    And I type "S"
    And I type "X"
    Then the output should contain:
      """
      FO
      OC
      """
  
  Scenario: Clear the image after drawing a few pixels
    When I run `ruby run_editor.rb` interactively
    And I type "I 3 3"
    And I type "L 1 1 D"
    And I type "L 2 2 D"
    And I type "L 3 3 D"
    And I type "C"
    And I type "S"
    And I type "X"
    Then the output should contain:
      """
      OOO
      OOO
      OOO
      """
  
  Scenario: Display an error if the command is invalid
    When I run `ruby run_editor.rb` interactively
    And I type "Z"
    And I type "X"
    Then the output should contain:
      """
      Z - Unknown command
      """
  
  Scenario: Draw a vertical column of colour
    When I run `ruby run_editor.rb` interactively
    And I type "I 4 4"
    And I type "V 3 2 4 E"
    And I type "S"
    And I type "X"
    Then the output should contain:
      """
      OOOO
      OOEO
      OOEO
      OOEO
      """
  
  Scenario: Draw a horizontal row of colour
    When I run `ruby run_editor.rb` interactively
    And I type "I 5 4"
    And I type "H 3 4 2 Z"
    And I type "S"
    And I type "X"
    Then the output should contain:
      """
      OOOOO
      OOZZO
      OOOOO
      OOOOO
      """
  
  Scenario: Fill a solid region with a colour
    When I run `ruby run_editor.rb` interactively
    And I type "I 5 4"
    And I type "F 2 2 J"
    And I type "S"
    And I type "X"
    Then the output should contain:
      """
      JJJJJ
      JJJJJ
      JJJJJ
      JJJJJ
      """
  
  Scenario: Create 2 triangles
    When I run `ruby run_editor.rb` interactively
    And I type "I 5 6"
    And I type "F 2 2 A"
    And I type "H 1 5 1 B"
    And I type "H 2 5 2 B"
    And I type "H 3 5 3 B"
    And I type "H 4 5 4 B"
    And I type "L 5 5 B"
    And I type "S"
    And I type "X"
    Then the output should contain:
      """
      BBBBB
      ABBBB
      AABBB
      AAABB
      AAAAB
      AAAAA
      """

