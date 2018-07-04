class Computer < ApplicationRecord

	has_many :computers_prices, :dependent => :destroy
	has_one :computers_activity
	has_one :computers_chipset
	has_one :computers_gpu
	has_one :computers_cpu
	has_one :computers_o

	has_many :computer_disks
	has_one :computers_brand


	def self.deduplicate(pc)


		search_pc = pc[:model].gsub("(","").gsub(")","")#.gsub("-", " ")

		model = ComputersG.where('lower(name) = ?', search_pc.downcase).first
		return model if model

		# Computers.where(cpu_id: pc[:cpu_id], cpu_id: pc[:cpu_id])
		# Computers.where(gpu_id: pc[:gpu_id], gpu_id: pc[:gpu_id])


	end


	def self.insert_pc(pc, trader)

		begin
			final = to_pc(pc)

			# deduplicate(final)

			cprice = ComputersPrice.where(url: pc[:url]).first

			if !cprice

				c = deduplicate(pc) > 0 ? deduplicate(pc) : create(final)
				ComputersPrice.create(computer_id: c.id, url: pc[:url], pricing: {DateTime.now => pc[:price].to_i}, trader_id: trader, last_price: pc[:price].to_i)
			else
        		# Mise à jour du price
        		if cprice.pricing.to_a.last.last.to_i != pc[:price]
        			cprice.pricing[DateTime.now] = pc[:price]
        			cprice.last_price = pc[:price]
        			cprice.save!
        		else
        			cprice.update(last_price: pc[:price]) if cprice.last_price != pc[:price]
        			cprice.update(trader_id: trader)
        		end

        		# Mise à jour du PC en base
        		cprice.computer.update(final)



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
		pc[:activity_id] = 2 if ComputersGpu.find(pc[:gpu_id]).score > 35
		pc[:activity_id] = 3 if ComputersGpu.find(pc[:gpu_id]).score < 8
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

		pp pc
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


		ComputersO::OS.each do |k,v|
			if v.all?{ |word| os[:os_name].match(/#{word}/i) }
				os[:os_name] = k 
				break
			end
		end

		os[:os_name] = os[:os_name].gsub(/microsoft/i,"").strip

		model = ComputersO.where('lower(name) = ?', os[:os_name].downcase).first
		model ||= ComputersO.create(name: os[:os_name])
		model.id
	end

	def self.check_cpu(cpu)
		return 1 if !cpu[:cpu_name]
		cpu[:cpu_name] = cpu[:cpu_name].gsub(/\(.+\)/,"").strip
		return ComputersCpu.create_with(name: cpu[:cpu_name]).find_or_create_by(name: cpu[:cpu_name]).id
	end

	def self.check_gpu(gpu)
		return 1 if !gpu[:gpu_name]
		model = ComputersGpu.where('lower(name) = ?', gpu[:gpu_name].downcase).first
		model ||= ComputersGpu.create(name: gpu[:gpu_name])
		model.id
		#return ComputersGpu.create_with(name: gpu[:gpu_name]).find_or_create_by(name: gpu[:gpu_name]).id
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
