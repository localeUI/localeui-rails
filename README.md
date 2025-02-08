# LocaleUIRails

![Gem Version](https://img.shields.io/gem/v/localeui-rails)
![CI Status](https://github.com/localeUI/localeui-rails/actions/workflows/main.yml/badge.svg)

The LocaleUIRails Gem is a Ruby on Rails application gem that provides developers with a seamless way to manage and synchronise translation files with LocaleUI.com. By integrating the Gem into the Rails application, translations can be automatically synchronised, updated and deployed directly to LocaleUI without manually uploading or copying language files.

The LocaleUI Rails Gem makes the management of multilingual Ruby on Rails applications uncomplicated and automated - ideal for companies that want to offer their Ruby on Rails application in different languages.

## Requirements

This gem requires Ruby 3.2+ and Rails 7.1+.

## Installation

TODO: Replace `UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG` with your gem name right after releasing it to RubyGems.org. Please do not do it earlier due to security reasons. Alternatively, replace this section with instructions to install your gem from git if you don't plan to release to RubyGems.org.

Install the gem and add to the application's Gemfile by executing:

    $ bundle add UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG

Next, you need to create a config file  for localeui-rails. Run the following command to copy a basic config file.

    $ rails g localeui:install

Go to the config file `config/localeui.rb` and add your `api_token` and `project_id`.

```ruby
Localeui.config do |config|
  # ...
  
  # Authentication Token
  config.api_token = ENV['LOCALEUID_API_TOKEN']

  # Project API ID
  config.project_id = ENV['LOCALEUID_PROJECT_ID']

  # ...other options
end
```

## Upload Translation Files

    $ rails localeui:upload  

## Download Translation Files

    $ rails localeui:download

## Development

TODO

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

TODO

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/localeui_rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/localeui_rails/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the LocaleuiRails project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/localeui_rails/blob/master/CODE_OF_CONDUCT.md).
