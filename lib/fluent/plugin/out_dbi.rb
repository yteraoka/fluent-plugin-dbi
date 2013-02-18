module Fluent

class DbiOutput < BufferedOutput
  Plugin.register_output('dbi', self)

  config_param :dsn, :string
  config_param :keys, :string
  config_param :db_user, :string
  config_param :db_pass, :string
  config_param :query, :string

  def initialize
    super

    require 'dbi'
  end

  def configure(conf)
    super

    @keys = @keys.split(",")
  end

  def format(tag, time, record)
    [tag, time, record].to_msgpack
  end

  def write(chunk)
    begin
      dbh = DBI.connect(@dsn, @db_user, @db_pass)
      dbh['AutoCommit'] = false
      sth = dbh.prepare(@query)
      chunk.msgpack_each { |tag, time, record|
        record.key?('time') || record['time'] = time
        record.key('tag') || record['tag'] = tag
        values = []
        @keys.each { |key|
          values.push(record[key])
        }
        rows = sth.execute(*values)
      }
    rescue
      dbh.rollback if dbh
      raise
    else
      sth.finish
      dbh.commit
    ensure
      dbh.disconnect if dbh
    end
  end
end

end
