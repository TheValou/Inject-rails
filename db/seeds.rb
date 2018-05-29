Computer.create!([
  {os_id: 1, cpu_id: 1, gpu_id: 1, activity_id: 1, chipset_id: 1, picture: "https://media.ldlc.com/ld/products/00/04/50/00/LD0004500021_2_0004630258_0004770561.jpg", designation: nil, model: "GL62M 7RDX-2613XFR", connector_available: nil, weight: nil, length: nil, width: nil, height: nil, memory_type: nil, memory_size: nil, memory_max_size: nil, keyboard_type: "AZERTY", keyboard_numpad: true, keyboard_light: true, screen_type: "LED", screen_resolution: "1920 x 1080 pixels", screen_refresh_rate: 60, screen_size: 15.0, screen_format: "16/9", network: nil, webcam: true, active: true, brand_id: 4},
  {os_id: 1, cpu_id: 1, gpu_id: 1, activity_id: 1, chipset_id: 1, picture: "https://media.ldlc.com/ld/products/00/04/50/00/LD0004500021_2_0004630258_0004770561.jpg", designation: nil, model: "GL62M 7RDX-2613XFR", connector_available: nil, weight: nil, length: nil, width: nil, height: nil, memory_type: nil, memory_size: nil, memory_max_size: nil, keyboard_type: "AZERTY", keyboard_numpad: true, keyboard_light: true, screen_type: "LED", screen_resolution: "1920 x 1080 pixels", screen_refresh_rate: 60, screen_size: 15.0, screen_format: "16/9", network: nil, webcam: true, active: true, brand_id: 5}
])
ComputersActivity.create!([
  {name: "N/A", description: nil}
])
ComputersBrand.create!([
  {name: "msi", description: nil},
  {name: "msi", description: nil},
  {name: "msi", description: nil},
  {name: "msi", description: nil},
  {name: "msi", description: nil}
])
ComputersChipset.create!([
  {name: "N/A", description: nil}
])
ComputersCpu.create!([
  {name: "Intel Core i5-7300HQ (Quad-Core 2.5 GHz / 3.5 GHz Turbo - Cache 6 Mo)", score: nil, description: nil}
])
ComputersGpu.create!([
  {name: "NVIDIA GeForce GTX 1050", score: nil, description: nil}
])
ComputersO.create!([
  {name: "N/A", description: nil}
])
ComputersPrice.create!([
  {computer_id: 5, trader_id: 3, url: "https://www.ldlc.com/fiche/PB00244028.html", pricing: {"2018-05-18T15:49:04+02:00"=>"699"}}
])
ComputersTrader.create!([
  {name: "LDLC", description: nil}
])
