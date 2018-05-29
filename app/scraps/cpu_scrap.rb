class CpuScrap #< MainScraper::Scrap

  DOMAIN = "https://www.cpubenchmark.net/"
  URL = "#{DOMAIN}high_end_cpus.html"

  def self.explore 
    agent = Mechanize.new

    page = agent.get(URL)
    
    page.at('table.chart').search('tr').each do |x|
      if x.at("td") && x.at('a')
        titre = x.at('a').text
        note = x.search("div.meter").text.gsub(/\s+/,"").gsub(",","").strip.to_i
        gpu_search = ComputersCpu.where("name  ~* ?", "#{titre}")
        if gpu_search.length > 0
          gpu_search.first.update(score: note)
        else
          c = ComputersCpu.create_with(name: titre, score: note).find_or_create_by(name: titre)
          c.update(score: note)
        end
      end
    end
  end

end
