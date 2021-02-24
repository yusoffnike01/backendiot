class CreateInfoammonis < ActiveRecord::Migration[6.1]
  def change
    create_table :infoammonis do |t|
      t.integer :levelammonia
      t.string :detail

      t.timestamps
    end
  end
end
