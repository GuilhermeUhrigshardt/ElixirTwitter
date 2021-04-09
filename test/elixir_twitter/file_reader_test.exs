defmodule FileReaderTest do
    use ExUnit.Case
    import ElixirTwitter.FileReader
    import Mock

    doctest ElixirTwitter.FileReader
    test "Passing a file should return a string" do
        assert get_strings_to_tweet(
            Path.join("#{:code.priv_dir(:elixir_twitter)}", "sample.txt")
        ) != nil
    end

    test "Passing a file should ignore strings longer than 280 characters" do
        assert get_strings_to_tweet(
            Path.join("#{:code.priv_dir(:elixir_twitter)}", "/test/too_long.txt")
        ) 
        == "hope this is the output"
    end

    @tag watching: true
    test "Empty string should return an empty string" do
        with_mock File, [read!: fn(_) -> "" end] do
            assert pick_string("") == ""
        end
    end

    test "String longer than 280 chars should return nil" do
        assert pick_string("aklfjgndkslnfgkldsngfldksgksdlnglskdnbgklsdbfngklsdgbfaklfjgndkslnfgkldsngfldksgksdlnglskdnbgklsdbfngklsdgbfaklfjgndkslnfgkldsngfldksgksdlnglskdnbgklsdbfngklsdgbfaklfjgndkslnfgkldsngfldksgksdlnglskdnbgklsdbfngklsdgbfaklfjgndkslnfgkldsngfldksgksdlnglskdnbgklsdbfngklsdgbfaklfjgndksl")
        == nil
    end

    @tag watching: true
    test "The string should be trimmed" do
        with_mock File, [read!: fn(_) -> " ABC " end] do
            assert get_strings_to_tweet("") == "ABC"
        end
    end
end