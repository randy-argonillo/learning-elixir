import File, only: [write: 3, read: 1]

defmodule TaskLists do
  @file_name "tasks.md"

  def add(task_name) do
    task_content = "[ ] #{task_name} \n"
    write(@file_name, task_content, [:append])
  end

  def show_lists() do
    read(@file_name)
  end
end
