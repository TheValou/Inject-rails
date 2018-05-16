class AddScreenTypeToComputers < ActiveRecord::Migration[5.1]
	def change
		add_column :computers, :screen_type, :string
		add_column :computers, :screen_resolution, :string, default: nil
		add_column :computers, :screen_refresh_rate, :integer, default: nil
		add_column :computers, :screen_size, :float, default: nil
	end
end
