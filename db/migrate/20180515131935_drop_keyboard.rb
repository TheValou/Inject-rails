class DropKeyboard < ActiveRecord::Migration[5.1]
  def change
  	drop_table :computers_keyboards
  end
end
