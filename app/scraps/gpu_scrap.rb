class GpuScrap #< MainScraper::Scrap

  DOMAIN = "https://www.notebookcheck.net/"
  URL = "#{DOMAIN}/Mobile-Graphics-Cards-Benchmark-List.844.0.html?&3dmark13_cloud_gpu=1&archive=1&boostspeed=1&codename=1&corespeed=1&directx=1&gpu_fullname=1&memorybus=1&memoryspeed=1&memorytype=1&or=0&perfrating=1&showBars=1&showClassDescription=1&showCount=1&showPercent=1&sort=&type=gpu_fullname"
  
  def self.explore 
    agent = Mechanize.new
    page = agent.get(URL)
    
    gpus = []
    page.search("tr.odd").map{|x| gpus << x}
    page.search("tr.even").map{|x| gpus << x}

    gpus.each do |x| 
      note = x.at(".bl_ch_value").text.strip.to_f
      titre = x.at("td.specs a").text.gsub(/\(laptop\)/i,"").gsub(/\(notebook\)/i,"").strip
      gpu_search = ComputersGpu.where(name: titre)

      doc = agent.get(x.at("td.specs a")[:href])
      mem_type = (doc.search("tr.gpu-even").select{|x| x.at(".caption").text.match(/memory type/i)}.first.search("td").last.text rescue "")


      if gpu_search.length > 0
        gpu_search.first.update(score: note, memory_type: mem_type)
      else
        c = ComputersGpu.create_with(name: titre, score: note, memory_type: mem_type).find_or_create_by(name: titre)
      end
    end
    
  end

end
