class GQL::Client
  DEFAULT_HEADERS = HTTP::Headers{
    "Content-Type" => "application/json",
    "Accept" => "application/json",
  }

  getter uri : URI
  getter headers : HTTP::Headers
  getter http : HTTP::Client

  def initialize(@uri, headers : Hash(String, String), tls = true)
    @headers = DEFAULT_HEADERS.merge!(headers)
    @http = HTTP::Client.new(uri)
    @http.tls.verify_mode = OpenSSL::SSL::VerifyMode::NONE unless tls
  end

  def query
    gql = Query.new
    body = yield gql
    response = http.post(
      @uri.path,
      body: {query: gql.build}.to_json,
      headers: @headers,
    )
    JSON.parse(response.body)
  end
end
