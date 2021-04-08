defmodule ElixirTwitterTest do
  use ExUnit.Case
  doctest ElixirTwitter

  test "greets the world" do
    assert ElixirTwitter.hello() == :world
  end
end
