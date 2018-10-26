Feature: Testing Comanage signup flow and expunge

Background:
	Given a sign up enrollment flow is available
	And the coperson is registered with an idp

Scenario: Signup a COperson
	Given the coperson triggers the signup enrollment flow
	And the enrollment flow succeeds
	When the coperson attemps to login
	Then the coperson will be redirected to the corresponding profile

Scenario: Expunge user
	Given comanage admin user deletes the <coperson> user
	When the user attemps to login
	Then login will fail and the user will be prompted to sign up

	Examples:
	| coperson |
	| ioigoume |
