class CpuScrap

  DOMAIN = "https://www.notebookcheck.net/"
  URL = "#{DOMAIN}/Mobile-Processors-Benchmark-List.2436.0.html?type=&sort=&archive=1&perfrating=1&or=0&showCount=1&showBars=1&showPercent=1&3dmark06cpu=1&cinebench10_s=1&cinebench10_m=1&cb11_single=1&cb11=1&cinebench_r15_single=1&cinebench_r15_multi=1&wprime_32=1&x264_pass1=1&x264_pass2=1&cpu_fullname=1&l2cache=1&l3cache=1&tdp=1&mhz=1&turbo_mhz=1&cores=1&threads=1"
  
  def self.explore 
    agent = Mechanize.new
    page = agent.get(URL)
    
    cpus = []
    page.search("tr.odd").map{|x| cpus << x}
    page.search("tr.even").map{|x| cpus << x}
    page.search("tr.desk_even").map{|x| cpus << x}
    page.search("tr.desk_odd").map{|x| cpus << x}

    cpus.each do |x| 
      note = x.at(".bl_ch_value").text.strip.to_f
      titre = x.at("td.specs a").text.gsub(/\(laptop\)/i,"").gsub(/\(notebook\)/i,"").strip rescue  nil
      titre = x.search("td.specs")[1].text.gsub(/\(laptop\)/i,"").gsub(/\(notebook\)/i,"").strip if titre.nil?
      cpu_search = ComputersCpu.where(name: titre)

      if cpu_search.length > 0
        cpu_search.first.update(score: note)
      else
        c = ComputersCpu.create_with(name: titre, score: note).find_or_create_by(name: titre)
      end
    end
    
  end

end