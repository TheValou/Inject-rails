class Computer < ApplicationRecord

  has_many :computers_prices, :dependent => :destroy
  has_one :computers_activity
  has_one :computers_chipset
  has_one :computers_gpu
  has_one :computers_cpu
  has_one :computers_o

  has_many :computer_disks
  has_one :computers_brand

  COLOURS = [
    "gris",
    "rouge",
    "vert",
    "violet",
    "argent",
    "noir",
    "bleu"
  ]

  def string_difference_percent(a, b)
    longer = [a.size, b.size].max
    same = a.each_char.zip(b.each_char).select { |a,b| a == b }.size
    (longer - same) / a.size.to_f
  end

  def self.deduplicate(pc)

    search_pc = pc[:model].downcase
    COLOURS.each{|colour| search_pc = search_pc.gsub(colour,"")}

    model = Computer.where('lower(model) = ?', search_pc).first
    return model if model

    simil = Computer.where(cpu_id: pc[:cpu_id], gpu_id: pc[:gpu_id])
    simil.each do |c|
      return c if string_difference_percent(c.name, search_pv.donwcase) <= 0.35
    end

    return nil
  end


  def self.insert_pc(pc, trader)

    begin
      final = to_pc(pc)

      cprice = ComputersPrice.where(url: pc[:url]).first

      if !cprice

        c = deduplicate(pc) if deduplicate(pc) != nil
        c = create(final) if deduplicate(pc) == nil

        ComputersPrice.create(computer_id: c.id, url: pc[:url], pricing: {DateTime.now => pc[:price].to_i}, trader_id: trader, last_price: pc[:price].to_i)
      else
        # Mise à jour du price
        if cprice.pricing.to_a.last.last.to_i != pc[:price].to_i
          cprice.pricing[DateTime.now] = pc[:price]
          cprice.last_price = pc[:price]
          cprice.save!
        else
          cprice.update(last_price: pc[:price]) if cprice.last_price != pc[:price]
          cprice.update(trader_id: trader)
        end
        c = cprice.computer
      end
      # Mise à jour du PC en base
      to_update = update_fields(final, c)
      c.update(to_update)

    rescue Exception => e
      puts e
    end

  end

  def self.update_fields(final, pc)
    final[:model] = pc[:model] if final[:model] == "?"
    final[:model] = final[:model] if pc[:model] == "?"
    final[:model] = pc[:model] if pc[:model] != "?" && final[:model] != "?"

    final
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
    gpu = ComputersGpu.find(pc[:gpu_id])
    pc[:activity_id] = 2 if gpu && gpu.score > 35
    pc[:activity_id] = 3 if gpu && gpu.score < 8
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
    # ____________________________________



    # Webcam
    pc[:webcam] = pc_hash[:webcam] if pc_hash[:webcam]
    # ____________________________________



    # Réseau
    pc[:network] = pc_hash[:network] if pc_hash[:network]
    # ____________________________________



    # Titre
    pc[:model] = pc_hash[:model] ? pc_hash[:model].gsub("(","").gsub(")","").strip : "?"
    # ____________________________________



    # l'annonce du pc est active
    pc[:active] = true
    # ____________________________________



    # Disque durs
    #check_disk(pc_hash[:disk])

    #    p" Disques durs :"
    #    pp pc_hash[:disk]

    #    {:disk_name=>"eMMC 32 Go",
    # :disk_main=>"eMMC 32 Go",
    # :disk_secondary=>"Sans disque secondaire",
    # :disk_number=>"1",
    # :disk_number_max=>"2",
    # :disk_type=>"eMMC (Puce à mémoire Flash)",
    # :disk_interface=>nil}

    # ComputerDisk(id: integer, disk_type: integer, size: integer, interface: string, created_at: datetime, updated_at: datetime)
    # ____________________________________



    pc[:weight] = pc_hash[:weight] if pc_hash[:weight] # en kg
    pc[:width] = pc_hash[:width] if pc_hash[:width] #en mm
    pc[:length] = pc_hash[:length] if pc_hash[:length] #en mm
    pc[:height] = pc_hash[:height] if pc_hash[:height] #en mm



    # Connecteurs disponibles
    pc[:connector_available] = pc_hash[:connector_available] if pc_hash[:connector_available]
    # ____________________________________



    # Mémoire RAM du PC
    pc.merge!(pc_hash[:memory]) if pc_hash[:memory]
    # ____________________________________

    pc

  end

  private

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
    model = ComputersCpu.where('lower(name) = ?', cpu[:cpu_name].downcase).first
    model ||= ComputersCpu.create(name: cpu[:cpu_name])
    model.id
  end


  def self.check_gpu(gpu)
    return 1 if !gpu[:gpu_name]
    gpu[:gpu_name] = gpu[:gpu_name].gsub(/\(.+\)/,"").strip
    model = ComputersGpu.where('lower(name) = ?', gpu[:gpu_name].downcase).first
    model ||= ComputersGpu.create(name: gpu[:gpu_name])
    model.id
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
