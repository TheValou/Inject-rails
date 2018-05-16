class Computer < ApplicationRecord


	def self.to_pc(pc_hash)
		pc = {}

		# ID de l'OS
		pc[:osid] = 1 if !pc_hash[:os][:os_included]

		c = ComputersO.create_with(name: pc_hash[:os][:os_name]).find_or_create_by(name: pc_hash[:os][:os_name])
		pc[:osid] = c.id if pc_hash[:os][:os_included]


		# Infos sur le clavier
		pc.merge!(pc_hash[:keyboard])


		# CPU du PC
		c = ComputersCpu.create_with(name: pc_hash[:cpu][:cpu_name]).find_or_create_by(name: pc_hash[:cpu][:cpu_name])
		pc[:cpuid] = c.id


		# Ecran du PC
		pc.merge!(pc_hash[:screen])	


		# GPU
		if pc_hash[:gpu][:gpu_name]
			c = ComputersGpu.create_with(name: pc_hash[:gpu][:gpu_name]).find_or_create_by(name: pc_hash[:gpu][:gpu_name])
			pc[:gpuid] = c.id
		else
			pc[:gpuid] = 1
		end


		# Activité 
		pc[:activityid] = 1


		# CHipset graphique
		if pc_hash[:Chipset]
			c = ComputersChipser.create_with(name: pc_hash[:Chipset]).find_or_create_by(name: pc_hash[:Chipset])
			pc[:chipsetid] = c.id
		else
			pc[:chipsetid] = 1
		end


		# Photo
		pc[:picture] = pc_hash[:main_photo] if pc_hash[:main_photo]


		# Titre
		pc[:model] = pc_hash[:model]


		pc[:active] = true


		# pc[:createdat] = DateTime.now
		# pc[:updatedat] = DateTime.now

		pp pc
		pc


		# hash_graphics[:graphics_chipset] = extract_from_hash(hash_main, "Chipset graphique")

	# :connector_available, :weight, :length, :width, :height, :memory_size, :memory_type, :memory_max_size, :storage_size, :storage_type, :network, :webcam, :active, :createdat, :updatedat)

end
end
