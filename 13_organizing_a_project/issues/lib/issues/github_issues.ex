defmodule Issues.GithubIssues do
  require Logger

   @github_url Application.get_env(:issues, :github_url)

   def fetch(user, project) do
      Logger.info "Fetching user #{user}'s project #{project}"
      issues_url(user, project)
          |> HTTPoison.get
          |> handle_response
   end

   defp issues_url(user, project) do
      "#{@github_url}/repos/#{user}/#{project}/issues"
   end

   defp handle_response({:ok, %HTTPoison.Response{status_code: 200, body: body}}) do
      Logger.info "Successful response"
      {:ok, :jsx.decode(body)}
   end

   defp handle_response({:ok, %HTTPoison.Response{status_code: 404, body: body}}) do
      Logger.warn "Project not found"
      {:not_found, :jsx.decode(body)}
   end

   defp handle_response({:error, %HTTPoison.Error{reason: reason}}) do
      Logger.error "Error #{reason} returned"
      {:error, reason}
   end
end