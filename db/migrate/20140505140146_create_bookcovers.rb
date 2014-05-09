class CreateBookcovers < ActiveRecord::Migration
  def change
    create_table :bookcovers do |t|
      t.string :meta_tags
      t.integer :user_id
      t.text :description

      t.timestamps
    end
  end
end
