# Jungle Scout Tech Challenge
https://stark-lowlands-27402.herokuapp.com/

This application takes ASIN (a unique identifier amazon uses for its products) as an input and returns properties of the product like category and rank.

## Usage

```
# cd /path/to/js_challenge
$ bundle exec rake db:setup
$ bundle exec rackup
```

Open localhost:9292 in your browser.

## Stack
Sinatra
- didn't need Rails given the spec of the application

PostgreSQL
- sophisticated RDB often used with Rails
- free if you use Heroku. don't even need to register your credit card (important)

Heroku
- easy deploy
- not fast but fast enough for the application

## License

The source code is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
