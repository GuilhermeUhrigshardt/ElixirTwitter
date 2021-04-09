defmodule ElixirTwitter.FileEditor do

    def delete_last_tweet("", _), do: {:error, "Empty file name"}
    def delete_last_tweet(path) do
        #IO.puts(sentence)
        path
        |> File.stream!([:read])
        |> Enum.map(&String.trim/1)
        |> Enum.filter(&String.length(&1) <= 280)
        |> Enum.filter(&String.length(&1) > 0)
        # |> Enum.reject(fn line -> line == sentence end)
        |> List.delete_at(0)
        |> Enum.join("\n")
        |> (&(File.write(path, &1, [:raw]))).()
    end
end