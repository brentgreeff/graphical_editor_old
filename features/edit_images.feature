Feature: Edit images
  In order to draw ascii rendered images
  As an image designer
  I want to edit my image and display it
  
  Scenario: Exit the program
    When I run `editor.rb` interactively
    And I type "X"
    Then the output should contain:
      """
      something
      """
  
  @wip
  Scenario: draw a blank image 4x3 pixels
    When I run `editor.rb`
    Then the output should contain:
      """
      0000
      0000
      0000
      """

