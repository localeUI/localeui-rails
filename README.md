# LocaleUIRails

![Gem Version](https://img.shields.io/gem/v/localeui)
![CI Status](https://github.com/localeUI/localeui-rails/actions/workflows/main.yml/badge.svg)

The LocaleUI-Rails Gem is a Ruby on Rails application gem that provides developers with a seamless way to manage and synchronise translation files with LocaleUI.com. By integrating the Gem into the Rails application, translations can be automatically synchronised, updated and deployed directly to LocaleUI without manually uploading or copying language files.

The LocaleUI-Rails Gem makes the management of multilingual Ruby on Rails applications uncomplicated and automated - ideal for companies that want to offer their Ruby on Rails application in different languages.

## Requirements

This gem requires Ruby 3.2+ and Rails 7.1+.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add localeui

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install localeui

Next, you need to create a config file for localeui-rails. Run the following command to copy a basic config file.

    $ rails g localeui:install

Go to the config file `config/initializers/localeui.rb` and add your `api_token` and `project_id`.

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

Run tests with in the terminal 

    $ bin/test

## Release

1. Bump the version in `lib/localeui/version.rb` and update `CHANGELOG.md`.

2. Commit and create a git tag for the release:

    $ git add lib/localeui/version.rb CHANGELOG.md
    $ git commit -m "Release vX.Y.Z"
    $ git tag vX.Y.Z
    $ git push origin main --tags

3. Build and publish the gem to RubyGems:

    $ gem build localeui.gemspec
    $ gem push localeui-X.Y.Z.gem

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/localeUI/localeui_rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/localeUI/localeui-rails/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the LocaleuiRails project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/localeUI/localeui-rails/blob/main/CODE_OF_CONDUCT.md).
