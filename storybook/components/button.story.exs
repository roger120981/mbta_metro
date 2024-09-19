defmodule Storybook.Components.Button do
  @moduledoc false

  use PhoenixStorybook.Story, :component

  alias MbtaMetro.Components.Button

  def function, do: &Button.button/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          "default"
        ],
        description: "Default"
      }
    ] ++ color_variations()
  end

  defp color_variations do
    ~w[blue green orange purple red silver yellow]
    |> Enum.map(&color_variation/1)
  end

  defp color_variation(color) do
    %Variation{
      id: String.to_atom(color),
      attributes: %{
        color: color
      },
      slots: [
        color
      ],
      description: String.capitalize(color)
    }
  end
end
