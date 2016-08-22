defmodule CliTest do
    use ExUnit.Case

    import Issues.CLI, only: [parse_args: 1,
                              convert_to_list_of_hashdicts: 1,
                              sort_into_ascending_order: 1]

    test ":help returned by options -h and --help" do
        assert parse_args(["--help", "anything"]) == :help
        assert parse_args(["-h", "anything"]) == :help
    end

    test "user, project and count properly parsed" do
        assert parse_args(["user", "project", "99"]) == {"user", "project", 99}
    end

    test "default value for count returned" do
        assert parse_args(["user", "project"]) == {"user", "project", 4}
    end

    test "sorting ascending issues the correct way" do
        result = sort_into_ascending_order(fake_created_at(["c", "a", "b"]))
        issues = for issue <- result, do: issue["created_at"]
        assert issues == ~w{a b c}
    end

    defp fake_created_at(values) do
        data = for value <- values,
                do: [{"created_at", value}, {"other_data", "xxx"}]
        convert_to_list_of_hashdicts data
    end
end