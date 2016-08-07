defmodule MyList do
    # from chapter 7
    def span(from, to) when from > to do
        []
    end
    def span(from, to) do
        [from | span(from+1, to)]
    end

    # chapter 10
    def prime_numbers(to) do
        for e <- span(2, to), prime?(e), do: e
    end

    def prime?(2), do: true

    def prime?(n) do
        Enum.all?(span(2, :math.sqrt(n)), &(rem(n, &1) !== 0))
    end
end