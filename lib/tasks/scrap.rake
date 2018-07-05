namespace :scrap do
    desc "Scrap all GPU"
    task gpu: :environment do
        GpuScrap.explore
    end

    desc "Scrap all CPU"
    task cpu: :environment do
        CpuScrap.explore
    end

    desc "Scrap all PC on LDLC"
    task ldlc: :environment do
        LdlcScrap.explore
    end

    desc "Scrap all PC on TopAchat"
    task topachat: :environment do
        TopAchatScrap.explore
    end

    desc "Scrap all PC on FNAC"
    task fnac: :environment do
        FnacScrap.explore
    end

    desc "Scrap all PC on Materiel.NET"
    task materiel: :environment do
        MaterielNetScrap.explore
    end
  
end