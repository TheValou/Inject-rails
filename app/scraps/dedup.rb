

pins =   ComputersO.group(:name).having('count("name") > 1').count(:name)

# Iterate on each grouped item to destroy duplicate

pins.each do |key, value|

  # Keep one and return rest of the duplicate records

  duplicates = ComputersO.where(name: key)[1..value-1]

  puts "#{key} = #{duplicates.count}"

  # Destroy duplicates and their dependents

  duplicates.each(&:destroy)

end 

