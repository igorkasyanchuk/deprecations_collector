# Deprecations Collector

This gem is collecting Rails deprecations from your Rails app into a separate log file.

How it could be used: imagine you are doing Rails upgrade, you have many specs and you want to find all deprecations and fix them before version upgrade. You can log all deprecations in log file, fix them. It helps with version upgrade.

# Installation

Add gem to Gemfile:

```ruby
gem "deprecations_collector", group: [:development, :test] # or even production
```

Then run `bundle install`.

In `config/environments/development.rb` or `config/environments/test.rb`. You can also do it for production.

put:

```ruby
  config.active_support.deprecation = [:log, DeprecationsCollector.instance]
  # or
  config.active_support.deprecation = [:stderr, DeprecationsCollector.instance]
  # or
  config.active_support.deprecation = DeprecationsCollector.instance
  # or
  config.active_support.deprecation = DeprecationsCollector.instance(filename: 'file-with-deprecations.log')
```

Start your Rails application, or specs/tests. Than check `logs/deprecations.log`.

Log file will be stored in `Rails.root/logs` folder.


# Contributing

You are welcome to contribute. Gem has a dummy application which helps with development.

`cd test/dummy`

`bundle install`

`rake db:migrate`

`rails s`
