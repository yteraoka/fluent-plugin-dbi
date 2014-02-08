# Fluent::Plugin::Dbi, a plugin for [Fluentd](http://fluentd.org)

Fluentd Output plugin using DBI

DBI を使って PostgreSQL や MySQL へ INSERT とかを行う Fluentd の Output Plugin

## Installation

Add this line to your application's Gemfile:

    gem 'fluent-plugin-dbi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fluent-plugin-dbi

## Usage

    <match dbi.*>
      type dbi
      #dsn DBI:Pg:dbname:dbhost
      dsn DBI:Mysql:dbname:dbhost
      db_user username
      db_pass password
      keys host,time_m,method,uri,protocol,status
      query insert into access_log (host, time, method, uri, protocol, status) values (?, ?, ?, ?, ?, ?)
    </match>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
