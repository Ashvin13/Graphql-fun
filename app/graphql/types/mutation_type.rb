module Types
  class MutationType < Types::BaseObject
    field :delete_author_mutation, mutation: Mutations::DeleteAuthorMutation
    field :update_author_mutation, mutation: Mutations::UpdateAuthorMutation
    field :delete_post_mutation, mutation: Mutations::DeletePostMutation
    field :update_post_mutation, mutation: Mutations::UpdatePostMutation
    field :create_post_mutation, mutation: Mutations::CreatePostMutation
    field :create_author_mutation, mutation: Mutations::CreateAuthorMutation
  end
end
