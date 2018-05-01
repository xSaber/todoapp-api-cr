class TodoGroup
  include Clear::Model
  self.table = "todo_groups"

  with_serial_pkey

  column title : String

  has_many todos : Todo
end
