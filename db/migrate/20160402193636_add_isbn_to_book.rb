class AddIsbnToBook < ActiveRecord::Migration
  def change
    add_column :books, :isbn_code, :string
  end
end
