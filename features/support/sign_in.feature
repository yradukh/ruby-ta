@registration_login
Feature: Visitor Registration and Login
  As a visitor
  I want to be able to sign up and sign in
  In order to become user

  Background:
    Given I visit Redmine homepage

  @registration
  Scenario: Visitor successfully signs up
     When I click click 'register' button
      And I fill in 'registration' form
     Then I see that I become 'registered' in user

  @login
  Scenario: Visitor successfully signs in
     When I click click 'login' button
      And I fill in 'login' form
     Then I see that I become 'logged' in user
