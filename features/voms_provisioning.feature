Feature: Testing VOMs provisioning

Background:
	Given the coperson is registered
	And the coperson is part of comanage

Scenario: VOMs provisioning when RCAuth certificate is present
	Given the coperson has an RCAUTH certificate
	And the VOMs <vo_name> enrollment flow is available
	When the user enrolls for VOMs <vo_name>
	And the enrollment flow succeeds
	Then the coperson is part of the VOMs comanage group
	And the coperson is a member of VOMs <vo_name>

	Examples:
	|      vo_name        |
	| checkin_integration |

Scenario: VOMs provisioning with no RCAUth certificate
	Given the user has no RCAuth certificate
	And the VOMs <vo_name> enrollment flow is available
	When the user enrolls for VOMs <vo_name>
	And the enrollment flow succeeds
	Then the coperson is part of the VOMs comanage group
	And the coperson is not a member of VOMs <vo_name>

	Examples:
	|      vo_name        |
	| checkin_integration |

Scenario: RCAuth enrollement when coperson is part of VOMs Group
	Given the user is part of VOMs <vo_name> Group
	And the coperson is not a member of VOMs <vo_name>
	And RCAuth enrollment flow is available
	When the user enrolls for RCAuth
	And the enrollment flow succeeds
	Then the coperson is part of RCAuth comanage group
	And RCAuth certificate is depicted in coperson's profile
	And the coperson is a member of VOMs <vo_name>

	Examples:
	|      vo_name        |
	| checkin_integration |

Scenario: Update coperson's profile if already part of VOMs <vo_name>
	Given the user is a member of VOMs <vo_name>
	And the coperson is part of RCAuth comanage group
	And RCAuth certificate is depicted in coperson's profile
	When the user enrolls for VOMs <vo_name>
	And the enrollment flow succeeds
	Then the coperson is part of the VOMs comanage group
	And VOMs <vo_name> is depicted in coperson's profile

	Examples:
	|      vo_name        |
	| checkin_integration |


	Given the test is over
	Then purge the coperson