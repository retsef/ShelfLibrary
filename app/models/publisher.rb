class Publisher < ActiveRecord::Base
  has_many :prints
  has_many :books, through: :prints
end