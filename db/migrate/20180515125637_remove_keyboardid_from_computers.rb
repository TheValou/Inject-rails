class RemoveKeyboardidFromComputers < ActiveRecord::Migration[5.1]
  def change
  	    remove_column :computers, :keyboardid, :integer
  end
end
