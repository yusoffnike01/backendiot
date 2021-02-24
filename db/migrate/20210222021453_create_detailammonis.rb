class CreateDetailammonis < ActiveRecord::Migration[6.1]
  def change
    create_table :detailammonis do |t|
      t.string :ID_Device
      t.integer :level

      t.timestamps
    end
  end
end
