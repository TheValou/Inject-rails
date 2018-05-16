class ChangeDatetimeComputers < ActiveRecord::Migration[5.1]
  def change
  	    rename_column :computers, :createdat, :created_at
  	    rename_column :computers, :updatedat, :updated_at
  end
end
