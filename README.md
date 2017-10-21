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

[![Stack Overflow][stackoverflow-svg]][stackoverflow-url]
[![Chat][chat-svg]][chat-url]

`lita-glip` is an adapter for [Lita](https://www.lita.io/) that allows you to use the robot with [Glip](https://glip.com/).

## Installation

Add `lita-glip` to your Lita instance's Gemfile:

``` ruby
gem "lita-glip"
```

## Configuration

The Lita adapter does not support the Glip interactive bot provisioning process yet. This is because the process requires a publicly accessible OAuth redirect URL and it appears this is supported only for handlers and not adapters at the moment. To configure Lita, do the following:

* Use a stand-in bot to get permanent bot access token to use in the Lita config like [glipbot_auth](https://github.com/grokify/oauth2util-go/tree/master/examples/glipbot_auth)
* Use username/password credentials for a user extension. This is deprecated and not recommended but can be easier than setting up a stand-in bot.

### Direct

```ruby
Lita.configure do |config|
  config.robot.adapter = :glip

  # Glip app info
  config.adapters.glip.app_key = 'my_app_key'
  config.adapters.glip.app_secret = 'my_app_secret'
  config.adapters.glip.server_url = 'https://platform.devtest.ringcentral.com'
  config.adapters.glip.token = {"access_token":"DEADBEEF","token_type":"bearer","expiry":"2085-11-06T01:35:52.873185841-08:00"}
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
LITA_ADAPTERS_GLIP_TOKEN={"access_token":"DEADBEEF","token_type":"bearer","expiry":"2085-11-06T01:35:52.873185841-08:00"}
```

#### Username/Password Approach

Use the following in your Lita Config and `.env` file to configure the bot using a user extension:

Lita Config

```ruby
  config.adapters.glip.username = '16505550100'
  config.adapters.glip.extension = '101'
  config.adapters.glip.password = 'my_password'
```

`.env.` file:

```
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
 [codacy-svg]: https://api.codacy.com/project/badge/Grade/35abeb643e404062a980c2cb8f279865
 [codacy-link]: https://www.codacy.com/app/ringcentral-ruby/lita-glip
 [codeclimate-status-svg]: https://codeclimate.com/github/ringcentral-ruby/lita-glip/badges/gpa.svg
 [codeclimate-status-link]: https://codeclimate.com/github/ringcentral-ruby/lita-glip
 [scrutinizer-status-svg]: https://scrutinizer-ci.com/g/ringcentral-ruby/lita-glip/badges/quality-score.png?b=master
 [scrutinizer-status-link]: https://scrutinizer-ci.com/g/ringcentral-ruby/lita-glip/?branch=master
 [docs-rubydoc-svg]: https://img.shields.io/badge/docs-rubydoc-blue.svg
 [docs-rubydoc-link]: http://www.rubydoc.info/gems/lita-glip/
 [license-svg]: https://img.shields.io/badge/license-MIT-blue.svg
 [license-link]: https://github.com/ringcentral-ruby/lita-glip/blob/master/LICENSE.md
 [chat-svg]: https://img.shields.io/badge/chat-on%20glip-orange.svg
 [chat-url]: https://glipped.herokuapp.com/
 [stackoverflow-svg]: https://img.shields.io/badge/Stack%20Overflow-glip-orange.svg
 [stackoverflow-url]: https://stackoverflow.com/questions/tagged/glip
