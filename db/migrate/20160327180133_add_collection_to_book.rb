class AddCollectionToBook < ActiveRecord::Migration
  def change
    add_reference :books, :collection, index: true
  end
end
