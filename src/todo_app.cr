require "kemal"

require "./todo_app/*"

# TODO: Write documentation
module TodoApp
  get "/" do
    "Hello World!"
  end
end

Kemal.run
