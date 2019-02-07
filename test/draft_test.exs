defmodule DraftTest do
  use ExUnit.Case
  doctest Draft

  test "generate a <p>" do
    input = %{"entityMap"=>%{},"blocks"=>[%{"key"=>"9d21d","text"=>"Hello","type"=>"unstyled","depth"=>0,"inlineStyleRanges"=>[],"entityRanges"=>[],"data"=>%{}}]}
    output = "<p>Hello</p>"
    assert Draft.to_html(input) == output
  end

  test "generate a <h1>" do
    input = %{"entityMap"=>%{},"blocks"=>[%{"key"=>"9d21d","text"=>"Hello","type"=>"header-one","depth"=>0,"inlineStyleRanges"=>[],"entityRanges"=>[],"data"=>%{}}]}
    output = "<h1>Hello</h1>"
    assert Draft.to_html(input) == output
  end

  test "generate a <h2>" do
    input = %{"entityMap"=>%{},"blocks"=>[%{"key"=>"9d21d","text"=>"Hello","type"=>"header-two","depth"=>0,"inlineStyleRanges"=>[],"entityRanges"=>[],"data"=>%{}}]}
    output = "<h2>Hello</h2>"
    assert Draft.to_html(input) == output
  end

  test "generate a <h3>" do
    input = %{"entityMap"=>%{},"blocks"=>[%{"key"=>"9d21d","text"=>"Hello","type"=>"header-three","depth"=>0,"inlineStyleRanges"=>[],"entityRanges"=>[],"data"=>%{}}]}
    output = "<h3>Hello</h3>"
    assert Draft.to_html(input) == output
  end

  test "generate a <blockquote>" do
    input = %{"entityMap"=>%{},"blocks"=>[%{"key"=>"9d21d","text"=>"Hello","type"=>"blockquote","depth"=>0,"inlineStyleRanges"=>[],"entityRanges"=>[],"data"=>%{}}]}
    output = "<blockquote>Hello</blockquote>"
    assert Draft.to_html(input) == output
  end

  test "generate a <br>" do
    input = %{"entityMap"=>%{},"blocks"=>[%{"key"=>"9d21d","text"=>"","type"=>"unstyled","depth"=>0,"inlineStyleRanges"=>[],"entityRanges"=>[],"data"=>%{}}]}
    output = "<br>"
    assert Draft.to_html(input) == output
  end

  test "wraps bold text" do
    input = %{"entityMap"=>%{},"blocks"=>[%{"text"=>"Hello","inlineStyleRanges"=>[%{"style"=>"BOLD","offset"=>2,"length"=>2}],"type"=>"unstyled","depth"=>0,"entityRanges"=>[],"data"=>%{},"key"=>"9d21d"}]}
    output = "<p>He<span style=\"font-weight: bold;\">ll</span>o</p>"
    assert Draft.to_html(input) == output
  end
end
