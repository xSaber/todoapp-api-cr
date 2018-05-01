require "clear"
require "dotenv"
require "kemal"

require "./todo_app/*"
require "./todo_app/migrations/*"
require "./todo_app/models/*"

Dotenv.load

Clear::SQL.init(ENV["DATABASE_URL"])
Clear::Migration::Manager.instance.apply_all

def wrap_data(data) : String
  { data: data }.to_json
end

after_all do |env|
  env.response.content_type = "application/json"
end

get "/todo-groups" do |env|
  wrap_data({
    todo_groups: TodoGroup.query.limit(10).map do |tg|
      { id: tg.id, title: tg.title }
    end
  })
end

post "/todo-groups" do |env|
  tg = TodoGroup.create({
    title: "Sample Todo Group"
  })

  wrap_data({
    todo_group: {
      id: tg.id,
      title: tg.title
    }
  })
end

Kemal.run
