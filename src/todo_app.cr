require "clear"
require "dotenv"
require "kemal"

require "./todo_app/**"

Dotenv.load

Clear::SQL.init(ENV["DATABASE_URL"])

# NOTE: this line applies new database migrations automatically
Clear::Migration::Manager.instance.apply_all

after_all do |env|
  env.response.content_type = "application/json"
end

module TodoApp
  get "/todo-groups" { |env| TodoGroupsHandler.new.index(env) }
  post "/todo-groups" { |env| TodoGroupsHandler.new.create(env) }
end

Kemal.run(ENV["PORT"].to_i)
