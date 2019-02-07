defmodule Draft.InlineStyleRange do
  def apply(text, inline_style_ranges) do
    Enum.reduce(inline_style_ranges, text, fn range, acc ->
      text
      |> String.split_at(range["offset"] + range["length"])
      |> Tuple.to_list
      |> Enum.join("</span>")
      |> String.split_at(range["offset"])
      |> Tuple.to_list
      |> Enum.join("<span style=\"#{css(range["style"])}\">")
    end)
  end

  defp css("BOLD") do
    "font-weight: bold;"
  end
end
