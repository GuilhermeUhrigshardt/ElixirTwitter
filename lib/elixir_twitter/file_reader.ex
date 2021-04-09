defmodule ElixirTwitter.FileReader do

    @doc """
    This function will take the path to a file and find a
    string that can be tweeted out.

    It will trim all the strings, and then eliminate any
    strings that are larger than 280 characters.

    iex> ElixirTwitter.FileReader.get_strings_to_tweet("priv/test/doc.txt")
    "ABC"

    iex> ElixirTwitter.FileReader.get_strings_to_tweet("priv/test/too_long.txt")
    "hope this is the output"
    """
    def get_strings_to_tweet(path) do
        File.read!(path)
        |> pick_string
    end

    def pick_string(""), do: ""
    def pick_string(str) do
        str
        |> String.split("\n")
        |> Enum.map(&String.trim/1)
        |> Enum.filter(&String.length(&1) <= 280)
        |> Enum.filter(&String.length(&1) > 0)
        |> Enum.at(0)
    end
end