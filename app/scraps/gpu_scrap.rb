class GpuScrap #< MainScraper::Scrap

  DOMAIN = "https://www.videocardbenchmark.net/"
  URL = "#{DOMAIN}high_end_gpus.html"
  

  def self.explore 
    agent = Mechanize.new

    page = agent.get(URL)
    
    page.at('table.chart').search('tr').each do |x|
      if x.at("td") && x.at('a')
        titre = x.at('a').text
        note = x.search("div.meter").text.gsub(/\s+/,"").gsub(",","").strip.to_i
        gpu_search = ComputersGpu.where("name  ~* ?", "#{titre}")
        if gpu_search.length > 0
          gpu_search.first.update(score: note)
        else
          c = ComputersGpu.create_with(name: titre, score: note).find_or_create_by(name: titre)
          c.update(score: note)
        end
      end
    end

  end

end
