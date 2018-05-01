module TodoApp
  class Todo
    include Clear::Model
    self.table = "todos"

    with_serial_pkey

    column title : String
    column completed_at : Time

    belongs_to todo_group : TodoGroup
  end
end
