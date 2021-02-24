class CreateCounters < ActiveRecord::Migration[6.1]
  def change
    create_table :counters do |t|
      t.string :ID_Device
      t.string :location

      t.timestamps
    end
  end
end
