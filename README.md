# Press Release Manager

Welcome to the Press Release Manager challenge! This project aims to assess your skills in full-stack Rails development, including data modeling, validation, testing, authentication, and front-end interactions.

## Goal

The goal is to develop a Ruby on Rails application for managing press releases. The application should allow users with different roles to create and manage press releases, publishers, and organizations.

## Stack Used

- Ruby: >= 3.3.0
- Rails: >= 7.1
- PostgreSQL: >= 15
- Sidekiq: >= 7
- Redis
- Hotwire: Use Turbo and Stimulus for front-end interactions.
- ViewComponent (Optional): For advanced view encapsulation.

Ensure that the application is compatible with these technologies to demonstrate proficiency with up-to-date development practices.

## Steps

### GitHub

- Initialize a repository named `press-release-manager` on GitHub.
- Commit regularly with clear messages.

### Rails App

- Create a new Rails app.

### Data Models

- User: Attributes should include email, password, and role.
- PressRelease: Attributes like title, content, publish_date.
- Publisher: Attributes like name and description.
- Organization: Attributes like name, description.

To all data models, add other attributes you deem necessary. Specify the associations among the models as needed.

### Controllers

- Write controllers for each model ensuring they can be accessed from remote clients.

### Validations

- Add necessary validations to each model.

### Authentication

- Implement user authentication. You're free to use any reasonable method or gem (e.g., Devise, JWT).

### Front-end Views with Hotwire

- Implement at least one feature using Ruby on Rails Hotwire, integrating both Stimulus and Turbo. This will demonstrate your ability to enhance the user experience with real-time updates and interactive interfaces.

### Scheduled Release Feature

- Implement a feature to schedule the release of press releases using Sidekiq. This should allow users to set a future date and time for a press release to be published automatically.

### Testing with RSpec

- Write unit tests using RSpec for all your models, controllers, and any additional services you might implement.

### Creativity

- Implement a couple of features that show off your creativity and depth of understanding of Rails.