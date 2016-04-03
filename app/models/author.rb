class Author < ActiveRecord::Base
  has_many :writers
  has_many :books, through: :writers
end