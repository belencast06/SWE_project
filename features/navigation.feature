# features/navigation.feature
Feature: Site Navigation
  As a user
  I want to be able to navigate between different sections
  So that I can access all features of the application

  Background:
    Given I am logged in

  Scenario: Navigate to forum from home page
    When I visit the home page
    Then I should see the following navigation options:
      | General Discussion |
      | Help & Support     |
      | Off-Topic          |
    When I click "General Discussion"
    Then I should see "Create New Post"
    And I should be on the general discussion page

  Scenario: Navigate to home from forum
    When I visit the "General Discussion" forum
    And I click "Back to Home"
    Then I should be on the home page

  Scenario: Navigate between forum categories
    When I visit the "General Discussion" forum
    Then I should be on the general discussion page
    When I visit the "Help & Support" forum
    Then I should be on the help and support page
    When I visit the "Off-Topic" forum
    Then I should be on the off topic page

  Scenario: Access navigation elements from all pages
    When I visit the home page
    Then I should see "Logout" in the navigation bar
    When I visit the "General Discussion" forum
    Then I should see "Logout" in the navigation bar
    When I visit the "Help & Support" forum
    Then I should see "Logout" in the navigation bar
   

  Scenario: Logo navigation to home page
    When I visit the "General Discussion" forum
    And I click on the site logo
    Then I should be on the home page
    
  Scenario: Navigation protection for unauthenticated users
    Given I am not logged in
    When I try to visit the home page
    Then I should be redirected to the login page
    When I try to visit the "General Discussion" forum
    Then I should be redirected to the login page
    When I try to visit a lesson page
    Then I should be redirected to the login page