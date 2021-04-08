use Mix.Config

config :elixir_twitter, ElixirTwitter.Scheduler, jobs: [
    {"* * * *", fn ->
        ElixirTwitter.FileReader.get_strings_to_tweet(
            Path.join("#{:code.priv_dir(:elixir_twitter)}", "sample.txt")
        )
        |> ElixirTwitter.TweetServer.tweet
    end }
]