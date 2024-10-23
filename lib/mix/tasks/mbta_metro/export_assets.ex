defmodule Mix.Tasks.MbtaMetro.ExportAssets do
  @moduledoc "Copies CSS and Icons to the priv/static directory"

  @shortdoc "Copies CSS and Icons"

  use Mix.Task

  @impl Mix.Task
  def run(_) do
    export_css()
    export_icons()
  end

  defp export_css do
    dir = File.cwd!()

    Esbuild.run(:components, [])

    "cp #{dir}/assets/css/default.css #{dir}/priv/static/assets/default.css"
    |> Kernel.to_charlist()
    |> :os.cmd()

    "cat #{dir}/priv/static/assets/components.css >> #{dir}/priv/static/assets/default.css"
    |> Kernel.to_charlist()
    |> :os.cmd()
  end

  defp export_icons do
    dir = File.cwd!()

    "cp #{dir}/assets/node_modules/@fortawesome/fontawesome-free/svgs/**/*.svg #{dir}/priv/static/icons/"
    |> Kernel.to_charlist()
    |> :os.cmd()
  end
end
