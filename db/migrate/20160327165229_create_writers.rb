class CreateWriters < ActiveRecord::Migration
  def change
    create_table :writers do |t|
      t.belongs_to :book, index: true
      t.belongs_to :author, index: true

      t.timestamps
    end
  end
end
