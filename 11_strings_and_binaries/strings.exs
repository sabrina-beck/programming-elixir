defmodule MyString do
    def ascii?([]) do
        true
    end

    def ascii?([head | tail]) when head in ?\s..?~ do
        ascii?(tail)
    end

    def ascii?([_head | _tail]) do
        false
    end
end