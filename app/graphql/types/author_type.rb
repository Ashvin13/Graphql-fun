# frozen_string_literal: true

module Types
  class AuthorType < Types::BaseObject
    field :id, ID, null: false do
      description "This is the author's id."
    end
    field :name, String, null: true do
      description "This is the name of the author."
    end
    field :post, [Types::PostType], null: true do
      description "This is the author's posts form object."
    end
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false do
      description "The date/time that this author was created at."
    end
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false do
      description "The date/time that this author was last updated at."
    end
  end
end
