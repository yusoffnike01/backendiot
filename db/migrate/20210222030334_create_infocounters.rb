class CreateInfocounters < ActiveRecord::Migration[6.1]
  def change
    create_table :infocounters do |t|
      t.integer :levelcount
      t.string :detail

      t.timestamps
    end
  end
end
