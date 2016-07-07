# SpreeMailchimp

Adds a simple configuration interface to the admin area for Mailchimp and syncs store customers with a chosen Mailchimp list.

## Installation

Pick your chosen branch and add it to your Spree store's gemfile:

```
gem 'spree_mailchimp', git: 'staffordlong/spree_mailchimp', branch: '3-1-stable'
```

Run bundle install:

```
bundle install
```

Copy migrations:

```
bundle exec rake spree_mailchimp:install:migrations
```

Run migrations:

```
bundle exec rake db:migrate
```