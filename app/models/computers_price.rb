class ComputersPrice < ApplicationRecord
	belongs_to :computer
	has_one :computers_trader

end
