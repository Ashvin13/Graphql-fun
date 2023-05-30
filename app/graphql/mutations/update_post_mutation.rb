module Mutations
  class UpdatePostMutation < BaseMutation
    description "Update an existing Post"
    # TODO: define return fields
    field :post, Types::PostType, null: false

    # TODO: define arguments
    argument :id, ID, required: true
    argument :title, String, required: true
    argument :body, String, required: true
    argument :author_id, Integer, required: false

    # TODO: define resolve method
    def resolve(id:, **args)
      @post = Post.find(id)

      if (@post.update(args))
        success_response(@post)
      else
        failed_response(@post)
      end
    end

    private

    def success_response(post)
      {
        success: true,
        errors: [],
        post: post
      }
    end

    def failed_response(post)
      {
        success: false,
        errors: post.errors.full_messages
      }
    end
  end
end
