class DropComputersScreen < ActiveRecord::Migration[5.1]
	def change
		drop_table :computers_screens
	end
end
