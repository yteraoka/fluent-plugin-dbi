require 'helper'

class DbiOutputTest < Test::Unit::TestCase
  def setup
    Fluent::Test.setup
  end

  CONFIG = %[
    dsn = DBI:drv:dbname:hostname
    db_user username
    db_pass password
    keys aaa,bbb,ccc
    query insert into logs (aaa, bbb, ccc) values (?, ?, ?)
  ]

  def create_driver(conf=CONFIG)
    Fluent::Test::OutputTestDriver.new(Fluent::DbiOutput) do
    end.configure(conf)
  end

  def test_configure
    d = create_driver
    keys = ["aaa", "bbb", "ccc"]
    assert_equal "username", d.instance.db_user
    assert_equal "password", d.instance.db_pass
    assert_equal "insert into logs (aaa, bbb, ccc) values (?, ?, ?)", d.instance.query
    assert_equal keys, d.instance.keys
  end
end
