use Mix.Config

config :elixir_twitter, ElixirTwitter.Scheduler, jobs: [
    {"* * * *", fn ->
        sentence = ElixirTwitter.FileReader.get_strings_to_tweet(
            Path.join("#{:code.priv_dir(:elixir_twitter)}", "sample.txt")
        )
        # Send tweet
        ElixirTwitter.TweetServer.tweet(sentence)

        # Delete sent tweet
        ElixirTwitter.FileEditor.delete_last_tweet(
            Path.join("#{:code.priv_dir(:elixir_twitter)}", "sample.txt"),
            sentence
        )
    end 
    }
]