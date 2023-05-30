module Mutations
  class DeletePostMutation < BaseMutation
    description "Deletes an existing Post"
    # TODO: define return fields
    field :post, Types::PostType

    # TODO: define arguments
    argument :id, ID, required: true

    # TODO: define resolve method
    def resolve(id:)
      @post = Post.find(id).destroy

      return { post: nil }
    end
  end
end
