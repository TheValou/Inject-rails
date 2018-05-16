class CreateComputerDisks < ActiveRecord::Migration[5.1]
  def change
    create_table :computer_disks do |t|
      t.integer :disk_type, default: 1
      t.integer :size, default: nil
      t.string :interface

      t.timestamps
    end
  end
end
