defmodule MyList do
    def len([]), do: 0
    def len([_head | tail]), do: 1 + len(tail)

    def square([]), do: []
    def square([head | tail]), do: [head * head | square(tail)] 

    def add_1([]), do: []
    def add_1([head | tail]), do: [head + 1 | add_1(tail)]

    def map([], _func), do: []
    def map([head | tail], func), do: [func.(head) | map(tail, func)]

    def sum([]), do: 0
    def sum([head | tail]), do: head + sum(tail)

    def reduce([], initial_value, _fun), do: initial_value
    def reduce([head | tail], initial_value, fun), do: reduce(tail, fun.(head, initial_value), fun)

    def mapsum([], _fun), do: 0
    def mapsum([head | tail], fun), do: fun.(head) + mapsum(tail, fun)

    def max([]), do: 0
    def max([head | tail]), do: _max(tail, head)

    defp _max([], max_until_now), do: max_until_now
    defp _max([head | tail], max_until_now) when head > max_until_now do
        _max(tail, head)
    end
    defp _max([head | tail], max_until_now) when head <= max_until_now do
        _max(tail, max_until_now)
    end

    def span(from, to) when from > to do
        []
    end
    def span(from, to) do
        [from | span(from+1, to)]
    end
end