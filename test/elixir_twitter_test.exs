defmodule ElixirTwitterTest do
  use ExUnit.Case
  doctest ElixirTwitter

  test "greets the world" do
    assert ElixirTwitter.hello() == :world
  end

  @tag watching: true
  test "another test" do
    assert 2 + 2 == 4
  end
end
