require "../src/gql"

pp(
  GQL.client(
    uri: "https://api.github.com/graphql",
    headers: {"Authorization" => "Basic " + Base64.strict_encode(ARGV[0] + ":" + ARGV[1])},
    tls: false
  ).query do |q|
    q.viewer do
      q.login
      q.repositories(first: 3) do
        q.edges do
          q.node do
            q.name
            q.stargazers do
              q.totalCount
            end
            q.forks do
              q.totalCount
            end
            q.watchers do
              q.totalCount
            end
          end
        end
      end
    end
  end
)
