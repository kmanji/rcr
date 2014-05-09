class AddCoverToBookcover < ActiveRecord::Migration
  def change
    add_column :bookcovers, :cover, :string
  end
end
