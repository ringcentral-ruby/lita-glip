Lita Glip Adapter
=================

[![Gem Version][gem-version-svg]][gem-version-link]
[![Build Status][build-status-svg]][build-status-link]
[![Coverage Status][coverage-status-svg]][coverage-status-link]
[![Dependency Status][dependency-status-svg]][dependency-status-link]
[![Codacy Badge][codacy-svg]][codacy-link]
[![Code Climate][codeclimate-status-svg]][codeclimate-status-link]
[![Scrutinizer Code Quality][scrutinizer-status-svg]][scrutinizer-status-link]
[![Downloads][downloads-svg]][downloads-link]
[![Docs][docs-rubydoc-svg]][docs-rubydoc-link]
[![License][license-svg]][license-link]

`lita-glip` is an adapter for [Lita](https://www.lita.io/) that allows you to use the robot with [Glip](https://glip.com/).

## Installation

Add `lita-glip` to your Lita instance's Gemfile:

``` ruby
gem "lita-glip"
```

## Configuration

### Direct

```ruby
Lita.configure do |config|
  config.robot.adapter = :glip

  # Glip app info
  config.adapters.glip.app_key = 'my_app_key'
  config.adapters.glip.app_secret = 'my_app_secret'
  config.adapters.glip.server_url = 'https://platform.devtest.ringcentral.com'
  config.adapters.glip.username = '16505550100'
  config.adapters.glip.extension = '101'
  config.adapters.glip.password = 'my_password'
end
```

### Dotenv

Using `LitaDotenv` you can use the following:

``` ruby
require 'lita_dotenv'

Lita.configure do |config|
  config = LitaDotenv.new(config).config
end
```

In your `.env` file:

```
LITA_ROBOT_ADAPTER__TYPESYM=glip

LITA_ADAPTERS_GLIP_appKey=my_app_key
LITA_ADAPTERS_GLIP_appSecret=my_app_secret
LITA_ADAPTERS_GLIP_serverUrl=https://platform.devtest.ringcentral.com
LITA_ADAPTERS_GLIP_USERNAME=16505550100
LITA_ADAPTERS_GLIP_EXTENSION=101
LITA_ADAPTERS_GLIP_PASSWORD=my_password
```

## API documentation

The API documentation, useful for plugin authors, can be found for the latest gem release on [RubyDoc.info](http://www.rubydoc.info/gems/lita-glip).

## To Do

1. User address book lookup.

## Change Log

See [CHANGELOG.md](CHANGELOG.md)

## Links

Project Repo

* https://github.com/ringcentral-ruby/lita-glip

Lita

* https://www.lita.io/

## Contributing

1. Fork it ( http://github.com/ringcentral-ruby/lita-glip/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Lita Glip Adapter is available under the MIT license. See [LICENSE.md](LICENSE.md) for details.

Lita Glip Adapter &copy; 2016-2017 by John Wang

 [gem-version-svg]: https://badge.fury.io/rb/lita-glip.svg
 [gem-version-link]: http://badge.fury.io/rb/lita-glip
 [downloads-svg]: http://ruby-gem-downloads-badge.herokuapp.com/lita-glip
 [downloads-link]: https://rubygems.org/gems/lita-glip
 [build-status-svg]: https://api.travis-ci.org/ringcentral-ruby/lita-glip.svg?branch=master
 [build-status-link]: https://travis-ci.org/ringcentral-ruby/lita-glip
 [coverage-status-svg]: https://coveralls.io/repos/ringcentral-ruby/lita-glip/badge.svg?branch=master
 [coverage-status-link]: https://coveralls.io/r/ringcentral-ruby/lita-glip?branch=master
 [dependency-status-svg]: https://gemnasium.com/ringcentral-ruby/lita-glip.svg
 [dependency-status-link]: https://gemnasium.com/ringcentral-ruby/lita-glip
 [codeclimate-status-svg]: https://codeclimate.com/github/ringcentral-ruby/lita-glip/badges/gpa.svg
 [codeclimate-status-link]: https://codeclimate.com/github/ringcentral-ruby/lita-glip
 [scrutinizer-status-svg]: https://scrutinizer-ci.com/g/ringcentral-ruby/lita-glip/badges/quality-score.png?b=master
 [scrutinizer-status-link]: https://scrutinizer-ci.com/g/ringcentral-ruby/lita-glip/?branch=master
 [docs-rubydoc-svg]: https://img.shields.io/badge/docs-rubydoc-blue.svg
 [docs-rubydoc-link]: http://www.rubydoc.info/gems/lita-glip/
 [license-svg]: https://img.shields.io/badge/license-MIT-blue.svg
 [license-link]: https://github.com/ringcentral-ruby/lita-glip/blob/master/LICENSE.md
