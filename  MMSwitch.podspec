
Pod::Spec.new do |s|

  s.name         = "MMSwitch"
  s.version      = "1.2.2"
  s.summary      = "https://github.com/Objective-C-MMizogaki/MMSwitch"
  s.homepage     = "https://github.com/MMizogaki"
  s.license      = "MIT"
  s.author       = "MMizogaki"
  s.author       = { "MMizogaki" => "m.mizogaki.github@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = {:git => "https://github.com/Objective-C-MMizogaki/MMSwitch.git",:tag => "#{s.version.to_s}"}
  s.source_files = 'Classes/MMSwitch.{h,m}'
  s.frameworks   = 'QuartzCore'
  s.requires_arc = true

end
