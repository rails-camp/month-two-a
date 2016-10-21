## devCamp Month Two A Exam

In order to pass this exam you will need to implement the following features to get the automated tests to pass.

1. Implement user authentication using the `Devise` gem. This should include the ability for users to register and log into the the application.
2. Integrate Bootstrap into the Rails application while using the Bootstrap SASS gem.
3. Create a Bootstrap nav bar that has a dropdown for signing out.
4. Implement a `StaticController` with a `home` action.
5. Ensure to include Rails alerts/notifications.

If you look in the `spec/features` directory you will see RSpec test files that will test your implementation. You will have passed this exam when all of the tests are passing.

### Installation

1. Clone this repo to your local machine.
2. Run `bundle install`
3. Run `rake db:migrate`
4. Run `rspec` to run the tests