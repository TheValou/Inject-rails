class RemoveScreenidFromComputers < ActiveRecord::Migration[5.1]
	def change
		remove_column :computers, :screenId, :integer
	end
end
