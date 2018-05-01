class AddTodosAndTodoGroups1
  include Clear::Migration

  def change(dir)
    dir.up { }

    create_table "todo_groups" do |t|
      t.string "title", null: false
    end

    create_table "todos" do |t|
      t.string "title", null: false
      t.time   "completed_at"

      t.references to: "todo_groups", on_delete: "cascade", null: false
    end
  end
end
