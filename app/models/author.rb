class Author < ApplicationRecord
  has_many :books

  def author_name
    name
  end
end
