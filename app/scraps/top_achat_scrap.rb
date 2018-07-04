class TopAchatScrap

  DOMAIN = "https://www.topachat.com"
  URL = "#{DOMAIN}/pages/produits_cat_est_ordinateurs_puis_rubrique_est_wport_puis_page_est_PAGE.html"


  def self.explore 
    agent = Mechanize.new
    current = 1
    page = agent.get(URL.gsub("PAGE", current.to_s))

    number_max = page.search('nav.pagination a').map{|x| x.text.match(/...(\d+)/)[1] if x.text.match(/...(\d+)/)}.compact.last.to_i if page.search('a').map{|x| x.text.match(/...(\d+)/)[1] if x.text.match(/...(\d+)/)}.compact.length > 0
    loop do  
      page.search('article.grille-produit a').each do |x|
        ad_url = DOMAIN + x[:href]
        scrap_pc(ad_url.split('#').first)
      end
      break if current == number_max
      current += 1
      page = agent.get(URL.gsub("PAGE", current.to_s))
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

    page.search('div.carac .caracLine').each do |x|
      hash_second = {}
      x.search('div.caracDesc b').each{|x|(hash_second[x.text.gsub(":","").strip] = x.next_sibling.text) if x.next_sibling}
      hash_main[x.search('div.caracName').text.gsub(/\s+/,' ').gsub(":","").strip] = hash_second
    end
   
    pc[:url] = url
    pc[:price] = page.search(".priceFinal[itemprop='price']").text.gsub(/[[:space:]]/, '').to_f
    pc[:model] = page.search('h1.fn').text

    pc[:brand] = extract_from_hash(hash_main, "Marque") if hash_main["Marque"]
    pc[:model] = extract_from_hash(hash_main, "Modèle") if hash_main["Modèle"]
    pc[:model] = page.search(".fpLib").text.strip if page.search(".fpLib").text.strip != ""


    # Informations sur le système d'exploitation OK
    hash_os[:os_name] = extract_from_hash(hash_main["Système d'exploitation"], "OS").strip
    hash_os[:os_included] = extract_from_hash(hash_main["Système d'exploitation"], "OS") == "Sans OS" ? false : true
    
    

    # Informations sur le processeur
    hash_cpu[:cpu_name] = extract_from_hash(hash_main["Processeur"], "Type")
    hash_cpu[:cpu_model] = extract_from_hash(hash_main["Processeur"], "Processeur")
    hash_cpu[:cpu_brand] = extract_from_hash(hash_main["Processeur"], "Marque processeur")
    hash_cpu[:cpu_frequency] = extract_from_hash(hash_main["Processeur"], "Fréquence")
    #extraite et modifier dans computer  


    # Informations sur la mémoire
    hash_memory[:memory_strips] = extract_from_hash(hash_main["Mémoire (RAM)"], "Nombre de barrettes")
    hash_memory[:memory_size] = extract_from_hash(hash_main["Mémoire (RAM)"], "Taille de la mémoire")
    hash_memory[:memory_max_size] = extract_from_hash(hash_main["Mémoire (RAM)"], "Taille de mémoire Max")
    hash_memory[:memory_type] = extract_from_hash(hash_main["Mémoire (RAM)"], "Type")
    #extraite et modifier dans computer  


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
    hash_graphics[:gpu_name] = extract_from_hash(hash_main["Carte graphique"], "Type").strip
    hash_graphics[:gpu_memory_type] = (extract_from_hash(hash_main["Carte graphique"], "Mémoire").strip.match(/\d+ go (.+)/i)[1] rescue nil)


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
    pc[:main_photo] = page.search('div#productphoto a').first[:href] rescue nil

   # Objet final pour le Computer
   Computer.insert_pc(pc, 2)
 end


  # Extraire une valeur d'un hash
  def self.extract_from_hash haash, key
    ret_value = ''
    if key.length > 0 && haash && haash[key]
      ret_value = haash[key]
      haash.delete(key)
    end
    return ret_value
  end

end