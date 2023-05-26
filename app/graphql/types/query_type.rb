module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :posts, [Types::PostType], null: false do
      description "Query that selects all posts."
    end

    field :post, Types::PostType, null: false do
      description "Query that select specific post."
      argument :id, ID, required: true
    end

    field :postsCount, Integer, null: false do
      description "Query that return the total number of the posts."
    end

    field :authorPosts, [Types::PostType], null: false do
      description "Query that return all posts of the specific author"
      argument :author_id, Integer, required: true
    end

    def posts
      Post.all
    end

    def post(id:)
      Post.find(id)
    end

    def postsCount
      Post.count
    end

    def authorPosts(author_id:)
      Post.where(author_id: author_id)
    end


    # Authors Query Types

    field :authors, [Types::AuthorType], null: false do
      description "Query that selects all authors."
    end

    field :author, Types::AuthorType, null: false do
      description "Query that select specific author and return the data."
      argument :id, ID, required: true
    end

    field :authorCount, Integer, null: false do
      description "Query that return the total number of the authors."
    end

    def authors
      Author.all
    end

    def author(id:)
      Author.find(id)
    end

    def authorCount
      Author.count
    end
  end
end
