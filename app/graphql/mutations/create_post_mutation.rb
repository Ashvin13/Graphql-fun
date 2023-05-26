module Mutations
  class CreatePostMutation < BaseMutation
    # TODO: define return fields
    field :post, Types::PostType, null: false

    # TODO: define arguments
    argument :title, String, required: true do
      description "The title field is string type and required for the create new post."
    end

    argument :body, String, required: true do
      description "The body field is also string and required for the create new post."
    end

    argument :author, Integer, required: true do
      description "The id of this post's author"
    end

    # TODO: define resolve method
    def resolve(title:, body:, author:)
      @post = Post.new(title: title, body: body, author: Author.find_by_id(author))

      if (@post.save)
        {
          post: @post,
          errors: []
        } else {
          post: nil,
          errors: @post.errors.full_messages
        }
      end
    end
  end
end
