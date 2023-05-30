module Mutations
  class DeleteAuthorMutation < BaseMutation
    description "Delete an existing Author"
    # TODO: define return fields
    field :author, Types::AuthorType

    # TODO: define arguments
    argument :id, ID, required: true

    # TODO: define resolve method
    def resolve(id:)
      @author = Author.find(id).destroy

      return { author: nil }
    end
  end
end
