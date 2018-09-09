defmodule CcbApiEx.Api.Base do

  defmacro __using__(_opts) do
    quote do

      require Logger

      def get(service) do
      	{:ok, url} = Confex.fetch_env(:ccb_api_ex, :host)
      	url = "#{url}?#{service}"

      	{:ok, user} = Confex.fetch_env(:ccb_api_ex, :user)
      	{:ok, pass} = Confex.fetch_env(:ccb_api_ex, :pass)

      	auth_creds = Base.encode64("#{user}:#{pass}")
      	headers = [{"Authorization", "Basic #{auth_creds}"}]
      	http_options = []

        Logger.debug("Executing a GET to #{url} ...")
    		case HTTPoison.get(url, headers, http_options) do
    		  {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
    		    #Logger.info("success body:  #{body}")
            body = String.replace(body, "\n", "")
            body = String.replace(body, "\t", "")
            {:ok, body}
    		  {:ok, %HTTPoison.Response{status_code: status, body: body}} ->
    		    #Logger.info("failure (#{status}) body:  #{body}")
            {:error, body}
    		  {:error, %HTTPoison.Error{reason: reason}} ->
    		    #Logger.error("error:  #{inspect reason}")
            {:error, reason}
    		end
      end

      def post(service, request) do
        {:ok, url} = Confex.fetch_env(:ccb_api_ex, :host)
        url = "#{url}?#{service}"

        body = request |> XmlBuilder.generate
        IO.puts("body:  #{body}")

        {:ok, user} = Confex.fetch_env(:ccb_api_ex, :user)
        {:ok, pass} = Confex.fetch_env(:ccb_api_ex, :pass)

        auth_creds = Base.encode64("#{user}:#{pass}")
        headers = [{"Authorization", "Basic #{auth_creds}"}]
        http_options = []

        tmp_file = "/tmp/#{UUID.uuid1()}"
        File.write!(tmp_file, body)
        form = [{:file, tmp_file}]
        body = {:multipart, form}

        try do
          Logger.debug("Executing a POST to #{url} ...")
          case HTTPoison.post(url, body, headers, http_options) do
            {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
              Logger.info("success body:  #{body}")
              :ok
            {:ok, %HTTPoison.Response{status_code: status, body: body}} ->
              Logger.info("failure (#{status}) body:  #{body}")
              {:error, body}
            {:error, %HTTPoison.Error{reason: reason}} ->
              Logger.error("error:  #{inspect reason}")
              {:error, reason}
          end
        after
          File.rm_rf(tmp_file)
        end
      end
    end
  end
end