require 'sequel'
require 'singleton'

module Database
  class Connection
    include Singleton

    USER     = 'sebastianbarcelona'
    DATABASE = 'cuti'

    CONN_STRING = ENV['DATABASE_URL'] || "postgres://#{USER}@localhost/#{DATABASE}"

    def handler
      @db ||= Sequel.connect(CONN_STRING)
    end
  end
end