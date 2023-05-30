module Mutations
  class UpdateAuthorMutation < BaseMutation
    description "Update an existing Author"
    # TODO: define return fields
    field :author, Types::AuthorType, null: false

    # TODO: define arguments
    argument :id, ID, required: true
    argument :name, String, required: true

    # TODO: define resolve method
    def resolve(id:, **args)
      @author = Author.find(id)

      if @author.update(args)
        success_response(@author)
      else
        failed_response(@author)
      end
    end

    private

    def success_response(author)
      {
        success: true,
        errors: [],
        author: author
      }
    end

    def failed_response(author)
      {
        success: false,
        errors: author.errors.full_messages
      }
    end
  end
end
