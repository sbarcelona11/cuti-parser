task default: 'test:all'

task :migrations do
  Dir.chdir(File.dirname(__FILE__)) # Go back to file's current directoy. Might have been changed by other rake task.
  require './db/connection'
  `sequel -m ./db/migration #{Database::Connection::CONN_STRING}`
end

task :run do
  `ruby main.rb`
end