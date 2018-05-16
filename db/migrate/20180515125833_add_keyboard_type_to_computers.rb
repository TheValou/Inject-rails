class AddKeyboardTypeToComputers < ActiveRecord::Migration[5.1]
  def change
  	    add_column :computers, :keyboard_type, :string
  	    add_column :computers, :keyboard_numpad, :boolean, default: nil
  	    add_column :computers, :keyboard_light, :boolean, default: nil
  end
end
