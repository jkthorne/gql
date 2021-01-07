require "../src/gql"
require "json"
require "http/client"

client = HTTP::Client.new(URI.parse("https://rickandmortyapi.com"))
client.tls.verify_mode = OpenSSL::SSL::VerifyMode::NONE
response = client.post(
  "/graphql",
  body: {"query" => GQL.query do |q|
    q.characters do
      q.results do
        q.name
      end
    end
  end
  }.to_json,
  headers: HTTP::Headers{
    "Accept-Encoding" => "gzip, deflate, br",
    "Content-Type" => "application/json",
    "Accept" => "application/json"
  }
)

puts JSON.parse response.body
