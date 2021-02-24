class AddCounterIdToDetailcounter < ActiveRecord::Migration[6.1]
  def change
    add_column :detailcounters, :counter_id, :integer
  end
end
