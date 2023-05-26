module Mutations
  class CreateAuthorMutation < BaseMutation
    # TODO: define return fields
    field :author, Types::AuthorType, null: false

    # TODO: define arguments
    argument :name, String, required: true

    # TODO: define resolve method
    def resolve(name:)
      @author = Author.new(name: name)

      if (@author.save)
        {
          author: @author,
          errors: []
        } else {
          author: nil,
          errors: @author.errors.full_messages
        }
      end
    end
  end
end
