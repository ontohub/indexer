# frozen_string_literal: true

class UserIndexer
  def self.update(id)
    ::Index::UserIndex::User.import(id)
  end
end
