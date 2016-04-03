class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :title
    end
  end
end
