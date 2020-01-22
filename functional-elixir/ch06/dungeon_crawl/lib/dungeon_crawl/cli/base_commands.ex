defmodule DungeonCrawl.BaseCommands do
  alias Mix.Shell.IO, as: Shell

  def display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} ->
      Shell.info("#{index}  -  #{option}")
    end)

    options
  end

  def generate_question(options) do
    heroIndexes = Enum.join(1..Enum.count(options), ", ")
    "Which one?: [#{heroIndexes}]"
  end

  def generate_question_and_prompt(options) do
    options
    |> generate_question
    |> Shell.prompt()
  end

  def parse_answer(user_response) do
    {answer, _} = Integer.parse(user_response)
    answer - 1
  end

  def find_options(index, options) do
    Enum.at(options, index)
  end
end
