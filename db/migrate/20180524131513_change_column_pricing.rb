class ChangeColumnPricing < ActiveRecord::Migration[5.1]
	def change
		add_column :computers_prices, :last_price, :integer
	end
end
