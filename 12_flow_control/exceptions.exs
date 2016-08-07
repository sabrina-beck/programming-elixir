defmodule Util do
    def ok!({:ok, data}) do
        data
    end

    def ok!({_, information}) do
        raise "[Error] #{information}"
    end
end