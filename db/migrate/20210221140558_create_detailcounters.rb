class CreateDetailcounters < ActiveRecord::Migration[6.1]
  def change
    create_table :detailcounters do |t|
      t.string :ID_Device
      t.integer :count

      t.timestamps
    end
  end
endstring
