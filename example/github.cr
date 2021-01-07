require "../src/gql"
require "json"
require "http/client"

body = GQL.query do |q|
  q.viewer do
    q.login
    q.bio
    q.organizations(first: 3) do
      q.edges do
        q.org_node do
          q.name
        end
      end
    end
  end
end

puts body

client = HTTP::Client.new(URI.parse("https://api.github.com"))
client.tls.verify_mode = OpenSSL::SSL::VerifyMode::NONE
response = client.post(
  "/graphql",
  body: {"query" => body}.to_json,
  headers: HTTP::Headers{
    "Authorization" => "Basic " + Base64.strict_encode(ARGV[0] + ":" + ARGV[1]),
    "Content-Type" => "application/json",
    "Accept" => "application/json"
  }
)

pp JSON.parse(response.body)
