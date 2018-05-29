module ComputersHelper

def zto_pc(pc_hash)
		pc = {}

		# OS du PC
		pc[:os_id] = check_os(pc_hash[:os])
		# ____________________________________



		# Marque du PC
		pc[:brand_id] = check_brand(pc_hash[:brand], pc[:model])
		# ____________________________________



		# Infos sur le clavier
		pc.merge!(pc_hash[:keyboard]) if pc_hash[:keyboard]
		# ____________________________________



		# CPU du PC
		pc[:cpu_id] = check_cpu(pc_hash[:cpu])
		# ____________________________________



		# GPU du PC
		pc[:gpu_id] = check_gpu(pc_hash[:gpu])
		p" naani ??!"
		# ____________________________________



		# Ecran du PC
		pc.merge!(pc_hash[:screen]) if pc_hash[:screen]
		# ____________________________________



		# Activité (à améliorer)
		pc[:activity_id] = 1
		# ____________________________________



		# Chipset graphique
		if pc_hash[:Chipset]
			c = ComputersChipser.create_with(name: pc_hash[:Chipset]).find_or_create_by(name: pc_hash[:Chipset])
			pc[:chipset_id] = c.id
		else
			pc[:chipset_id] = 1
		end
		# ____________________________________



		# Photo
		pc[:picture] = pc_hash[:main_photo] if pc_hash[:main_photo]
		pc[:webcam] = pc_hash[:webcam] if pc_hash[:webcam]
		# ____________________________________



		# Titre
		pc[:model] = pc_hash[:model] ? pc_hash[:model] : "?"
		# ____________________________________



		# l'annonce du pc est active
		pc[:active] = true
		# ____________________________________



		# Disque durs
		#check_disk(pc_hash[:disk])
		# ____________________________________


		
		pc[:weight] = pc_hash[:weight] if pc_hash[:weight] # en kg
		pc[:width] = pc_hash[:width] if pc_hash[:width] #en mm
		pc[:length] = pc_hash[:length] if pc_hash[:length] #en mm
		pc[:height] = pc_hash[:height] if pc_hash[:height] #en mm

		pc


		# pc[:connector_available]
		

		# Mémoire RAM du PC
		# check_memory(pc_hash[:memory])
		# pc[:memory_size]
		# pc[:memory_type]
		# pc[:memory_max_size]
		# ____________________________________
		


		# pc[:storage_size]
		# pc[:storage_type]
		# pc[:network]


	end
	def self.mabite
		puts "la voila !"
	end
end
