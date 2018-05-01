module TodoApp
  class TodoGroupsHandler
    def index(env)
      groups = TodoGroup.query.limit(10).map do |tg|
        { id: tg.id, title: tg.title }
      end

      wrap_data({ todo_groups: groups })
    end

    def create(env)
      group = TodoGroup.create({
        title: "Sample Todo Group"
      })

      wrap_data({ todo_group: { id: group.id, title: group.title } })
    end

    private def wrap_data(data)
      { data: data }.to_json
    end
  end
end
