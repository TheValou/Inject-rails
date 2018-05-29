class Computer < ApplicationRecord

	has_many :computers_prices, :dependent => :destroy
	has_one :computers_activity
	has_one :computers_chipset
	has_one :computers_gpu
	has_one :computers_cpu
	has_one :computers_o


	def self.insert_pc(pc)

		begin
			final = to_pc(pc)

			cprice = ComputersPrice.where(url: pc[:url])

			if cprice.count < 1
				c = create(final)
				ComputersPrice.create(computer_id: c.id, url: pc[:url], pricing: {DateTime.now => pc[:price].to_i}, trader_id: 3, last_price: pc[:price].to_i)
			else
        		# Mise à jour du price
        		if cprice.first.pricing.to_a.last.last.to_i != pc[:price]
        			cprice.first.pricing[DateTime.now] = pc[:price]
        			cprice.first.last_price = pc[:price]
        			cprice.first.save!
        		else
        			cprice.first.update(last_price: pc[:price]) if cprice.first.last_price != pc[:price]
        		end

        		# Mise à jour du PC en base
        		cprice.first.computer.update(final)

        	end
        rescue Exception => e
        	puts e
        end

    end

    def self.to_pc(pc_hash)
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

	private

	def self.check_memory

	end
	
	def self.check_os(os)
		return 1 if !os[:os_included]
		os[:os_name] = os[:os_name].downcase.gsub("microsoft","").strip 
		return ComputersO.create_with(name: os[:os_name]).find_or_create_by(name: os[:os_name]).id  if os[:os_included]
	end

	def self.check_cpu(cpu)
		return 1 if !cpu[:cpu_name]
		return ComputersCpu.create_with(name: cpu[:cpu_name]).find_or_create_by(name: cpu[:cpu_name]).id
	end

	def self.check_gpu(gpu)
		return 1 if !gpu[:gpu_name]
		return ComputersGpu.create_with(name: gpu[:gpu_name]).find_or_create_by(name: gpu[:gpu_name]).id
	end

	def self.check_brand(brand, model)
		if brand.nil? && !model.nil?
			brand_search = ComputersBrand.select{|x| model.match(/#{x.name}/)}
			return brand_search.first.id if brand_search.length > 0
			return 1 if brand_search.length < 1

		else
			brand = brand.downcase.strip if !brand.nil?
			brand_search = ComputersBrand.where("name  ~* ?", "#{brand}")
			return brand_search.first.id if brand_search.count > 0
			return ComputersBrand.create(name: brand).id if brand_search.count < 1
		end
	end


end
