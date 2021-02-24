class AddAmmoniIdToDetailammoni < ActiveRecord::Migration[6.1]
  def change
    add_column :detailammonis, :ammoni_id, :integer
  end
end
