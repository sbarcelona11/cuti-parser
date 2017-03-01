require_relative './connection'

class CreateDataQuery

  def initialize
    @db = Database::Connection.instance.handler
  end

  def run(data)
    @db[:cuti].insert({
                             name: data[:name],
                             email: data[:email],
                             url: data[:url]
                         })
  end

end