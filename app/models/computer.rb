class Computer < ApplicationRecord

	has_many :computers_prices, :dependent => :destroy
	has_one :computers_activity
	has_one :computers_chipset
	has_one :computers_gpu
	has_one :computers_cpu
	has_one :computers_o


	def self.to_pc(pc_hash)
		pc = {}

		# OS du PC
		pc[:os_id] = check_os(pc_hash[:os])
		# ____________________________________



		# Marque du PC
		pc[:brand_id] = check_brand(pc_hash[:brand], pc[:model])
		# ____________________________________



		# Infos sur le clavier
		pc.merge!(pc_hash[:keyboard])
		# ____________________________________



		# CPU du PC
		# pc[:cpu_id] = check_cpu(pc_hash[:cpu])
		c = ComputersCpu.create_with(name: pc_hash[:cpu][:cpu_name]).find_or_create_by(name: pc_hash[:cpu][:cpu_name])
		pc[:cpu_id] = c.id
		#check_cpu(pc_hash[:cpu])
		# ____________________________________



		# Ecran du PC
		pc.merge!(pc_hash[:screen])	
		# ____________________________________



		# GPU
		if pc_hash[:gpu][:gpu_name]
			c = ComputersGpu.create_with(name: pc_hash[:gpu][:gpu_name]).find_or_create_by(name: pc_hash[:gpu][:gpu_name])
			pc[:gpu_id] = c.id
		else
			pc[:gpu_id] = 1
		end
		# ____________________________________



		# Activité 
		pc[:activity_id] = 1
		# ____________________________________



		# CHipset graphique
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



		# Ativité du PC
		pc[:active] = true
		# ____________________________________



		# Disque durs
		#check_disk(pc_hash[:disk])
		# ____________________________________


		p "merde"
		# pp pc

		pc


		# pc[:connector_available]
		# pc[:weight]
		# pc[:length]
		# pc[:width]
		# pc[:height]
		

		# Mémoire RAM du PC
		# check_memory(pc_hash[:memory])
		# pc[:memory_size]
		# pc[:memory_type]
		# pc[:memory_max_size]
		# ____________________________________
		


		# pc[:storage_size]
		# pc[:storage_type]
		# pc[:network]
		# pc[:webcam]
		# pc[:active]
		# pc[]


	end

	private

	def self.check_os(os)
		return 1 if !os[:os_included]
		os[:os_name] = os[:os_name].downcase.gsub("microsoft","").strip 
		return ComputersO.create_with(name: os[:os_name]).find_or_create_by(name: os[:os_name]).id  if os[:os_included]
	end

	def self.check_cpu(cpu)
		return 1 if !os[:os_included]
		os[:os_name] = os[:os_name].downcase.gsub("microsoft","").strip 
		return ComputersO.create_with(name: os[:os_name]).find_or_create_by(name: os[:os_name]).id  if os[:os_included]
	end

	def self.check_brand(brand, model)
		if brand.nil? && !model.nil?
			brand_search = ComputersBrand.select{|x| model.match(/#{x.name}/)}
			return brand_search.first.id if brand_search.length > 0
			return 1 if brand_search.length < 1

		else
			brand = brand.downcase.strip if !brand.nil?

			# récupération apr nom de marque
			brand_search = ComputersBrand.where("name  ~* ?", "#{brand}")
			return brand_search.first.id if brand_search.count > 0
			return ComputersBrand.create(name: brand).id if brand_search.count < 1
		end
	end


end
