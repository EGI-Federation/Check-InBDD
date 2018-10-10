Feature: Special Identity Providers
  Apart from the full list of IdPs in edugain, there are a few special
  identity providers which certain categories of users would prefer.
  These identity providers should be easy to recognise and immediately
  visible on the identity provider selection page.
  Scenario: There are seven special IdPs, of which I prefer ORCID
    Given I try to log in to EGI Check-In
    Then I click on the red log in button on the top right
    Then I am taken to the IdP Proxy
    And I can see the ORCID option to log in.

  