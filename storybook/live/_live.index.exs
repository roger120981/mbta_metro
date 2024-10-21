defmodule Storybook.Live.Index do
  @moduledoc false

  use PhoenixStorybook.Index

  def folder_name, do: "Live"
  def folder_open?, do: false

  def date_picker, do: [name: "Date picker"]
  def entry("map"), do: [name: "Map"]
end
