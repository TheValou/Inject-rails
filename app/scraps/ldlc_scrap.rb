class LdlcScrap #< MainScraper::Scrap

  DOMAIN = "http://www.ldlc.com"
  URL = "#{DOMAIN}/informatique/ordinateur-portable/pc-portable/c4265/"


  def self.explore 
    agent = Mechanize.new
    page = agent.get(URL)

    loop do  
      page.search('td.designation a.nom').each do |x|
        scrap_pc(x[:href])
      end
      next_link = page.search('link').map{|x| x if x[:rel] == "next"}.compact.first[:href] if page.search('link').map{|x| x if x[:rel] == "next"}.compact.length > 0
      break if next_link == '' || next_link.nil?
      page = agent.get(next_link)
    end


  end


  # On appelle la méthode pour récupérer les infos sur un PC 
  def self.scrap_pc(url)
    begin
      page = Mechanize.new.get(url)
    rescue Exception=>e
      return
    end

    pc = {}
    hash_main = {}
    hash_os = {}
    hash_cpu = {}
    hash_memory = {}
    hash_disk = {}
    hash_screen = {}
    hash_keyboard = {}
    hash_network = {}
    hash_graphics = {}

    page.search('table#productParametersList tr.odd').each do |x|
      hash_main[x.search('td.productParameter').text.gsub(/\s+/,' ').strip] = x.search('td.rowOdd').text.gsub(/\s+/,' ').strip
    end
    page.search('table#productParametersList tr.even').each do |x|
      hash_main[x.search('td.productParameter').text.gsub(/\s+/,' ').strip] = x.search('td.rowEven').text.gsub(/\s+/,' ').strip
    end

    pc[:url] = url
    pc[:price] = page.search('span.price.sale').text.gsub(/[[:space:]]/, '').to_f
    pc[:model] = page.search('span.fn.designation_courte').text
    pc[:brand] = extract_from_hash(hash_main, "Marque")
    pc[:model] = extract_from_hash(hash_main, "Désignation")


    # Informations sur le système d'exploitation
     #hash_os[:os_name] = extract_from_hash(hash_main, "Famille OS")
    hash_os[:os_name] = extract_from_hash(hash_main, "Système d'exploitation")
    hash_os[:os_included] = extract_from_hash(hash_main, "Système d'exploitation fourni") == "Oui" ? true : false
    

    # Informations sur le processeur
    hash_cpu[:cpu_name] = extract_from_hash(hash_main, "Type de processeur")
    hash_cpu[:cpu_model] = extract_from_hash(hash_main, "Processeur")
    hash_cpu[:cpu_brand] = extract_from_hash(hash_main, "Marque processeur")
    hash_cpu[:cpu_frequency] = extract_from_hash(hash_main, "Fréquence CPU")  


    # Informations sur la mémoire
    hash_memory[:memory_strips] = extract_from_hash(hash_main, "Nombre de barrettes")
    hash_memory[:memory_size] = extract_from_hash(hash_main, "Taille de la mémoire")
    hash_memory[:memory_max_size] = extract_from_hash(hash_main, "Taille de mémoire Max")
    hash_memory[:memory_type] = extract_from_hash(hash_main, "Type de mémoire")


    # Informations sur le(s) disque(s) dur(s)
    hash_disk[:disk_name] = extract_from_hash(hash_main, "Configuration disque(s)")
    hash_disk[:disk_main] = extract_from_hash(hash_main, "Disque dur")
    hash_disk[:disk_secondary] = extract_from_hash(hash_main, "Disque secondaire")
    hash_disk[:disk_secondary] = "Non" if hash_disk[:disk_secondary].nil?
    hash_disk[:disk_number] = extract_from_hash(hash_main, "Nombre de disques")
    hash_disk[:disk_number_max] = extract_from_hash(hash_main, "Nombre de disques max")
    hash_disk[:disk_type] = extract_from_hash(hash_main, "Type de Disque")
    hash_disk[:disk_interface] = extract_from_hash(hash_main, "Interface du disque dur")


    # Informations sur l'écran
    hash_screen[:screen_type] = extract_from_hash(hash_main, "Type d'écran")
    hash_screen[:screen_resolution] = extract_from_hash(hash_main, "Résolution Max")
    hash_screen[:screen_refresh_rate] = extract_from_hash(hash_main, "Taux de rafraîchissement")
    hash_screen[:screen_size] = extract_from_hash(hash_main, "Taille de l'écran")
    hash_screen[:screen_format] = extract_from_hash(hash_main, "Format de l'écran")


    # Informations sur le clavier
    hash_keyboard[:keyboard_type] = extract_from_hash(hash_main, "Norme du clavier")
    hash_keyboard[:keyboard_numpad] = extract_from_hash(hash_main, "Pavé numérique") == "Oui" ? true : false
    hash_keyboard[:keyboard_light] = extract_from_hash(hash_main, "Clavier rétroéclairé") == "Oui" ? true : false


    # Informations sur la carte réseau
    hash_network[:network_norm] = extract_from_hash(hash_main, "Norme(s) réseau")


    # Informations sur la carte graphique
    hash_graphics[:gpu_name] = extract_from_hash(hash_main, "Chipset graphique")

    hash_graphics[:gpu_name] = hash_graphics[:gpu_name].match(/2 x (.+)/)[1] + "SLI" if hash_graphics[:gpu_name].match(/2 x (.+)/)

    #On regroupe toutes les infos dans un hash
    pc[:additionnal_informations] = hash_main
    pc[:os] = hash_os
    pc[:cpu] = hash_cpu
    pc[:memory] = hash_memory
    pc[:disk] = hash_disk
    pc[:screen] = hash_screen
    pc[:keyboard] = hash_keyboard
    pc[:network] = hash_network
    pc[:gpu] = hash_graphics
    pc[:webcam] = (extract_from_hash(hash_main, "Webcam").match(/oui/i) ? true : false) rescue nil
    pc[:main_photo] = page.search('div#productphoto a').first[:href]

    pc[:weight] = (extract_from_hash(hash_main, "Poids").gsub(",",".").to_f) rescue nil
    pc[:width] = (extract_from_hash(hash_main, "Largeur").gsub(",",".").to_f) rescue nil
    pc[:length] = (extract_from_hash(hash_main, "Profondeur").gsub(",",".").to_f) rescue nil
    pc[:height] = (extract_from_hash(hash_main, "Epaisseur Arrière").gsub(",",".").to_f) rescue nil
    
    # Objet final pour le Computer
    Computer.insert_pc(pc, 3)

  end


  # Extraire une valeur d'un hash
  def self.extract_from_hash hash, key
    ret_value = ''
    if key.size > 0 && hash[key]
      ret_value = hash[key]
      hash.delete(key)
      return ret_value
    end
  end

end