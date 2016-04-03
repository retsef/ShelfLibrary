class CreatePrints < ActiveRecord::Migration
  def change
    create_table :prints do |t|
      t.belongs_to :book, index: true
      t.belongs_to :publisher, index: true
      t.string :date
      t.string :note

      t.timestamps
    end
  end
end
