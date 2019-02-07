defmodule Draft.Block do
  @moduledoc """
  Converts a single DraftJS block to html.
  """

  alias Draft.InlineStyleRange

  @doc """
  Renders the given DraftJS input as html.

  ## Examples
      iex> block = %{"key" => "1", "text" => "Hello", "type" => "unstyled",
      ...>   "depth" => 0,  "inlineStyleRanges" => [], "entityRanges" => [],
      ...>   "data" => %{}}
      iex> Draft.Block.to_html block
      "<p>Hello</p>"
  """
  def to_html(block) do
    process_block(block)
  end

  defp process_block(%{"type" => "unstyled",
                      "text" => "",
                      "key" => _,
                      "data" => _,
                      "depth" => _,
                      "entityRanges" => _,
                      "inlineStyleRanges" => _}) do
    "<br>"
  end

  defp process_block(%{"type" => "header-" <> header,
                      "text" => text,
                      "key" => _,
                      "data" => _,
                      "depth" => _,
                      "entityRanges" => _,
                      "inlineStyleRanges" => inline_style_ranges}) do
    tag = header_tags[header]
    "<#{tag}>#{InlineStyleRange.apply(text, inline_style_ranges)}</#{tag}>"
  end

  defp process_block(%{"type" => "blockquote",
                      "text" => text,
                      "key" => _,
                      "data" => _,
                      "depth" => _,
                      "entityRanges" => _,
                      "inlineStyleRanges" => inline_style_ranges}) do
    "<blockquote>#{InlineStyleRange.apply(text, inline_style_ranges)}</blockquote>"
  end

  defp process_block(%{"type" => "unstyled",
                      "text" => text,
                      "key" => _,
                      "data" => _,
                      "depth" => _,
                      "entityRanges" => _,
                      "inlineStyleRanges" => inline_style_ranges}) do
    "<p>#{InlineStyleRange.apply(text, inline_style_ranges)}</p>"
  end

  defp header_tags do
    %{
      "one"   => "h1",
      "two"   => "h2",
      "three" => "h3"
    }
  end
end
