defmodule ElixirTwitter.FileReader do
    def get_strings_to_tweet(path) do
        File.read!(path)
        |> String.split("\n")
        |> Enum.map(&String.trim/1)
        |> Enum.filter(&String.length(&1) <= 280)
        |> Enum.at(0)
    end

    def delete_tweeted_string() do
        
    end
end