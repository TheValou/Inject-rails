class FnacScrap

  DOMAIN = "https://www.fnac.com"
  URL = "#{DOMAIN}/Tous-les-ordinateurs-portables/Ordinateurs-portables/nsh154425/w-4?IPageIndex="
  

  # On explore le site et on parcours toutes les pages contenant des PC 
  def self.explore 
    agent = Mechanize.new
    numpage = 1
    max = 0

    loop do 
      nb = 0
      page = agent.get(URL+numpage.to_s)
      max = page.search("li.pageView").text.match(/Page \d+ \/ (\d+)/)[1].to_i if max == 0
      page.search('.Article-desc a').each do |x|
        ad_url = x[:href]
        scrap_pc(ad_url)
      end
      break if numpage == max
      numpage += 1
    end
  end


  # On appelle la méthode pour récupérer les infos sur un PC 
  def self.scrap_pc(url)
    begin
      page = Mechanize.new.get(url)
    rescue Exception=>e
    end

    return if page.at(".f-buyBox-availabilityStatus-unavailable")

    pc = {}
    hash_main = {}
    hash_os = {}
    hash_cpu = {}
    hash_memory = {}
    hash_disk = {}
    hash_display = {}
    hash_keyboard = {}
    hash_network = {}
    hash_graphics = {}

    page.search('ul.Feature-list li').each do |x|
      hash_main[x.at('.Feature-label').text.gsub(/\s+/,' ').strip] = x.at('.Feature-desc').text.gsub(/\s+/,' ').strip
    end


    pc[:url] = url
    pc[:price] = Integer(page.search('.f-priceBox-price').last.text.gsub(/[[:space:]]/, '').to_i)
    pc[:title] = page.search('.f-productHeader-Title').text.gsub(/\s+/,' ').strip
    pc[:brand] = extract_from_hash(hash_main, "Constructeur")
    # pc[:model] = extract_from_hash(hash_main, "Modèle")


    # Informations sur le système d'exploitation
    #hash_os[:os_name] = extract_from_hash(hash_main, "Famille OS")
    hash_os[:os_family] = extract_from_hash(hash_main, "Système d'exploitation")
    # hash_os[:os_included] = extract_from_hash(hash_main, "Système d'exploitation fourni") == "Oui" ? true : false
    

    # Informations sur le processeur
    hash_cpu[:cpu_name] = extract_from_hash(hash_main, "Processeur")
    hash_cpu[:cpu_model] = extract_from_hash(hash_main, "CPU")
    hash_cpu[:cpu_model] = extract_from_hash(hash_main, "Processeur") if !hash_cpu[:cpu_model]
    # hash_cpu[:cpu_brand] = extract_from_hash(hash_main, "Marque processeur")
    hash_cpu[:cpu_frequency] = extract_from_hash(hash_main, "Fréquence du processeur")  


    # Informations sur la mémoire
    # hash_memory[:memory_strips] = extract_from_hash(hash_main, "Nombre de barrettes")
    hash_memory[:memory_size] = extract_from_hash(hash_main, "RAM installée")
    # p hash_memory[:memory_size]+"plop"
    hash_memory[:memory_size] = extract_from_hash(hash_main, "RAM") if !hash_memory[:memory_size]
    hash_memory[:memory_max_size] = extract_from_hash(hash_main, "Mémoire maximale")
    hash_memory[:memory_type] = extract_from_hash(hash_main, "Type de mémoire vive installée")


    # Informations sur le(s) disque(s) dur(s)
    #hash_disk[:disk_name] = extract_from_hash(hash_main, "Configuration disque(s)")
    hash_disk[:disk_main] = extract_from_hash(hash_main, "Stockage principal")
    # hash_disk[:disk_secondary] = extract_from_hash(hash_main, "Disque secondaire")
    # hash_disk[:disk_secondary] = "Non" if hash_disk[:disk_secondary].nil?
    # hash_disk[:disk_number] = extract_from_hash(hash_main, "Nombre de disques")
    # hash_disk[:disk_number_max] = extract_from_hash(hash_main, "Nombre de disques max")
    hash_disk[:disk_type] = extract_from_hash(hash_main, "Type de disque dur")
    # hash_disk[:disk_interface] = extract_from_hash(hash_main, "Interface du disque dur")


    # Informations sur l'écran
    # hash_display[:display_type] = extract_from_hash(hash_main, "Type d'écran")
    # hash_display[:display_resolution] = extract_from_hash(hash_main, "Résolution Max")
    # hash_display[:display_refresh_rate] = extract_from_hash(hash_main, "Taux de rafraîchissement")
    # hash_display[:display_screen_type] = extract_from_hash(hash_main, "Type d'écran")
    hash_display[:display_size] = extract_from_hash(hash_main, "Taille de l'écran")
    # hash_display[:display_format] = extract_from_hash(hash_main, "Format de l'écran")


    # Informations sur le clavier
    # hash_keyboard[:keyboard_type] = extract_from_hash(hash_main, "Norme du clavier")
    hash_keyboard[:keyboard_numpad] = extract_from_hash(hash_main, "Pavé numérique") == "Oui" ? true : false
    # hash_keyboard[:keyboard_light] = extract_from_hash(hash_main, "Clavier rétroéclairé") == "Oui" ? true : false
    # hash_keyboard[:keyboard_type] = extract_from_hash(hash_main, "Norme du clavier")


    # Informations sur la carte réseau
    hash_network[:network_norm] = extract_from_hash(hash_main, "Interface réseau")


    # Informations sur la carte graphique
    hash_graphics[:graphics_chipset] = extract_from_hash(hash_main, "Carte graphique")


    pc[:os] = hash_os
    pc[:cpu] = hash_cpu
    pc[:memory] = hash_memory
    pc[:disk] = hash_disk
    pc[:display] = hash_display
    pc[:keyboard] = hash_keyboard
    pc[:network] = hash_network
    pc[:gpu] = hash_graphics
    pc[:additionnal_informations] = hash_main
    Computer.insert_pc(pc, 4)
    
  end




  def self.extract_from_hash hash, key
    ret_value = ''
    if key.size > 0 && hash[key]
      ret_value = hash[key]
      hash.delete(key)
      return ret_value
    end
  end

end
