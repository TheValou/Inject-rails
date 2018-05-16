class AddScreenFormatToComputers < ActiveRecord::Migration[5.1]
	def change
		add_column :computers, :screen_format, :string, default: nil
	end
end
