defmodule MyEnum do
    def all?([], _predicate) do
        true
    end

    def all?([head | tail], predicate) do
        predicate.(head) && all?(tail, predicate)
    end

    def each([], _function) do
    end

    def each([head | tail], function) do
        function.(head)
        each(tail, function)
    end

    def filter([], _function) do
        []
    end

    def filter([head | tail], function) do
        if function.(head) do
            [head] ++ filter(tail, function)
        else
            filter(tail, function)
        end
    end

    def take(list, n) do
        _take(list, n, 0)
    end

    defp _take([], _n, _acc) do
        []
    end

    defp _take([head | tail], n, acc) do
        if acc < n do
            acc = acc + 1
            [head] ++ _take(tail, n, acc)
        else
            []
        end
    end

    def split(list, n) do
        _split(list, n, 1)
    end

    defp _split([], _n, _acc) do
        []
    end

    defp _split([head | tail], n, acc) do
        if acc == 1 do
            [[head] ++ take(tail, n - 1)] ++ _split(tail, n, acc+1)
        else
            if acc < n do
                _split(tail, n, acc+1)
            else
                _split(tail, n, 1)
            end
        end
    end

    def flatten([head = [_subhead | _subtail] | tail]) do
        flatten(head) ++ flatten(tail)        
    end

    def flatten([head | tail]) do
        [head] ++ flatten(tail)
    end

    def flatten([]) do
        []
    end
end